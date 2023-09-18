//
//  AuthenticationVM.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import Combine
import FirebaseAuth
import FirebaseFirestore

class AuthenticationVM: BaseVM {
    static let shared = AuthenticationVM()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: UserModel?
    
    var onChangeStateSignIn = PassthroughSubject<Bool, Never>()
    var onUpdateNotes = PassthroughSubject<[NoteModel], Never>()
    
    private let COLLECTION_USER = Firestore.firestore().collection("users")
    
    override init() {
        super.init()
        self.userSession = Auth.auth().currentUser
        
        Task {
            await self.fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            
            await self.fetchUser()
        } catch {
            print("Login failed: \(error.localizedDescription)")
        }
    }
    
    func registerUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            try await self.storeUserInfo(user: result.user, fullname: fullname, email: email)
            await self.fetchUser()
        } catch {
            print("Register failed: \(error.localizedDescription)")
        }
    }
    
    private func storeUserInfo(user: FirebaseAuth.User?, fullname: String, email: String) async throws {
        guard let user = user else { return }
        let userData = UserModel(id: user.uid, fullname: fullname, email: email, notes: []).asDict
        try await self.COLLECTION_USER.document(user.uid).setData(userData)
    }
    
    func save(note: NoteModel) async throws {
        do {
            guard let user = self.userSession else { return }
            
            let userDocRef = self.COLLECTION_USER.document(user.uid)
            try await userDocRef.updateData([
                "notes": FieldValue.arrayUnion([note.asDict])
            ])
            await self.fetchUser()
        } catch {
            print("AAA Save note falied: \(error.localizedDescription)")
        }
    }
    
    func update(note: NoteModel) async throws {
        do {
            guard let user = userSession else { return }
            
            let userDocRef = self.COLLECTION_USER.document(user.uid)
            var notes = self.currentUser?.notes ?? []
                    
            if let index = notes.firstIndex(where: { $0.id == note.id }) {
                notes[index] = note
                let notesData = notes.map { $0.asDict }

                try await userDocRef.updateData(["notes": notesData])
                await self.fetchUser()
            }
        } catch {
            print("AAA Failed to update note: \(error.localizedDescription)")
        }
    }
    
    func delete(note: NoteModel) async throws {
        do {
            guard let user = self.userSession else { return }
            
            let userDocRef = self.COLLECTION_USER.document(user.uid)
            var notes = self.currentUser?.notes ?? []
            
            if let index = notes.firstIndex(where: { $0.id == note.id }) {
                notes.remove(at: index)
                let notesData = notes.map { $0.asDict }
                
                try await userDocRef.updateData(["notes": notesData])
                await self.fetchUser()
            }
        } catch {
            print("AAA failed to delete note: \(error.localizedDescription)")
        }
    }
    
    func fetchUser() async {
        if let userId = userSession?.uid {
            do {
                let userDocument = try await COLLECTION_USER.document(userId).getDocument()
                
                guard let userData = userDocument.data(),
                      let id = userData["id"] as? String,
                      let fullname = userData["fullname"] as? String,
                      let email = userData["email"] as? String,
                      let notesData = userData["notes"] as? [[String: Any]]
                else { return }
                
                let notes = notesData.compactMap { data in
                    NoteModel(id: data["id"] as? String ?? "",
                              title: data["title"] as? String ?? "",
                              description: data["description"] as? String ?? "",
                              timestamp: data["timestamp"] as? Double ?? 0,
                              color: data["color"] as? Int ?? 0)
                }
                    
                self.currentUser = UserModel(id: id, fullname: fullname, email: email, notes: notes)
                self.onUpdateNotes.send(notes)
                
            } catch {
                print("Error fetching user: \(error.localizedDescription)")
            }
        }
    }
    
    func signOut() {
        self.userSession = nil
        self.currentUser = nil
        do {
            try Auth.auth().signOut()
        } catch {}
    }
    
    func deleteAccount() {}
}

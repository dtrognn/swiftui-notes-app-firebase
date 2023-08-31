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
    
    var onChangeStateSignIn = PassthroughSubject<Bool, Never>()
    
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: UserModel?
    
    override init() {
        super.init()
        self.userSession = Auth.auth().currentUser
    }
    
    func signIn(withEmail email: String, password: String) async throws {
        print("AAA sign in")
    }
    
    func registerUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            
            let user = UserModel(id: result.user.uid, fullname: fullname, email: email)
            try await Firestore.firestore().collection("users").document(user.id).setData(["id": user.id,
                                                                                           "fullname": user.fullname,
                                                                                           "email": user.email])
        } catch {
            print("Register failed: \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        self.userSession = nil
        do {
            try Auth.auth().signOut()
        } catch {}
    }
    
    func deleteAccount() {}
    
    func fetchUser() async {}
}

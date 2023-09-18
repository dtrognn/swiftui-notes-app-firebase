//
//  CreateNoteVM.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import FirebaseFirestore
import Foundation

class CreateNoteVM: BaseVM {
    @Published var title: String = ""
    @Published var description: String = ""
    @Published var timestamp: String = ""
    @Published var isEnable: Bool = true
    
    @Published var currentUser: UserModel?
    
    private let service = AuthenticationVM.shared
    
    override func loadData() {
        service.$currentUser.sink { [weak self] currentUser in
            DispatchQueue.main.async {
                self?.currentUser = currentUser
            }
        }.store(in: &cancellableSet)
    }
    
    func save() async throws {
        let note = NoteModel(id: UUID().uuidString, title: title, description: description, timestamp: getCurrentTime().toTimestampDouble() ?? 0)
        
        try await service.save(note: note)
    }
    
    private func getCurrentTime() -> String {
        let date = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = DateFormatType.full.rawValue
        return timeFormatter.string(from: date)
    }
}

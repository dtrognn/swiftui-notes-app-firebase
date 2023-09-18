//
//  HomeVM.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import FirebaseFirestore
import Foundation

class HomeVM: BaseVM {
    @Published var notes: [NoteModel] = []

    let service = AuthenticationVM.shared

    override func loadData() {
        service.onUpdateNotes.sink { [weak self] notes in
            DispatchQueue.main.async {
                self?.notes = notes
            }
        }.store(in: &cancellableSet)
    }

    func delete(note: NoteModel) async throws {
        try await service.delete(note: note)
    }
}

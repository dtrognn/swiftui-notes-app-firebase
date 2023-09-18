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

    override func loadData() {
        AuthenticationVM.shared.onUpdateNotes.sink { [weak self] notes in
            DispatchQueue.main.async {
                self?.notes = notes
            }
        }.store(in: &cancellableSet)
    }
}

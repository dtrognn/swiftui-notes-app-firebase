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
    @Published var alert = Alert(title: "Error", message: "")
    @Published var isShowError: Bool = false

    let service = AuthenticationVM.shared

    override init() {
        super.init()
    }

    override func loadData() {
        service.onUpdateNotes.sink { [weak self] notes in
            DispatchQueue.main.async {
                self?.notes = notes
            }
        }.store(in: &cancellableSet)
    }

    override func subcribe() {
        service.onReceiveError.sink { [weak self] error in
            self?.alert.message = error
            self?.isShowError = true
        }.store(in: &cancellableSet)
    }

    func delete(note: NoteModel) async throws {
        try await service.delete(note: note)
    }
}

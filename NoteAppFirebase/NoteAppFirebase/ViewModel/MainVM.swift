//
//  MainVM.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 31/08/2023.
//

import FirebaseAuth
import Foundation

class MainVM: BaseVM {
    private let service = AuthenticationVM.shared

    @Published var userSession: FirebaseAuth.User?

    override func loadData() {
        service.$userSession.sink { [weak self] userSession in
            DispatchQueue.main.async {
                self?.userSession = userSession
            }
        }.store(in: &cancellableSet)
    }
}

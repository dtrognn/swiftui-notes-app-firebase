//
//  ProfileVM.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import Foundation

class ProfileVM: BaseVM {
    private let service = AuthenticationVM.shared

    @Published var isEnableButton: Bool = true
    @Published var currentUser: UserModel?

    func signOut() {
        AuthenticationVM.shared.signOut()
    }

    override func makeSubscription() {
        service.$currentUser.sink { [weak self] currentUser in
            guard let currentUser = currentUser else { return }
            self?.currentUser = currentUser
        }.store(in: &cancellableSet)
    }
}

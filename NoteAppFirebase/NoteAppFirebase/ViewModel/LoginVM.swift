//
//  LoginVM.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import Combine
import Foundation

class LoginVM: BaseVM {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isEnableButton: Bool = false

    override init() {
        super.init()
        makeSubscription()
    }

    func signIn() async throws {
        try await AuthenticationVM.shared.signIn(withEmail: email, password: password)
    }

    override func makeSubscription() {
        Publishers.CombineLatest($email, $password).map { email, password in
            self.validate(email) && self.validate(password)
        }.assign(to: &$isEnableButton)
    }

    private func validate(_ input: String) -> Bool {
        return UtilsHelper.validate(input)
    }
}

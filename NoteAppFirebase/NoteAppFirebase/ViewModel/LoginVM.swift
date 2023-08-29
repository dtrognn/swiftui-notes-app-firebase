//
//  LoginVM.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import Combine
import Foundation

class LoginVM: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isEnableButton: Bool = false

    init() {
        makeSubscription()
    }

    private func makeSubscription() {
        Publishers.CombineLatest($email, $password).map { email, password in
            self.validate(email) && self.validate(password)
        }.assign(to: &$isEnableButton)
    }

    private func validate(_ input: String) -> Bool {
        return UtilsHelper.validate(input)
    }
}

//
//  RegisterVM.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import Combine
import Foundation

class RegisterVM: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var isEnableButton: Bool = false

    init() {
        makeSubscription()
    }

    private func makeSubscription() {
        Publishers.CombineLatest3($email, $password, $confirmPassword).map { email, password, confirmPassword in
            self.validate(email) && self.validate(password) && self.validate(confirmPassword) && password == confirmPassword
        }.assign(to: &$isEnableButton)
    }

    private func validate(_ input: String) -> Bool {
        return UtilsHelper.validate(input)
    }
}

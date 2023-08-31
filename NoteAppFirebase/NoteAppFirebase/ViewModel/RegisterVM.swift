//
//  RegisterVM.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import Combine
import FirebaseAuth

class RegisterVM: AuthenticationVM {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""
    @Published var fullname: String = ""
    @Published var isEnableButton: Bool = false

    override init() {
        super.init()
        makeSubscription()
    }

    func registerUser() async throws {
        try await AuthenticationVM.shared.registerUser(withEmail: email, password: password, fullname: fullname)
    }

//    func registerUser() async throws {
//        try await registerUser(withEmail: email, password: password, fullname: fullname)
//    }

    override func makeSubscription() {
        Publishers.CombineLatest3($email, $password, $confirmPassword).map { email, password, confirmPassword in
            self.validate(email) && self.validate(password) && self.validate(confirmPassword) && password == confirmPassword
        }.assign(to: &$isEnableButton)
    }

    private func validate(_ input: String) -> Bool {
        return UtilsHelper.validate(input)
    }
}

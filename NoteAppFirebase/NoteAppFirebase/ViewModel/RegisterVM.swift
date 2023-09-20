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
    @Published var alert = Alert(title: "Register error", message: "")
    @Published var isShowError: Bool = false

    override init() {
        super.init()
    }

    func registerUser() async throws {
        try await AuthenticationVM.shared.registerUser(withEmail: email, password: password, fullname: fullname)
    }

    override func subcribe() {
        AuthenticationVM.shared.onReceiveError.sink { [weak self] error in
            self?.alert.message = error
            self?.isShowError = true
        }.store(in: &cancellableSet)
    }

    override func makeSubscription() {
        Publishers.CombineLatest3($email, $password, $confirmPassword).map { email, password, confirmPassword in
            self.validate(email) && self.validate(password) && self.validate(confirmPassword) && password == confirmPassword
        }.assign(to: &$isEnableButton)
    }

    private func validate(_ input: String) -> Bool {
        return UtilsHelper.validate(input)
    }
}

//
//  LoginView.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginVM()

    var body: some View {
        VStack(spacing: AppConfig.layout.hugeSpace) {
            VStack(spacing: AppConfig.layout.zero) {
                VStack {
                    signInToAccount
                }.padding(.horizontal, AppConfig.layout.standardSpace)
            }.frame(height: UIScreen.main.bounds.height / 4)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(AppConfig.theme.authenticationBackgroundColor)

            VStack(spacing: AppConfig.layout.hugeSpace) {
                VStack(alignment: .trailing, spacing: AppConfig.layout.standardSpace) {
                    emailView
                    passwordView
                    forgotPasswordButton
                }
                loginButton

                Spacer()
                registerView
            }.edgesIgnoringSafeArea(.all)
                .padding(.horizontal, AppConfig.layout.standardSpace)
        }
    }
}

private extension LoginView {
    var emailView: some View {
        VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
            emailText
            emailTextField
        }
    }

    var emailTextField: some View {
        CommonTextField(textInput: $viewModel.email,
                        placeholder: "Enter your email")
    }

    var passwordView: some View {
        VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
            passwordText
            passwordSecureField
        }
    }

    var passwordSecureField: some View {
        CommonSecureField(textInput: $viewModel.password,
                          placeholder: "Enter your password")
    }

    var loginButton: some View {
        CommonButton(text: "Login", isEnable: $viewModel.isEnableButton) {
            // TODO: - Login
        }
    }

    var registerView: some View {
        HStack(spacing: AppConfig.layout.smallSpace) {
            dontHaveAccountText
            registerButton
        }.padding(.bottom, AppConfig.layout.bottomButtonSpace)
    }

    var registerButton: some View {
        Button {
            // TODO: - Route to Register screen
        } label: {
            NavigationLink(destination: RegisterView()) {
                Text("Register")
                    .font(AppConfig.font.medium16)
                    .foregroundColor(AppConfig.theme.iconColor)
            }
        }
    }

    var forgotPasswordButton: some View {
        Button {
            // TODO: - Handle Forgot Password
        } label: {
            Text("Forgot password?")
                .font(AppConfig.font.medium16)
                .foregroundColor(AppConfig.theme.textUnderlineColor)
        }
    }
}

// MARK: - Text

private extension LoginView {
    var dontHaveAccountText: some View {
        Text("Don't have an account?")
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.textNormalColor)
    }

    var signInToAccount: some View {
        Text("Sign in to your account")
            .font(AppConfig.font.bold40)
            .foregroundColor(AppConfig.theme.whiteTextColor)
    }

    var emailText: some View {
        Text("Email")
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.textNormalColor)
    }

    var passwordText: some View {
        Text("Password")
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.textNormalColor)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

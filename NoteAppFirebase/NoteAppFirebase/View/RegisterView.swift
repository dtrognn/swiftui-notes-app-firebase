//
//  RegisterView.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject private var viewModel = RegisterVM()
    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        ScrollView {
            VStack(spacing: AppConfig.layout.hugeSpace) {
                VStack(spacing: AppConfig.layout.hugeSpace) {
                    navigationView

                    VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
                        registerText
                        createAnAccountText
                    }.frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, AppConfig.layout.standardSpace)
                        .padding(.bottom, AppConfig.layout.hugeSpace)
                        .padding(.bottom, AppConfig.layout.hugeSpace)
                }.background(AppConfig.theme.authenticationBackgroundColor)

                VStack(spacing: AppConfig.layout.hugeSpace) {
                    VStack(spacing: AppConfig.layout.standardSpace) {
                        fullnameView
                        emailView
                        passwordView
                        confirmPasswordView
                    }
                    registerButton
                    Spacer()
                    registerView
                }
                .padding(.horizontal, AppConfig.layout.standardSpace)
            }.alert(viewModel.alert.title, isPresented: $viewModel.isShowError, presenting: viewModel.alert) { _ in
                Button("Dismiss", role: .cancel) {}
            } message: { alert in
                Text(alert.message)
            }
        }.edgesIgnoringSafeArea(.all)
            .navigationBarBackButtonHidden(true)
    }
}

private extension RegisterView {
    var registerButton: some View {
        CommonButton(text: "Register", isEnable: $viewModel.isEnableButton) {
            Task {
                try await viewModel.registerUser()
            }
        }
    }
}

private extension RegisterView {
    var navigationView: some View {
        HStack(spacing: AppConfig.layout.zero) {
            backButton
            Spacer()
        }.padding(.top, AppConfig.layout.bottomButtonSpace)
    }

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

    var fullnameView: some View {
        VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
            fullnameText
            fullnameTextField
        }
    }

    var fullnameTextField: some View {
        CommonTextField(textInput: $viewModel.fullname,
                        placeholder: "Enter your full name")
    }

    var confirmPasswordView: some View {
        VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
            confirmPasswordText
            confirmPasswordSecureField
        }
    }

    var confirmPasswordSecureField: some View {
        CommonSecureField(textInput: $viewModel.confirmPassword, placeholder: "Confirm Password")
    }

    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.backward")
                .renderingMode(.template)
                .foregroundColor(AppConfig.theme.whiteTextColor)
                .padding(.all, AppConfig.layout.standardSpace)
        }
    }

    var registerView: some View {
        HStack(spacing: AppConfig.layout.smallSpace) {
            iHaveAccountText
            loginButton
        }.padding(.bottom, AppConfig.layout.bottomButtonSpace)
    }

    var loginButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Text("Login")
                .font(AppConfig.font.medium16)
                .foregroundColor(AppConfig.theme.iconColor)
        }
    }
}

private extension RegisterView {
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

    var confirmPasswordText: some View {
        Text("Confirm Password")
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.textNormalColor)
    }

    var fullnameText: some View {
        Text("Full name")
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.textNormalColor)
    }

    var iHaveAccountText: some View {
        Text("I have an account?")
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.textNormalColor)
    }

    var registerText: some View {
        Text("REGISTER")
            .font(AppConfig.font.bold40)
            .foregroundColor(AppConfig.theme.whiteTextColor)
    }

    var createAnAccountText: some View {
        Text("Create an account")
            .font(AppConfig.font.medium20)
            .foregroundColor(AppConfig.theme.textNoteColor)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

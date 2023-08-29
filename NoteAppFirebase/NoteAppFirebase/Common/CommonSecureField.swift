//
//  CommonSecureField.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import SwiftUI

struct CommonSecureField: View {
    @Binding var textInput: String
    var placeholder: String

    @State private var isSecure: Bool = true

    var body: some View {
        VStack {
            ZStack {
                backgroundFrame

                ZStack(alignment: .trailing) {
                    if !isSecure {
                        textField
                    } else {
                        secureField
                    }

                    if !textInput.isEmpty {
                        showHiddenPassButton
                    }
                }.padding(.horizontal, AppConfig.layout.mediumSpace)
            }
        }
    }
}

private extension CommonSecureField {
    var textField: some View {
        TextField(placeholder, text: $textInput)
            .padding(.horizontal, AppConfig.layout.mediumSpace)
            .font(AppConfig.font.regular16)
            .autocapitalization(.none)
    }
    
    var secureField: some View {
        SecureField(placeholder, text: $textInput)
            .padding(.horizontal, AppConfig.layout.mediumSpace)
            .font(AppConfig.font.regular16)
            .autocapitalization(.none)
            
    }

    var backgroundFrame: some View {
        RoundedRectangle(cornerRadius: AppConfig.layout.standardCornerRadius, style: .continuous)
            .stroke(AppConfig.theme.iconColor, lineWidth: AppConfig.layout.lineWidth)
            .frame(height: AppConfig.layout.standardTextFieldHeight)
    }

    var showHiddenPassButton: some View {
        Button {
            isSecure.toggle()
        } label: {
            Image(systemName: isSecure ? "eye.fill" : "eye.slash.fill")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(AppConfig.theme.iconColor)
                .frame(width: 28, height: 18)
        }
    }
}

struct CommonSecureField_Previews: PreviewProvider {
    static var previews: some View {
        CommonSecureField(textInput: .constant(""), placeholder: "Enter yout password")
    }
}

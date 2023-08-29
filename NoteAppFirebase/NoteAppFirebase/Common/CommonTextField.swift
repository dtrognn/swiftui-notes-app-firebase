//
//  CommonTextField.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import SwiftUI

struct CommonTextField: View {
    @Binding var textInput: String
    var placeholder: String

    var body: some View {
        VStack {
            ZStack {
                backgroundFrame

                ZStack(alignment: .trailing) {
                    textField

                    if !textInput.isEmpty {
                        clearButton
                    }
                }.padding(.horizontal, AppConfig.layout.mediumSpace)
            }
        }
    }
}

private extension CommonTextField {
    var textField: some View {
        TextField(placeholder, text: $textInput)
            .padding(.horizontal, AppConfig.layout.mediumSpace)
            .font(AppConfig.font.regular16)
            .autocapitalization(.none)
    }
    
    var backgroundFrame: some View {
        RoundedRectangle(cornerRadius: AppConfig.layout.standardCornerRadius, style: .continuous)
            .stroke(AppConfig.theme.iconColor, lineWidth: AppConfig.layout.lineWidth)
            .frame(height: AppConfig.layout.standardTextFieldHeight)
    }

    var clearButton: some View {
        Button {
            textInput = ""
        } label: {
            Image(systemName: "xmark.circle.fill")
                .resizable()
                .renderingMode(.template)
                .foregroundColor(AppConfig.theme.iconColor)
                .frame(width: 24, height: 24)
        }
    }
}

struct CommonTextField_Previews: PreviewProvider {
    static var previews: some View {
        CommonTextField(textInput: .constant(""),
                        placeholder: "Enter your email")
    }
}

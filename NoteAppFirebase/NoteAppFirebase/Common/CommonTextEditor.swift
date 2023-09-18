//
//  CommonTextEditor.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 02/09/2023.
//

import SwiftUI

struct CommonTextEditor: View {
    @Binding var text: String
    var placeholder: String
    var height: CGFloat

    var body: some View {
        ZStack {
//            Color.gray
            ZStack {
                background
                ZStack(alignment: .topLeading) {
                    textEditorView
                    if text.isEmpty {
                        placeholderText
                    }
                }
            }
        }
    }
}

private extension CommonTextEditor {
    var background: some View {
        RoundedRectangle(cornerRadius: AppConfig.layout.standardCornerRadius)
            .stroke(AppConfig.theme.iconColor, lineWidth: AppConfig.layout.lineWidth)
            .frame(height: height)
    }

    var textEditorView: some View {
        TextEditor(text: $text)
            .frame(height: height - 3)
            .cornerRadius(AppConfig.layout.standardCornerRadius)
            .padding(.horizontal, 2)
    }

    var placeholderText: some View {
        Text(placeholder)
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.textNoteColor)
            .padding(.top, AppConfig.layout.mediumSpace)
            .padding(.leading, AppConfig.layout.mediumSpace)
    }
}

struct CommonTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        CommonTextEditor(text: .constant("sdadadadadasd"),
                         placeholder: "Enter your title",
                         height: 100)
    }
}

//
//  CreateNoteView.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import SwiftUI

struct CreateNoteView: View {
    @StateObject private var viewModel: CreateNoteVM
    @Environment(\.presentationMode) var presentationMode
    
    init(note: NoteModel? = nil) {
        _viewModel = StateObject(wrappedValue: CreateNoteVM(selectedModel: note))
    }

    var body: some View {
        ZStack {
            AppConfig.theme.backgroundColor.edgesIgnoringSafeArea(.all)

            VStack(spacing: AppConfig.layout.zero) {
                navigationView
                ScrollView(showsIndicators: false) {
                    VStack(spacing: AppConfig.layout.standardSpace) {
                        titleView
                        descriptionView
                        saveButton
                    }.padding(.horizontal, AppConfig.layout.standardSpace)
                }.padding(.vertical, AppConfig.layout.standardSpace)
            }
        }.navigationBarBackButtonHidden()
    }
}

private extension CreateNoteView {
    var titleView: some View {
        VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
            titleText
            titleTextEditor
        }
    }
    
    var descriptionView: some View {
        VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
            descriptionText
            descriptionTextEditor
        }
    }
    
    var titleTextEditor: some View {
        CommonTextEditor(text: $viewModel.title,
                         placeholder: "Enter your title",
                         height: 100)
    }
    
    var descriptionTextEditor: some View {
        CommonTextEditor(text: $viewModel.description,
                         placeholder: "Enter your description",
                         height: 200)
    }
    
    var saveButton: some View {
        CommonButton(text: "Save", isEnable: $viewModel.isEnable) {
            Task {
                try await viewModel.save()
            }
            presentationMode.wrappedValue.dismiss()
        }
    }
}

private extension CreateNoteView {
    var navigationView: some View {
        HStack(spacing: AppConfig.layout.zero) {
            backButton
            Spacer()
            createNoteText
            Spacer()
        }
    }

    var backButton: some View {
        Button {
            presentationMode.wrappedValue.dismiss()
        } label: {
            Image(systemName: "chevron.backward")
                .renderingMode(.template)
                .foregroundColor(AppConfig.theme.textNormalColor)
                .padding(.all, AppConfig.layout.standardSpace)
        }
    }

    var createNoteText: some View {
        Text("Create Note")
            .font(AppConfig.font.bold20)
            .foregroundColor(AppConfig.theme.textNormalColor)
            .padding(.trailing, AppConfig.layout.hugeSpace)
    }
    
    var titleText: some View {
        Text("Title")
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.textNormalColor)
    }
    
    var descriptionText: some View {
        Text("Description")
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.textNormalColor)
    }
}

struct CreateNoteView_Previews: PreviewProvider {
    static var previews: some View {
        CreateNoteView()
    }
}

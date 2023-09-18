//
//  NoteItemView.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 01/09/2023.
//

import SwiftUI

struct NoteItemView: View {
    var item: NoteModel
    var onTap: () -> Void

    var body: some View {
        Button {
            onTap()
        } label: {
            VStack(spacing: AppConfig.layout.zero) {
                VStack(alignment: .leading, spacing: AppConfig.layout.mediumSpace) {
                    title
                    date
                    description
                }.padding(.all, AppConfig.layout.standardSpace)
            }.frame(maxWidth: .infinity, alignment: .leading)
                .background(colorFrom(rawvalue: item.color))
                .cornerRadius(AppConfig.layout.standardCornerRadius)
        }
    }
}

private extension NoteItemView {
    var title: some View {
        Text(item.title)
            .font(AppConfig.font.medium16)
            .foregroundColor(AppConfig.theme.whiteTextColor)
            .lineLimit(2)
            .multilineTextAlignment(.leading)
    }

    var date: some View {
        Text(item.timestamp.toString(format: .full))
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.textNoteColor)
    }

    var description: some View {
        Text(item.description)
            .font(AppConfig.font.regular16)
            .foregroundColor(AppConfig.theme.whiteTextColor)
            .multilineTextAlignment(.leading)
    }

    func colorFrom(rawvalue: Int) -> Color? {
        if let color = NoteColor(rawValue: rawvalue)?.getColor() {
            return color
        }
        return nil
    }
}

struct NoteItemView_Previews: PreviewProvider {
    static var previews: some View {
        NoteItemView(item: NoteModel(id: UUID().uuidString, title: "Vu Duc Trong Vu Duc Trong Vu Duc Trong Vu Duc Trong Vu Duc Trong", description: " dasdasd sdsadas dsadas adasd  dasdasd sdsadas dsadas adasd  dasdasd sdsadas dsadas adasd", timestamp: 1693554563, color: 2), onTap: {})
    }
}

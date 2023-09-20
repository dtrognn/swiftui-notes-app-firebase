//
//  SelectColorView.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 18/09/2023.
//

import SwiftUI

struct SelectColorView: View {
    @ObservedObject var viewModel = CreateNoteVM()

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack {
                ForEach(viewModel.arrColor, id: \.self) { color in
                    SelectColorItemView(color: color,
                                        selectedColor: viewModel.selectedColor)
                    {
                        viewModel.selectedColor = color
                    }
                }
            }
        }
        .frame(height: 50)
        .padding(.all, AppConfig.layout.standardSpace)
    }
}

struct SelectColorView_Previews: PreviewProvider {
    static var previews: some View {
        SelectColorView()
    }
}

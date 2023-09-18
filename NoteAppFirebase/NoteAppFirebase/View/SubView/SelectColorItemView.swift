//
//  SelectColorItemView.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 18/09/2023.
//

import SwiftUI

struct SelectColorItemView: View {
    var color: NoteColor
    var selectedColor: NoteColor
    var action: () -> Void

    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                Circle()
                    .frame(width: 30, height: 30)
                    .foregroundColor(color.getColor())

                if selectedColor == color {
                    Circle()
                        .stroke(selectedColor.getColor(), lineWidth: 2)
                        .frame(width: 35, height: 35)
                }
            }
        }
    }
}

struct SelectColorItemView_Previews: PreviewProvider {
    static var previews: some View {
        SelectColorItemView(color: .color1, selectedColor: .color1, action: {})
    }
}

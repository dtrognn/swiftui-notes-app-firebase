//
//  NoteTabView.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import SwiftUI

struct NoteTabView: View {
    @State private var tabSelected: Int = 0

    var body: some View {
        VStack(spacing: AppConfig.layout.zero) {
            switch tabSelected {
            case 0:
                HomeView()
            case 1:
                ProfileView()
            default:
                EmptyView()
            }

            StraightLine()
            HStack {
                Spacer()
                homeTabView
                Spacer()
                userTabView
                Spacer()

            }.padding(.bottom, AppConfig.layout.standardSpace)
                .padding(.top, AppConfig.layout.mediumSpace)
                .background(AppConfig.theme.lineColor)

        }.edgesIgnoringSafeArea(.all)
    }
}

private extension NoteTabView {
    var homeTabView: some View {
        VStack(spacing: AppConfig.layout.mediumSpace) {
            homeButton
            homeText
        }
    }

    var userTabView: some View {
        VStack(spacing: AppConfig.layout.mediumSpace) {
            userButton
            userText
        }
    }

    var homeButton: some View {
        Button {
            tabSelected = 0
        } label: {
            Image(systemName: "house.circle.fill")
                .resizable()
                .renderingMode(.template)
                .frame(width: 30, height: 30)
                .foregroundColor(tabSelected == 0 ? AppConfig.theme.iconColor : AppConfig.theme.textNoteColor)
        }
    }

    var userButton: some View {
        Button {
            tabSelected = 1
        } label: {
            Image(systemName: "person.circle")
                .resizable()
                .renderingMode(.template)
                .frame(width: 30, height: 30)
                .foregroundColor(tabSelected == 1 ? AppConfig.theme.iconColor : AppConfig.theme.textNoteColor)
        }
    }

    var homeText: some View {
        Text("Home")
            .font(AppConfig.font.medium16)
            .foregroundColor(tabSelected == 0 ? AppConfig.theme.iconColor : AppConfig.theme.textNoteColor)
    }

    var userText: some View {
        Text("User")
            .font(AppConfig.font.medium16)
            .foregroundColor(tabSelected == 1 ? AppConfig.theme.iconColor : AppConfig.theme.textNoteColor)
    }
}

struct NoteTabView_Previews: PreviewProvider {
    static var previews: some View {
        NoteTabView()
    }
}

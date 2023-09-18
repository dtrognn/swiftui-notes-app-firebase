//
//  HomeView.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeVM()

    var body: some View {
        ZStack {
            AppConfig.theme.backgroundColor.edgesIgnoringSafeArea(.top)

            ZStack(alignment: .bottomTrailing) {
                VStack(spacing: AppConfig.layout.zero) {
                    homeTextHeader
                    ScrollView(showsIndicators: false) {
                        VStack {
                            LazyVStack(spacing: AppConfig.layout.standardSpace) {
                                ForEach(viewModel.notes) { note in
                                    NoteItemView(item: note)
                                }
                            }

                            Spacer()
                        }.padding(.horizontal, AppConfig.layout.standardSpace)
                    }.padding(.vertical, AppConfig.layout.standardSpace)
                }

                createNoteButton
            }
        }
    }
}

private extension HomeView {
    var homeTextHeader: some View {
        Text("Note Recent")
            .font(AppConfig.font.bold20)
            .foregroundColor(AppConfig.theme.textNormalColor)
            .padding(.top, AppConfig.layout.mediumSpace)
            .padding(.top, AppConfig.layout.bottomButtonSpace)
    }

    var createNoteButton: some View {
        Button {} label: {
            NavigationLink(destination: CreateNoteView()) {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(AppConfig.theme.iconColor)
                    .frame(width: 50, height: 50)
                    .padding(.trailing, AppConfig.layout.standardSpace)
                    .padding(.bottom, AppConfig.layout.standardSpace)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

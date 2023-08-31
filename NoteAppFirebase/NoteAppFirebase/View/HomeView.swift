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
            
            VStack(spacing: AppConfig.layout.zero) {
                homeTextHeader
                ScrollView {
                    VStack {
                        // content
                        Spacer()
                    }
                }.padding(.top, AppConfig.layout.standardSpace)
            }
        }
    }
}

private extension HomeView {
    var homeTextHeader: some View {
        Text("Note Recent")
            .font(AppConfig.font.bold20)
            .padding(.vertical, AppConfig.layout.mediumSpace)
            .padding(.top, AppConfig.layout.bottomButtonSpace)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

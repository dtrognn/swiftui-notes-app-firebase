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
        VStack {
            logoutButton
        }.padding(.horizontal, AppConfig.layout.standardSpace)
    }
}

private extension HomeView {
    var logoutButton: some View {
        CommonButton(text: "Sign out", isEnable: $viewModel.isEnableButton) {
            viewModel.signOut()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

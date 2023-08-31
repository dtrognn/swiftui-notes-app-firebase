//
//  MainView.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainVM()

    var body: some View {
        Group {
            if viewModel.userSession != nil {
                NoteTabView()
            } else {
                LoginView()
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

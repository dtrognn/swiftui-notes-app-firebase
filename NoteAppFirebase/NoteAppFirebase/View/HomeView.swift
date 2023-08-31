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
            Spacer()
        }
    }
}

private extension HomeView {}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

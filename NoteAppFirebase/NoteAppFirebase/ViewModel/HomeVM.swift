//
//  HomeVM.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import Foundation

class HomeVM: BaseVM {
    @Published var isEnableButton: Bool = true
    
    func signOut() {
        AuthenticationVM.shared.signOut()
    }
}

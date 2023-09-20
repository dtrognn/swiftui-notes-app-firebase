//
//  File.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 20/09/2023.
//

import Foundation

struct Alert: Identifiable {
    let id = UUID().uuidString
    var title: String
    var message: String
}

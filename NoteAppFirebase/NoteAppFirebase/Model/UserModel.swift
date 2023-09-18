//
//  UserModel.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import Foundation

struct UserModel: Identifiable, Codable {
    let id: String
    let fullname: String
    let email: String
    let notes: [NoteModel]

    var initrials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullname) {
            formatter.style = .abbreviated

            return formatter.string(from: components)
        }

        return ""
    }

    var asDict: [String: Any] {
        return [
            "id": id,
            "fullname": fullname,
            "email": email,
            "notes": notes
        ]
    }
}

extension UserModel {
//    var MOCK_USER = UserModel(id: UUID().uuidString, fullname: "Duc Trong", email: "dtrognn@gmail.com")
}

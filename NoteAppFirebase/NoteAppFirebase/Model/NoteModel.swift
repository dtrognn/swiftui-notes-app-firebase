//
//  NoteModel.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import SwiftUI

enum NoteColor: Int, Codable {
    case color1 = 1
    case color2 = 2
    case color3 = 3
    case color4 = 4
    case color5 = 5
    case color6 = 6
    case color7 = 7
    case color8 = 8
    case color9 = 9
    case color10 = 10

    func getColor() -> Color {
        switch self {
        case .color1:
            return AppConfig.theme.chooseColor1
        case .color2:
            return AppConfig.theme.chooseColor2
        case .color3:
            return AppConfig.theme.chooseColor3
        case .color4:
            return AppConfig.theme.chooseColor4
        case .color5:
            return AppConfig.theme.chooseColor5
        case .color6:
            return AppConfig.theme.chooseColor6
        case .color7:
            return AppConfig.theme.chooseColor7
        case .color8:
            return AppConfig.theme.chooseColor8
        case .color9:
            return AppConfig.theme.chooseColor9
        case .color10:
            return AppConfig.theme.chooseColor10
        }
    }
}

struct NoteModel: Codable, Identifiable {
    var id: String
    var title: String
    var description: String
    var timestamp: Double
    var color: Int

    var asDict: [String: Any] {
        return [
            "id": id,
            "title": title,
            "description": description,
            "timestamp": timestamp,
            "color": color
        ]
    }
}

//
//  AppConfig.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import Foundation

public struct AppConfig {
    public static var font: INoteAppFont = NoteAppFont()
    public static var theme: INoteAppTheme = NoteAppTheme()
    public static var layout: INoteAppLayout = NoteAppLayout()

    public init() {}
}

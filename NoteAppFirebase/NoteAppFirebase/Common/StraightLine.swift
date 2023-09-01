//
//  StraightLine.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 01/09/2023.
//

import SwiftUI

public struct StraightLine: View {
    public init() {}

    public var body: some View {
        Divider().frame(height: 1)
            .foregroundColor(AppConfig.theme.lineColor)
    }
}

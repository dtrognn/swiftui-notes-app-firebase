//
//  Utils.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 28/08/2023.
//

import Foundation

public class UtilsHelper {
    static func validate(_ input: String) -> Bool {
        return input.count >= 6
    }
}

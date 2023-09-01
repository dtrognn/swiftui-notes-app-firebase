//
//  Double+Ext.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 01/09/2023.
//

import Foundation

enum DateFormatType: String {
    case dayMonthYear = "dd/MM/yyyy"
}

extension Double {
    func toString(format: DateFormatType) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        let date = Date(timeIntervalSince1970: self)
        return dateFormatter.string(from: date)
    }
}

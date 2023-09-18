//
//  String+Ext.swift
//  NoteAppFirebase
//
//  Created by dtrognn on 02/09/2023.
//

import Foundation

extension String {
    func toTimestampDouble() -> Double? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = DateFormatType.full.rawValue

        if let date = dateFormatter.date(from: self) {
            let timestamp = date.timeIntervalSince1970
            return timestamp
        }

        return nil
    }
}

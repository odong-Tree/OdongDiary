//
//  Date+.swift
//  OdongDiary
//
//  Created by odongnamu on 2022/08/31.
//

import Foundation

extension Date {
    func convertToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy.MM.dd"
        
        return formatter.string(from: self)
    }
}

//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/23.
//

import Foundation

extension DateFormatter {
    static var yyyyMMddHHmmFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMddHHmm"
        return formatter
    }
}

extension Date {
    
    var hour : Int {
        Calendar.current.component(.hour, from: self)
    }
    
    var minute : Int {
        Calendar.current.component(.minute, from: self)
    }

}

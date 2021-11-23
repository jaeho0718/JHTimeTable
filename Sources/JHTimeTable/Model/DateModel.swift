//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/23.
//

import Foundation

extension DateFormatter {
    
    /// yyyyMMdd의 포맷타입을 가진 DateFormatter입니다.
    static var yyyymmddFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYYMMdd"
        return formatter
    }
    
    /// HHmm의 포맷타입을 가진 DateFormatter입니다.
    static var hhmmFormatter : DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HHmm"
        return formatter
    }
    
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
    
    var currentDate : Date? {
        let hhmm = DateFormatter.hhmmFormatter.string(from: self)
        let result = DateFormatter.yyyyMMddHHmmFormatter
                                .date(from: "20010101\(hhmm)")
        return result
    }
}

extension Date {
    //test data
    static var testStartTime : Date {
        DateFormatter.yyyyMMddHHmmFormatter.date(from: "202111231500") ?? Date()
    }
}

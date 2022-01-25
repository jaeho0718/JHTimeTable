//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/22.
//

import Foundation

struct ExampleClassModel : ClassProtocol {
    var id : Int
    
    var name: String
    
    var room: String?
    
    var color: String
    
    var times: [ExampleTimeModel]
}

struct ExampleTimeModel : ClassTimeProtocol {
    var id : Int
    
    var weekday: ClassWeekType
    
    var start: Date
    
    var end: Date
}

// test set
extension Date {
    static let testTime1 = DateFormatter.yyyyMMddHHmmFormatter.date(from: "202201241500")!
    static let testTime2 = DateFormatter.yyyyMMddHHmmFormatter.date(from: "202201241700")!
    static let testTime3 = DateFormatter.yyyyMMddHHmmFormatter.date(from: "202201241300")!
    static let testTime4 = DateFormatter.yyyyMMddHHmmFormatter.date(from: "202201241000")!
}

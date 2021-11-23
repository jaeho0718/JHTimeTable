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

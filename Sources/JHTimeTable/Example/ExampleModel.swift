//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/22.
//

import Foundation

struct ExampleClassModel : ClassProtocol {
    var id : Int
    
    var title: String
    
    var room: String?
    
    var color: String
    
    var times: [ExampleTimeModel]
}

struct ExampleTimeModel : ClassTimeProtocol {
    var id : Int
    
    var week: ClassWeekType
    
    var start: Date
    
    var end: Date
}

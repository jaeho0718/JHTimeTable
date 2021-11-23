//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/22.
//

import Foundation

struct TestClassModel : ClassProtocol {
    var id : Int
    
    var title: String
    
    var room: String?
    
    var color: String
    
    var times: [TestTimeModel]
}

struct TestTimeModel : ClassTimeProtocol {
    var id : Int
    
    var week: ClassWeekType
    
    var start: Date
    
    var end: Date
}
//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/21.
//

import Foundation

/// ClassTime protocol
public protocol ClassTimeProtocol : Identifiable {
    
    /// weekday
    ///
    /// It is automatically localized and displayed at the top of the timetable.
    var weekday : ClassWeekType { get set }
    
    /// start time
    ///
    /// HH : mm
    var start : Date { get set }
    
    /// end time
    ///
    /// HH : mm
    var end : Date { get set }
}

/// ClassInfo protocol
/// - title : Lecture name
/// - room : Lecture room
/// - color : LectureCell background color (hex code)
/// - times : Lecture time info
public protocol ClassProtocol : Identifiable {
    
    associatedtype TimeItem : ClassTimeProtocol
    
    /// 강의명
    var name : String { get set }
    
    /// 강의실
    var room : String? { get set }
    
    /// 시간표에 표시될 색상 (16진수 코드)
    var color : String { get set }
    
    /// 강의 시간에 대한 정보
    var times : [TimeItem] { get set }
}

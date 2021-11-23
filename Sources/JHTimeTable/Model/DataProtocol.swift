//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/21.
//

import Foundation

///수업 시간을 나타내는데 채택할 시간프로토콜입니다.
public protocol ClassTimeProtocol : Identifiable{
    
    /// 주일
    ///
    /// 시간표에 주일이 표시될 때는 자동으로 지역화되어 표시됩니다.
    var week : ClassWeekType { get set }
    
    /// 시작되는 시간
    ///
    /// HH : mm 에 대한 정보만 이용합니다.
    var start : Date { get set }
    
    /// 끝나는 시간
    ///
    /// HH : mm 에 대한 정보만 이용합니다.
    var end : Date { get set }
}

///수업 데이터를 JHTimeTable에 바인딩하기 위해 채택해야할 프로토콜입니다.
/// - title : 강의명
/// - room : 강의실
/// - color : 시간표에 표시될 색상 (16진수 코드)
/// - times : 강의 시간에 대한 정보
public protocol ClassProtocol : Identifiable {
    
    associatedtype TimeItem : ClassTimeProtocol
    
    /// 강의명
    var title : String { get set }
    
    /// 강의실
    var room : String? { get set }
    
    /// 시간표에 표시될 색상 (16진수 코드)
    var color : String { get set }
    
    /// 강의 시간에 대한 정보
    var times : [TimeItem] { get set }
}

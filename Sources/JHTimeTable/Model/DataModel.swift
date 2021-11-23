//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/21.
//

import Foundation

///수업 주일타입입니다.
///
/// Mon : 월요일 Tue : 화요일, Wed : 수요일,Thu : 목요일, Fri : 금요일, Sat : 토요일, Sun : 일요일
///
/// 시간표 상단에 자동으로 지역화되어 표시됩니다.
public enum ClassWeekType : Int,Identifiable,Codable{
    case Mon,Tue,Wed,Thu,Fri,Sat,Sun
    
    var rawValue : Int {
        switch self {
        case .Mon:
            return 1
        case .Tue:
            return 2
        case .Wed:
            return 3
        case .Thu:
            return 4
        case .Fri:
            return 5
        case .Sat:
            return 6
        case .Sun:
            return 0
        }
    }
    
    var calendarIndex : Int {
        switch self {
        case .Mon:
            return 1
        case .Tue:
            return 2
        case .Wed:
            return 3
        case .Thu:
            return 4
        case .Fri:
            return 5
        case .Sat:
            return 6
        case .Sun:
            return 0
        }
    }
    
    public var id : Int {
        switch self {
        case .Mon:
            return 1
        case .Tue:
            return 2
        case .Wed:
            return 3
        case .Thu:
            return 4
        case .Fri:
            return 5
        case .Sat:
            return 6
        case .Sun:
            return 0
        }
    }
    
}

struct WeekClassGroup<Resource : ClassProtocol> : Identifiable {
    var week : ClassWeekType
    var data : [Resource]
    
    var id : Int {
        week.id
    }
}

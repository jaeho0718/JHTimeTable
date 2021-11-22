//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/21.
//
import SwiftUI

///시간표에 표시될 주일
struct TimetableWeekEnvironmentKey : EnvironmentKey {
    static var defaultValue : [ClassWeekType] = [.Sun,.Mon,.Tue,.Wed,.Thu,.Fri,.Sat]
}

///시간표 주일폰트
struct TimetableWeekFontEnvironmentKey : EnvironmentKey {
    static var defaultValue : Font = .caption2
}

///시간표 시간 폰트
struct TimetableTimeFontEnvironmentKey : EnvironmentKey {
    static var defaultValue : Font = .caption2
}

///시간표 강의명 폰트
struct TimetableClassFontEnvironmentKey : EnvironmentKey {
    static var defaultValue : Font = .system(size: 10)
}

///시간표 강의실 폰트
struct TimetableRoomFontEnvironmentKey : EnvironmentKey {
    static var defaultValue : Font = .system(size: 8)
}

///시간표 최소 시간
struct TimetableMinTime : EnvironmentKey {
    static var defaultValue : Int = 9
}

///시간표 최대 시간
struct TimetableMaxTime : EnvironmentKey {
    static var defaultValue : Int = 20
}

///시간표 셀 높이
struct TimetableHeight : EnvironmentKey {
    static var defaultValue : CGFloat = 35
}

///시간표 코너 반경
struct TimetableCornerRadius : EnvironmentKey {
    static var defaultValue : CGFloat = 10
}

struct TimetableTimeWidth : EnvironmentKey {
    static var defaultValue : CGFloat = 20
}

struct TimetableWeekHeight : EnvironmentKey {
    static var defaultValue : CGFloat = 15
}

extension EnvironmentValues {
    
    var timetableWeek : [ClassWeekType] {
        get { self[TimetableWeekEnvironmentKey.self] }
        set { self[TimetableWeekEnvironmentKey.self] = newValue }
    }
    
    var timetableHeight : CGFloat {
        get { self[TimetableHeight.self] }
        set { self[TimetableHeight.self] = newValue }
    }
    
    var timetableCornerRadius : CGFloat {
        get { self[TimetableCornerRadius.self] }
        set { self[TimetableCornerRadius.self] = newValue }
    }
    
    var timetableTimeWidth : CGFloat {
        get { self[TimetableTimeWidth.self] }
        set { self[TimetableTimeWidth.self] = newValue }
    }
    
    var timetableWeekHeight : CGFloat {
        get { self[TimetableWeekHeight.self] }
        set { self[TimetableWeekHeight.self] = newValue }
    }
    
    var timetableMinTime : Int {
        get { self[TimetableMinTime.self] }
        set { self[TimetableMinTime.self] = newValue }
    }
    
    var timetableMaxTime : Int {
        get { self[TimetableMaxTime.self] }
        set { self[TimetableMaxTime.self] = newValue }
    }
    
    var timetableWeekFont : Font {
        get { self[TimetableWeekFontEnvironmentKey.self] }
        set { self[TimetableWeekFontEnvironmentKey.self] = newValue }
    }
    
    var timetableTimeFont : Font {
        get { self[TimetableTimeFontEnvironmentKey.self] }
        set { self[TimetableTimeFontEnvironmentKey.self] = newValue }
    }
}

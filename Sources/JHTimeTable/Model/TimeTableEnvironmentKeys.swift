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
    static var defaultValue : Font = .system(size: 10).weight(.bold)
}

///시간표 강의실 폰트
struct TimetableRoomFontEnvironmentKey : EnvironmentKey {
    static var defaultValue : Font = .system(size: 8)
}

///시간표 시작 시간
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

///시간표 시간 넓이
struct TimetableTimeWidth : EnvironmentKey {
    static var defaultValue : CGFloat = 20
}

///시간표 주일 높이
struct TimetableWeekHeight : EnvironmentKey {
    static var defaultValue : CGFloat = 15
}

struct TimetableWeekColor : EnvironmentKey {
    static var defaultValue : Color = .secondary
}

struct TimetableTimeColor : EnvironmentKey {
    static var defaultValue : Color = .secondary
}

struct TimetableCellOpacity : EnvironmentKey {
    static var defaultValue : Double = 1.0
}

public extension EnvironmentValues {
    
    ///시간표에 표시될 주일
    var timetableWeek : [ClassWeekType] {
        get { self[TimetableWeekEnvironmentKey.self] }
        set { self[TimetableWeekEnvironmentKey.self] = newValue }
    }
    
    ///시간표 셀의 높이
    var timetableHeight : CGFloat {
        get { self[TimetableHeight.self] }
        set { self[TimetableHeight.self] = newValue }
    }
    
    ///시간표 테두리 곡률
    ///최대 23
    var timetableCornerRadius : CGFloat {
        get { self[TimetableCornerRadius.self] }
        set { self[TimetableCornerRadius.self] = newValue }
    }
    
    ///시간표 시간을 나타내는 부분의 넓이
    var timetableTimeWidth : CGFloat {
        get { self[TimetableTimeWidth.self] }
        set { self[TimetableTimeWidth.self] = newValue }
    }
    
    ///시간표 주일을 나타내는 부분의 높이
    var timetableWeekHeight : CGFloat {
        get { self[TimetableWeekHeight.self] }
        set { self[TimetableWeekHeight.self] = newValue }
    }
    
    ///시간표 시작 시간
    var timetableMinTime : Int {
        get { self[TimetableMinTime.self] }
        set { self[TimetableMinTime.self] = newValue }
    }
    
    ///시간표 최대 시간
    var timetableMaxTime : Int {
        get { self[TimetableMaxTime.self] }
        set { self[TimetableMaxTime.self] = newValue }
    }
    
    ///시간표 주일 폰트
    var timetableWeekFont : Font {
        get { self[TimetableWeekFontEnvironmentKey.self] }
        set { self[TimetableWeekFontEnvironmentKey.self] = newValue }
    }
    
    ///시간표 시간 폰트
    var timetableTimeFont : Font {
        get { self[TimetableTimeFontEnvironmentKey.self] }
        set { self[TimetableTimeFontEnvironmentKey.self] = newValue }
    }
    
    ///시간표 수업 이름 폰트
    var timetableClassFont : Font {
        get { self[TimetableClassFontEnvironmentKey.self] }
        set { self[TimetableClassFontEnvironmentKey.self] = newValue }
    }
    
    ///시간표 강의실 폰트
    var timetableRoomFont : Font {
        get { self[TimetableRoomFontEnvironmentKey.self] }
        set { self[TimetableRoomFontEnvironmentKey.self] = newValue }
    }
    
    ///시간표 주일 색상
    var timetableWeekColor : Color {
        get { self[TimetableWeekColor.self] }
        set { self[TimetableWeekColor.self] = newValue }
    }
    
    ///시간표 시간 색상
    var timetableTimeColor : Color {
        get { self[TimetableTimeColor.self] }
        set { self[TimetableTimeColor.self] = newValue }
    }
    
    var timetableCellOpacity : Double {
        get { self[TimetableCellOpacity.self] }
        set { self[TimetableCellOpacity.self] = newValue }
    }
}

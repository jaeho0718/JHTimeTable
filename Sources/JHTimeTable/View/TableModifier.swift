//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2022/01/24.
//

import SwiftUI

extension JHTimeTable {

    /// Set timetable frame
    public func tableFrame(timeWidth: CGFloat, timeHeight: CGFloat,
                           weekHeight: CGFloat) -> JHTimeTable {
        var view = self
        view.timeWidth = timeWidth
        view.timeHeight = timeHeight
        view.weekHeight = weekHeight
        return view
    }

    /// Set timetable max Time, min Time
    public func tableTime(min: Int, max: Int) -> JHTimeTable {
        var view = self
        view.minTime = min
        view.maxTime = max
        return view
    }

    /// Set timetable font
    public func tableFont(week: Font, time: Font,
                          title: Font, room: Font) -> JHTimeTable {
        var view = self
        view.weekFont = week
        view.timeFont = time
        view.titleFont = title
        view.roomFont = room
        return view
    }

    /// Set timetable week,time font color
    public func tableColor(week: Color, time: Color) -> JHTimeTable {
        var view = self
        view.weekColor = week
        view.timeColor = time
        return view
    }

    /// Set timetable week symbol type
    public func weekType(type: WeekSymbolType) -> JHTimeTable {
        var view = self
        view.weeksymbolType = type
        return view
    }

    /// Set timetable weeks
    public func tableWeeks(weeks: [ClassWeekType]) -> JHTimeTable {
        var view = self
        view.weeks = weeks
        return view
    }

    /// Set table cell opacity
    public func tableCellOpacity(_ value: Double) -> JHTimeTable {
        var view = self
        view.cellOpacity = value
        return view
    }
}

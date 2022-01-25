//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/23.
//

import SwiftUI

/// Timetable Shape
struct TableShape: Shape {

    var weeks: [ClassWeekType]
    var cornerRadius: CGFloat
    var timeHeight: CGFloat
    var timeWidth: CGFloat
    var weekHeight: CGFloat
    var minTime: Int
    var maxTime: Int

    init(weeks: [ClassWeekType],
         cornerRadius: CGFloat = 15, timeHeight: CGFloat = 30,
         timeWidth: CGFloat = 15, weekHeight: CGFloat = 15,
         minTime: Int = 9, maxTime: Int = 18) {
        self.weeks = weeks
        self.cornerRadius = cornerRadius
        self.timeHeight = timeHeight
        self.timeWidth = timeWidth
        self.weekHeight = weekHeight
        self.minTime = minTime
        self.maxTime = maxTime
    }


    func path(in rect: CGRect) -> Path {
        let weekWidth = (rect.width - timeWidth)/CGFloat(weeks.count)
        let tableHeight = CGFloat(maxTime - minTime)*timeHeight + weekHeight
        return Path { path in
            // 시간표 테두리
            path.move(to: CGPoint(x: cornerRadius, y: 0))
            path.addLine(to: CGPoint(x: rect.width-cornerRadius, y: 0))
            path.addQuadCurve(to: CGPoint(x: rect.width, y: cornerRadius),
                              control: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: tableHeight-cornerRadius))
            path.addQuadCurve(to: CGPoint(x: rect.width-cornerRadius, y: tableHeight),
                              control: CGPoint(x: rect.width, y: tableHeight))
            path.addLine(to: CGPoint(x: cornerRadius, y: tableHeight))
            path.addQuadCurve(to: CGPoint(x: 0, y: tableHeight-cornerRadius),
                              control: CGPoint(x: 0, y: tableHeight))
            path.addLine(to: CGPoint(x: 0, y: cornerRadius))
            path.addQuadCurve(to: CGPoint(x: cornerRadius, y: 0),
                              control: CGPoint())
            // 시간표 경계
            path.closeSubpath()
            for i in 0..<weeks.count {
                let xPosition = timeWidth + weekWidth*CGFloat(i)
                path.move(to: CGPoint(x: xPosition, y: 0))
                path.addLine(to: CGPoint(x: xPosition, y: tableHeight))
            }
            for i in 0..<(maxTime-minTime) {
                let yPosition = weekHeight + timeHeight*CGFloat(i)
                path.move(to: CGPoint(x: 0, y: yPosition))
                path.addLine(to: CGPoint(x: rect.width, y: yPosition))
            }
        }
    }
}

/// Timetable Corner Shape
struct TableCornerShape: Shape {

    var weeks: [ClassWeekType]
    var cornerRadius: CGFloat
    var timeHeight: CGFloat
    var weekHeight: CGFloat
    var minTime: Int
    var maxTime: Int

    init(weeks: [ClassWeekType], cornerRadius: CGFloat = 15,
         timeHeight: CGFloat = 30, weekHeight: CGFloat = 15,
         minTime: Int = 9, maxTime: Int = 18) {
        self.weeks = weeks
        self.cornerRadius = cornerRadius
        self.timeHeight = timeHeight
        self.weekHeight = weekHeight
        self.minTime = minTime
        self.maxTime = maxTime
    }

    func path(in rect: CGRect) -> Path {
        let tableHeight = CGFloat(maxTime - minTime)*timeHeight + weekHeight
        return Path { path in
            path.move(to: CGPoint(x: cornerRadius, y: 0))
            path.addLine(to: CGPoint(x: rect.width-cornerRadius, y: 0))
            path.addQuadCurve(to: CGPoint(x: rect.width, y: cornerRadius),
                              control: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: tableHeight-cornerRadius))
            path.addQuadCurve(to: CGPoint(x: rect.width-cornerRadius, y: tableHeight),
                              control: CGPoint(x: rect.width, y: tableHeight))
            path.addLine(to: CGPoint(x: cornerRadius, y: tableHeight))
            path.addQuadCurve(to: CGPoint(x: 0, y: tableHeight-cornerRadius),
                              control: CGPoint(x: 0, y: tableHeight))
            path.addLine(to: CGPoint(x: 0, y: cornerRadius))
            path.addQuadCurve(to: CGPoint(x: cornerRadius, y: 0),
                              control: CGPoint())
            path.closeSubpath()
        }
    }
}

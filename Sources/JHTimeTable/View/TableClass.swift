//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/23.
//

import SwiftUI

struct TimetableClassStack<ClassResource : ClassProtocol,
                           TimeResource : ClassTimeProtocol> : View {
    
    @Environment(\.timetableHeight) var tableHeight
    @Environment(\.timetableMinTime) var minTime
    @Environment(\.timetableMaxTime) var maxTime
    @Environment(\.timetableWeekHeight) var weekHeight
    
    var classData : ClassResource
    var timeData : TimeResource
    var onTapAction : (ClassResource) -> Void
    
    var body : some View {
        VStack(alignment:.center,spacing:0){
            Rectangle()
                .frame(height:preceedTimeHeight())
                .hidden()
            TimetableClassCell(data: classData,onTapAction: onTapAction)
                .frame(height:selfTimeHeight(),alignment: .topLeading)
            Rectangle()
                .hidden()
        }
    }
    
    private func preceedTimeHeight() -> CGFloat {
        guard let start = timeData.start.currentDate else {return 0}
        let hourString = minTime < 10 ? "0\(minTime)" : String(minTime)
        guard let mintime = DateFormatter.yyyyMMddHHmmFormatter
                .date(from: "20010101\(hourString)00") else {return 0}
        let timeInterval = start.timeIntervalSince(mintime)
        
        if timeInterval > 0 && maxTime - minTime + 1 > 0  {
            let ratio = timeInterval / (Double(maxTime - minTime + 1)*3600)
            let height = CGFloat(maxTime - minTime + 1) * tableHeight
            return ratio*height
        }
        return 0
    }
    
    private func selfTimeHeight() -> CGFloat {
        guard let start = timeData.start.currentDate else {return 0}
        guard let end = timeData.end.currentDate else {return 0}
        
        if end.timeIntervalSince(start) > 0 && maxTime - minTime + 1 > 0 {
            let ratio = end.timeIntervalSince(start) / (Double(maxTime - minTime + 1)*3600)
            let height = CGFloat(maxTime - minTime + 1) * tableHeight
            return ratio*height
        }
        return 0
    }
}


struct TimetableClassCell<ClassResource : ClassProtocol> : View {
    @Environment(\.timetableClassFont) var classFont
    @Environment(\.timetableRoomFont) var roomFont
    
    var data : ClassResource
    var onTapAction : (ClassResource) -> Void
    
    var body : some View {
        ZStack(alignment:.topLeading){
            Rectangle()
                .foregroundColor(Color(hexString: data.color))
            VStack(alignment:.leading){
                Text(data.title)
                    .font(classFont)
                    .foregroundColor(.white)
                if let room = data.room {
                    Text(room)
                        .font(roomFont)
                        .foregroundColor(.white)
                }
            }
            .padding([.leading,.top],2)
        }.frame(maxWidth:.infinity,maxHeight: .infinity)
            .onTapGesture {
                onTapAction(data)
            }
    }
}

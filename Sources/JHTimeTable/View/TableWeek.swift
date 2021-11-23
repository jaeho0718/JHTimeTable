//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/23.
//

import SwiftUI

struct TimetableWeeks<ClassResource : ClassProtocol> : View {
    @Environment(\.timetableTimeWidth) var timeWidth
    @Environment(\.timetableWeekHeight) var weekHeight
    @Environment(\.timetableWeek) var week
    
    @Binding var data : [ClassResource]
    var onTapAction : (ClassResource) -> Void
    
    var body : some View {
        HStack(spacing:0){
            ForEach(generateWeekGroup()){ item in
                TimetableWeekStack(data: item,onTapAction: onTapAction)
                    .frame(maxWidth:.infinity,maxHeight:.infinity)
            }
        }
        .padding(.leading,timeWidth)
        .padding(.top,weekHeight)
    }
    
    private func generateWeekGroup() -> [WeekClassGroup<ClassResource>] {
        var groups = [WeekClassGroup<ClassResource>]()
        for item in week {
            let classes = data.filter({$0.times.contains(where: {$0.weekday == item})})
            // sort 추가하기
            groups.append(.init(week: item,
                                data: classes))
        }
        return groups
    }
}

/// 주어진 주일에 해당하는 수업을 나열하는 뷰
struct TimetableWeekStack<ClassResource : ClassProtocol> : View {
    
    var data : WeekClassGroup<ClassResource>
    var onTapAction : (ClassResource) -> Void
    
    var body : some View{
        GeometryReader{ geometry in
            ZStack(alignment:.top){
                ForEach(data.data){ classData in
                    ForEach(classData.times.filter({$0.weekday == data.week})){ time in 
                        TimetableClassStack(classData: classData, timeData: time,
                                            onTapAction: onTapAction)
                    }
                }
            }
        }
    }
}

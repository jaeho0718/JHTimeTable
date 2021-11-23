//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/23.
//

import SwiftUI

///JHTimeTable을 이용한 예제입니다.
struct JHTimeTableExampleView : View {
    
    var resources : [ExampleClassModel] = [
        ExampleClassModel(id : 0,title: "Math", room: "210", color: "3F3351",
                       times: [
                        ExampleTimeModel(id: 0,
                                      week: .Mon,
                                      start: Date.testStartTime,
                                      end: Date.testStartTime.addingTimeInterval(5400)),
                        ExampleTimeModel(id: 1,
                                      week: .Wed,
                                      start: Date.testStartTime.addingTimeInterval(-3600),
                                      end: Date.testStartTime.addingTimeInterval(1800))
                       ]),
        ExampleClassModel(id : 1,title: "Science", room: nil, color: "FF5151",
                       times: [
                        ExampleTimeModel(id: 0,
                                      week: .Mon,
                                      start: Date.testStartTime.addingTimeInterval(-5600),
                                      end: Date.testStartTime.addingTimeInterval(-2500)),
                        ExampleTimeModel(id: 1,
                                      week: .Fri,
                                      start: Date.testStartTime.addingTimeInterval(-3600),
                                      end: Date.testStartTime.addingTimeInterval(1800)),
                        ExampleTimeModel(id: 1,
                                      week: .Thu,
                                      start: Date.testStartTime.addingTimeInterval(1800),
                                      end: Date.testStartTime.addingTimeInterval(7200))
                       ]),
        ExampleClassModel(id : 2,title: "Computer", room: "컴퓨터실", color: "9C19E0",
                       times: [
                        ExampleTimeModel(id: 0,
                                      week: .Tue,
                                      start: Date.testStartTime.addingTimeInterval(-5600),
                                      end: Date.testStartTime.addingTimeInterval(2500)),
                        ExampleTimeModel(id: 1,
                                      week: .Thu,
                                      start: Date.testStartTime.addingTimeInterval(-7200),
                                      end: Date.testStartTime.addingTimeInterval(-1800))
                       ]),
        ExampleClassModel(id : 2,title: "Logic", room: "컴퓨터실", color: "105652",
                       times: [
                        ExampleTimeModel(id: 0,
                                      week: .Wed,
                                      start: Date.testStartTime.addingTimeInterval(-3600*4),
                                         end: Date.testStartTime.addingTimeInterval(-3800))
                       ])
    ]
    
    var body : some View {
        JHTimeTable(lineColor:.secondary.opacity(0.3),
                    lineWidth: 1,
                    resources: .constant(resources))
            .frame(width:300) //시간표 넓이 지정
            .environment(\.timetableWeek, [.Mon,.Tue,.Wed,.Thu,.Fri]) //시간표에 표시될 주일 지정
            .environment(\.timetableWeekHeight, 20) //시간표 주일 높이 지정
            .environment(\.timetableCornerRadius, 20) //시간표 테두리 곡률 지정
            .environment(\.timetableMaxTime, 17) //시간표 최대 시간 지정
            .environment(\.timetableMinTime, 9) //시간표 시작 시간 지정
            .environment(\.timetableHeight, 40) //시간표 시간 셀 높이 지정
    }
}


struct JJHTimeTableExampleView_Preview : PreviewProvider {
    static var previews : some View {
        JHTimeTableExampleView()
    }
}

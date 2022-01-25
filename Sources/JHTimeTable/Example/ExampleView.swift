//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/23.
//

import SwiftUI

/// Example
struct JHTimeTableExampleView : View {
    
    @State var resources : [ExampleClassModel] = [
        ExampleClassModel(id : 0,name: "Math", room: "210", color: "3F3351",
                       times: [
                        ExampleTimeModel(id: 0,
                                         weekday: .Mon,
                                         start: .testTime1,
                                         end: .testTime1.addingTimeInterval(3600)),
                        ExampleTimeModel(id: 1,
                                         weekday: .Wed,
                                         start: .testTime2,
                                         end: .testTime2.addingTimeInterval(3600))
                       ]),
        ExampleClassModel(id : 1,name: "Science", room: nil, color: "FF5151",
                       times: [
                        ExampleTimeModel(id: 0,
                                         weekday: .Mon,
                                         start: .testTime3,
                                         end: .testTime3.addingTimeInterval(3600)),
                        ExampleTimeModel(id: 1,
                                         weekday: .Fri,
                                         start: .testTime2,
                                         end: .testTime2.addingTimeInterval(3600)),
                        ExampleTimeModel(id: 1,
                                         weekday: .Thu,
                                         start: .testTime2,
                                         end: .testTime2.addingTimeInterval(3600))
                       ]),
        ExampleClassModel(id : 2,name: "Computer", room: "320", color: "9C19E0",
                       times: [
                        ExampleTimeModel(id: 0,
                                         weekday: .Tue,
                                         start: .testTime4,
                                         end: .testTime4.addingTimeInterval(3600)),
                        ExampleTimeModel(id: 1,
                                         weekday: .Thu,
                                         start: .testTime1,
                                         end: .testTime1.addingTimeInterval(3600))
                       ]),
        ExampleClassModel(id : 2,name: "Logic", room: "120", color: "105652",
                       times: [
                        ExampleTimeModel(id: 0,
                                         weekday: .Wed,
                                         start: .testTime3,
                                         end: .testTime3.addingTimeInterval(3600))
                       ])
    ]
    
    var body : some View {
        JHTimeTable(lineWidth: 0.5, lineColor: .secondary, cornerRadius: 15,
                    items: $resources, background: {
            Color.clear
        },onTapAction: { value in
            // TapAction
        })
            .tableFrame(timeWidth: 17, timeHeight: 30, weekHeight: 19)
            .tableFont(week: .caption2, time: .system(size: 9), title: .caption2, room: .caption2)
            .tableWeeks(weeks: [.Mon,.Tue,.Wed,.Thu,.Fri])
            .weekType(type: .normal)
            .frame(width: 300)
    }
}


struct JHTimeTableExampleView_Preview : PreviewProvider {
    static var previews : some View {
        JHTimeTableExampleView()
    }
}

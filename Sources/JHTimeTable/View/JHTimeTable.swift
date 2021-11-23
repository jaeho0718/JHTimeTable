import SwiftUI

///JHTimeTable
public struct JHTimeTable<Resource : ClassProtocol> : View {
    @Environment(\.timetableWeek) var week
    @Environment(\.timetableTimeWidth) var timeWidth
    @Environment(\.timetableHeight) var tableHeight
    @Environment(\.timetableWeekHeight) var weekHeight
    @Environment(\.timetableMinTime) var minTime
    @Environment(\.timetableMaxTime) var maxTime
    @Environment(\.timetableCornerRadius) var cornerRadius
    @Environment(\.timetableWeekFont) var weekFont
    @Environment(\.timetableTimeFont) var timeFont
    
    @Binding var resources : [Resource]
    
    var gridItem : [GridItem] {
        var items = [GridItem]()
        items.append(GridItem(.fixed(timeWidth), spacing: 0, alignment: .center))
        items.append(contentsOf: Array(repeating: GridItem(.flexible(minimum: 20, maximum: .infinity),
                                                           spacing: 0, alignment: .center),
                                       count: week.count))
        return items
    }
    
    /// JHTimeTable
    /// - Parameter resources : 시간표에 표시될 수업데이터입니다. ClassProtocol을 채택해야합니다.
    public init( resources : Binding<[Resource]> ) {
        self._resources = resources
    }
    
    var infoBar : some View {
        ZStack(alignment:.topLeading){
            HStack(spacing:0){
                ForEach(week){ index in
                    Text(Calendar.current.shortWeekdaySymbols[index.calendarIndex])
                        .frame(maxWidth:.infinity)
                        .font(weekFont)
                }
            }.frame(height:weekHeight)
            .padding(.leading,timeWidth)
            
            VStack(spacing:0){
                ForEach(minTime ..< maxTime + 1) { time in
                    Text(String(time))
                        .frame(width:timeWidth - 2,
                               height:tableHeight,alignment:.topTrailing)
                        .font(timeFont)
                }
            }.padding(.top,weekHeight)
        }
    }
    
    public var body: some View {
        TimetableShape(week: week, tableHeight: tableHeight, weekHeight: weekHeight, timeWidth: timeWidth, minTime: minTime, maxTime: maxTime)
            .stroke(lineWidth: 1)
            .frame(height:weekHeight + tableHeight * CGFloat(maxTime - minTime + 1))
            .overlay(RoundedRectangle(cornerRadius: cornerRadius)
                        .stroke(lineWidth: 1))
            .overlay(infoBar)
            .opacity(0.3)
            .overlay(TimetableWeeks(data: $resources).clipped())
    }
    
}

struct JHTimeTable_Preview : PreviewProvider {
    static var previews : some View {
        JHTimeTable(resources: .constant([
            TestClassModel(id : 0,title: "Math", room: "210", color: "FF5151",
                           times: [
                            TestTimeModel(id: 0,
                                          week: .Mon,
                                          start: Date.testStartTime,
                                          end: Date.testStartTime.addingTimeInterval(5400))
                           ])
        ]))
        .frame(width:300)
        .environment(\.timetableWeek, [.Mon,.Tue,.Wed,.Thu,.Fri])
        .environment(\.timetableWeekHeight, 25)
        .environment(\.timetableCornerRadius, 10)
        .environment(\.timetableMaxTime, 17)
        .environment(\.timetableMinTime, 9)
    }
}

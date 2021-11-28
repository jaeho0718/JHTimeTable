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
    @Environment(\.timetableWeekColor) var weekColor
    @Environment(\.timetableTimeColor) var timeColor
    
    @Binding var resources : [Resource]
    
    let lineColor : Color
    
    let lineWidth : CGFloat
    
    var onTapAction : (Resource) -> Void
    
    var gridItem : [GridItem] {
        var items = [GridItem]()
        items.append(GridItem(.fixed(timeWidth), spacing: 0, alignment: .center))
        items.append(contentsOf: Array(repeating: GridItem(.flexible(minimum: 20, maximum: .infinity),
                                                           spacing: 0, alignment: .center),
                                       count: week.count))
        return items
    }
    
    /// JHTimeTable
    /// - Parameter lineColor : 시간표 색상 (기본값 : secondary color)
    /// - Parameter lineWidth : 시간표 선 두께 (기본값 : 1)
    /// - Parameter resources : 시간표에 표시될 수업데이터입니다. ClassProtocol을 채택해야합니다.
    public init(lineColor : Color = .secondary,
                lineWidth : CGFloat = 1
                ,resources : Binding<[Resource]>
                ,onTapAction : @escaping (Resource) -> Void = {_ in }) {
        self._resources = resources
        self.lineColor = lineColor
        self.lineWidth = lineWidth
        self.onTapAction = onTapAction
    }
    
    var infoBar : some View {
        ZStack(alignment:.topLeading){
            HStack(spacing:0){
                ForEach(week){ index in
                    #if os(watchOS)
                    Text(Calendar.current.veryShortWeekdaySymbols[index.calendarIndex])
                        .frame(maxWidth:.infinity)
                        .font(weekFont)
                        .foregroundColor(weekColor)
                    #else
                    Text(Calendar.current.shortWeekdaySymbols[index.calendarIndex])
                        .frame(maxWidth:.infinity)
                        .font(weekFont)
                        .foregroundColor(weekColor)
                    #endif
                }
            }.frame(height:weekHeight)
            .padding(.leading,timeWidth)
            
            VStack(spacing:0){
                ForEach(minTime ..< maxTime + 1) { time in
                    Text(String(time))
                        .frame(width:timeWidth - 2,
                               height:tableHeight,alignment:.topTrailing)
                        .font(timeFont)
                        .foregroundColor(timeColor)
                }
            }.padding(.top,weekHeight)
        }.frame(maxWidth:.infinity,maxHeight: .infinity,alignment: .topLeading)
    }
    
    public var body: some View {
        TimetableShape(week: week, tableHeight: tableHeight, weekHeight: weekHeight, timeWidth: timeWidth, minTime: minTime, maxTime: maxTime)
            .stroke(lineWidth: lineWidth)
            .frame(height:weekHeight + tableHeight * CGFloat(maxTime - minTime + 1))
            .overlay(RoundedRectangle(cornerRadius: cornerRadius < 24 ? cornerRadius : 23)
                        .stroke(lineWidth: lineWidth))
            .foregroundColor(lineColor)
            .overlay(infoBar)
            .overlay(TimetableWeeks(data: $resources, onTapAction: onTapAction).clipped())
    }
    
}

import SwiftUI

/// JHTimeTable
public struct JHTimeTable<Item: ClassProtocol,Content: View>: View {

    let lineWidth: CGFloat
    let lineColor: Color
    let cornerRadius: CGFloat
    var weeks: [ClassWeekType] = [.Mon,.Tue,.Wed,.Thu,.Fri]
    var weekHeight: CGFloat = 25
    var timeWidth: CGFloat = 15
    var timeHeight: CGFloat = 40
    var minTime: Int = 9
    var maxTime: Int = 18
    var weekFont: Font = .caption2
    var timeFont: Font = .caption2
    var titleFont: Font = .caption2
    var roomFont: Font = .caption2
    var cellOpacity: Double = 1
    var weekColor: Color = .secondary
    var timeColor: Color = .secondary
    var weeksymbolType: WeekSymbolType = .short
    let onTapAction: ((Item) -> Void)?
    var background: ()->Content
    @Binding var items: [Item]

    /**
     JHTimetable

      ~~~
     JHTimetable(linewidth: 1.2, lineColor: .secondary,
               cornerRadius: 15, items: $items, background: { Color.clear },
               onTapAction: { item in
                 // Action
               })
     ~~~

     - Parameter lineWidth: timetable boundary width
     - Parameter lineColor: timetable boundary color
     - Parameter cornerRadius: timetable corner radius
     - Parameter items: class items
     - Parameter background: timetable background view
     - Parameter onTapAction: action that activate when Lecture cell is tapped.
     */
    public init(lineWidth: CGFloat = 1,lineColor: Color = .secondary,
                cornerRadius: CGFloat = 20,items: Binding<[Item]>,
                @ViewBuilder background: @escaping () -> Content,
                onTapAction: ((Item) -> Void)? = nil) {
        self.lineWidth = lineWidth
        self.cornerRadius = cornerRadius
        self.lineColor = lineColor
        self.onTapAction = onTapAction
        self.background = background
        _items = items
    }

    var backgroundView: some View {
        background()
            .clipShape(TableCornerShape(weeks: weeks, cornerRadius: cornerRadius,
                                        timeHeight: timeHeight, weekHeight: weekHeight,
                                        minTime: minTime, maxTime: maxTime))
    }

    var classesView: some View {
        GeometryReader { proxy in
            ZStack {
                ForEach(items) { item in
                    ForEach(item.times) { time in
                        if let index = weeks.firstIndex(where: {$0 == time.weekday}) {
                            VStack(alignment: .leading) {
                                Text(item.name)
                                    .font(titleFont)
                                    .foregroundColor(.white)
                                if let room = item.room {
                                    Text(room)
                                        .font(roomFont)
                                        .foregroundColor(.white)
                                }
                            }
                            .padding([.top,.leading],2)
                            .frame(width: getFrame(width: proxy.size.width,
                                                   time: time).width,
                                   height: getFrame(width: proxy.size.width,
                                                    time: time).height,
                                   alignment: .topLeading)
                            .background(Color(hexString: item.color).opacity(cellOpacity))
                            .position(x: getPosition(width: proxy.size.width,
                                                     time: time, index: index).x,
                                      y: getPosition(width: proxy.size.width,
                                                     time: time, index: index).y)
                            .onTapGesture {
                                if let onTapAction = onTapAction {
                                    onTapAction(item)
                                }
                            }
                        } else {
                            Color.clear
                        }
                    }
                }
            }
        }
        .clipShape(TableCornerShape(weeks: weeks, cornerRadius: cornerRadius,
                                    timeHeight: timeHeight, weekHeight: weekHeight,
                                    minTime: minTime, maxTime: maxTime))
    }

    var weeksView: some View {
        HStack(spacing: 0) {
            ForEach(weeks) { week in
                Group {
                    switch weeksymbolType {
                    case .normal:
                        Text(week.shortSymbol)
                    case .short:
                        Text(week.veryShortSymbol)
                    }
                }
                .font(weekFont)
                .foregroundColor(weekColor)
                .frame(maxWidth: .infinity)
                .frame(height: weekHeight)
            }
        }
        .padding(.leading,timeWidth)
        .frame(maxHeight: .infinity, alignment: .topLeading)
    }

    var timesView: some View {
        VStack(spacing: 0) {
            ForEach(minTime..<maxTime) { time in
                Text(String(time))
                    .font(timeFont)
                    .foregroundColor(timeColor)
                    .lineLimit(1)
                    .padding(.trailing, 1)
                    .frame(width: timeWidth, height: timeHeight, alignment: .topTrailing)
            }
        }
        .padding(.top, weekHeight)
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }

    public var body: some View {
        TableShape(weeks: weeks, cornerRadius: cornerRadius,
                   timeHeight: timeHeight, timeWidth: timeWidth,
                   weekHeight: weekHeight, minTime: minTime, maxTime: maxTime)
            .stroke(lineWidth: lineWidth)
            .foregroundColor(lineColor)
            .background(backgroundView)
            .overlay(classesView)
            .overlay(weeksView)
            .overlay(timesView)
            .frame(height: weekHeight+CGFloat(maxTime-minTime)*timeHeight)
    }

    private func getPosition<TimeItem: ClassTimeProtocol>(width: CGFloat,
                                                          time: TimeItem,
                                                          index: Int) -> CGPoint {
        let timeInterval = TimeInterval((time.start.hour-minTime)*60 + time.start.minute)
        let totalInterval = TimeInterval((maxTime - minTime)*60)
        let classInterval = TimeInterval(((time.end.hour-minTime)*60+time.end.minute)-((time.start.hour-minTime)*60+time.start.minute))
        let weekWidth = (width-timeWidth)/CGFloat(weeks.count)
        let tableHeight = CGFloat(maxTime-minTime)*timeHeight
        let x = timeWidth + weekWidth*CGFloat(index) + weekWidth/2
        let y = weekHeight + tableHeight*CGFloat(timeInterval/totalInterval) + tableHeight*CGFloat(classInterval/totalInterval)/2
        return CGPoint(x: x, y: y)
    }

    private func getFrame<TimeItem: ClassTimeProtocol>(width: CGFloat,
                                                       time: TimeItem) -> CGSize {
        let totalInterval = TimeInterval((maxTime - minTime)*60)
        let classInterval = TimeInterval(((time.end.hour-minTime)*60+time.end.minute)-((time.start.hour-minTime)*60+time.start.minute))
        let tableHeight = CGFloat(maxTime-minTime)*timeHeight
        let weekWidth = (width-timeWidth)/CGFloat(weeks.count)-lineWidth*1.2
        let cellHeight = tableHeight*CGFloat(classInterval/totalInterval)-lineWidth*1.2
        return CGSize(width: weekWidth, height: cellHeight)
    }
}

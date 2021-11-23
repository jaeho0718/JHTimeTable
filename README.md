# JHTimeTable

SwiftUI Customizable School TimeTable Library

![screenshot](./Resources/ExampleImage.png)

### 설치
- Swift Package Manager 

### 사용하기

- JHTimeTable뷰를 선언합니다.
    ```swift
    JHTimeTable(lineColor : .secondary,
                lineWidth : 1,
                resources : $data,
                onTapAction : { classdata in 
                    //사용자가 수업을 터치했을 때 액션
                })
    ```

- JHTimeTable에서 resources는 ClassProtocol를 채택한 구조체 배열을 사용합니다. ClassProtocol은 다음과 같습니다.

    ```swift
    public protocol ClassProtocol : Identifiable {
    
        associatedtype TimeItem : ClassTimeProtocol
    
        /// 강의명
        var title : String { get set }
    
        /// 강의실
        var room : String? { get set }
    
        /// 시간표에 표시될 색상 (16진수 코드)
        var color : String { get set }
    
        /// 강의 시간에 대한 정보
        var times : [TimeItem] { get set }
    }

    ```

- 강의 시간에 대한 정보는 ClassTimeProtocol를 채택해야합니다. ClassTimeProtocol는 다음과 같습니다.

    ```swift
    public protocol ClassTimeProtocol : Identifiable{
    
        /// 주일
        ///
        /// 시간표에 주일이 표시될 때는 자동으로 지역화되어 표시됩니다.
        var week : ClassWeekType { get set }
    
        /// 시작되는 시간
        ///
        /// HH : mm 에 대한 정보만 이용합니다.
        var start : Date { get set }
    
        /// 끝나는 시간
        ///
        /// HH : mm 에 대한 정보만 이용합니다.
        var end : Date { get set }
    }
    ```

- JHTimeTable/Example/ExampleModel.swift 에서 사용하는 데이터 예제를 확인하세요.

### 커스텀하기

- JHTimeTable은 뷰를 커스텀할 수 있는 EnvironmentKey를 제공합니다. 제공하는 EnvironmentKey항목은 다음과 같습니다.

    |EnvironmentKey|content|
    |-----|-----|
    |timetableWeek|시간표에 표시될 주일 (자동으로 지역화 되어 표시됩니다.)|
    |timetableWeekFont|시간표 주일 폰트|
    |timetableWeekColor|시간표 주일 색상|
    |timetableWeekHeight|시간표 주일을 나타내는 부분의 높이|
    |timetableMinTime|시간표 시작 시간|
    |timetableMaxTime|시간표 최대 시간|
    |timetableTimeFont|시간표 시간 폰트|
    |timetableTimeColor|시간표 시간 색상|
    |timetableTimeWidth|시간표 시간을 나타내는 부분의 넓이|
    |timetableClassFont|시간표 수업 이름 폰트|
    |timetableRoomFont|시간표 강의실 폰트|
    |timetableHeight|시간표 셀의 높이|
    |timetableCornerRadius|시간표 테두리 곡률 (최대 23)|

- 예시

    ```swift
    JHTimeTable(lineColor:.secondary.opacity(0.3),
                lineWidth: 1,
                resources: $data)
            .frame(width:300) //시간표 넓이 지정
            .environment(\.timetableWeek, [.Mon,.Tue,.Wed,.Thu,.Fri]) //시간표에 표시될 주일 지정
            .environment(\.timetableWeekHeight, 20) //시간표 주일 높이 지정
            .environment(\.timetableCornerRadius, 20) //시간표 테두리 곡률 지정
            .environment(\.timetableMaxTime, 17) //시간표 최대 시간 지정
            .environment(\.timetableMinTime, 9) //시간표 시작 시간 지정
            .environment(\.timetableHeight, 40) //시간표 시간 셀 높이 지정
    ```
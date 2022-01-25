//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/21.
//

import Foundation

/// Class Week Type
///
/// It is automatically localized and displayed at the top of the timetable.
public enum ClassWeekType : Identifiable {
    case Mon,Tue,Wed,Thu,Fri,Sat,Sun

    public var id : Int {
        switch self {
        case .Mon:
            return 1
        case .Tue:
            return 2
        case .Wed:
            return 3
        case .Thu:
            return 4
        case .Fri:
            return 5
        case .Sat:
            return 6
        case .Sun:
            return 0
        }
    }

    public var shortSymbol: String {
        Calendar.current.shortWeekdaySymbols[self.id]
    }

    public var veryShortSymbol: String {
        Calendar.current.veryShortWeekdaySymbols[self.id]
    }

    public var symbol: String {
        Calendar.current.weekdaySymbols[self.id]
    }

    public static func getType(_ value: Int) -> ClassWeekType {
        switch value {
        case 1:
            return .Mon
        case 2:
            return .Tue
        case 3:
            return .Wed
        case 4:
            return .Thu
        case 5:
            return .Fri
        case 6:
            return .Sat
        case 0:
            return .Sun
        default:
            return .Mon
        }
    }
}

extension ClassWeekType: Codable {
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(Int.self)
        let type = ClassWeekType.getType(value)
        self = type
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.id)
    }
}

public enum WeekSymbolType {
    case normal,short
}

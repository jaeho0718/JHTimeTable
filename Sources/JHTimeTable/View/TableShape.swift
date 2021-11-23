//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/23.
//

import SwiftUI

struct TimetableShape : Shape {
    
    var week : [ClassWeekType]
    var tableHeight : CGFloat
    var weekHeight : CGFloat
    var timeWidth : CGFloat
    var minTime : Int
    var maxTime : Int
    
    func path(in rect: CGRect) -> Path {
        let weekWidth = (rect.width - timeWidth)/CGFloat(week.count)
        
        return Path { path in
            
            path.move(to: CGPoint(x: 0,
                                  y: weekHeight))
            
            path.addLine(to: CGPoint(x: timeWidth + weekWidth * CGFloat(week.count),
                                     y: weekHeight))
            
            for yindex in 1 ..< maxTime - minTime + 1 {
                path.move(to: CGPoint(x: 0,
                                      y: weekHeight + tableHeight * CGFloat(yindex) ))
                
                path.addLine(to: CGPoint(x: timeWidth + weekWidth * CGFloat(week.count),
                                      y: weekHeight + tableHeight * CGFloat(yindex) ))
            }
            
            path.move(to: CGPoint(x: timeWidth,
                                  y: 0))
            
            path.addLine(to: CGPoint(x: timeWidth,
                                     y: weekHeight + tableHeight * CGFloat(maxTime - minTime + 1)))
            
            for xindex in 1 ..< week.count {
                path.move(to: CGPoint(x: timeWidth + weekWidth * CGFloat(xindex),
                                      y: 0))
                path.addLine(to: CGPoint(x: timeWidth + weekWidth * CGFloat(xindex),
                                         y: weekHeight + tableHeight * CGFloat(maxTime - minTime + 1)))
            }
        }
    }
    
}

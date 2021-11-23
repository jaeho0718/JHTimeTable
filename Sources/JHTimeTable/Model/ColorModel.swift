//
//  File.swift
//  
//
//  Created by Lee Jaeho on 2021/11/23.
//

import SwiftUI

extension Color {
    init(hexString: String) {
      let hexString = hexString.trimmingCharacters(in: .whitespacesAndNewlines)
      let scanner = Scanner(string: hexString)
      scanner.charactersToBeSkipped = CharacterSet(charactersIn: "#")

      var color: UInt64 = 0

      if scanner.scanHexInt64(&color) {
        self.init(hex: color, useOpacity: hexString.count > 7)
      }
      else {
        self.init(hex: 0x000000)
      }
    }
    
    init(hex: UInt64, useOpacity opacityChannel: Bool = false) {
      let mask      = UInt64(0xFF)
      let cappedHex = !opacityChannel && hex > 0xffffff ? 0xffffff : hex

      let r = cappedHex >> (opacityChannel ? 24 : 16) & mask
      let g = cappedHex >> (opacityChannel ? 16 : 8) & mask
      let b = cappedHex >> (opacityChannel ? 8 : 0) & mask
      let o = opacityChannel ? cappedHex & mask : 255

      let red     = Double(r) / 255.0
      let green   = Double(g) / 255.0
      let blue    = Double(b) / 255.0
      let opacity = Double(o) / 255.0

      self.init(red: red, green: green, blue: blue, opacity: opacity)
    }
}

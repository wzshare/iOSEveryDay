//
//  Badge.swift
//  SwiftUIDemo
//
//  Created by Zhe Wang on 2022/3/13.
//

import SwiftUI

struct Badge: View {
  var badgeSymbols: some View {
    ForEach(0..<8) { index in
      RotatedBadgeSymbol(
        angle: .degrees(Double(index) / Double(8)) * 360
      )
    }
    .opacity(0.5)
  }

  var body: some View {
    ZStack {
      BadgeBackground()
      // GeometryReader dynamically reports size and position information about the parent view and the device, and updates whenever the size changes; for example, when the user rotates their iPhone.
      GeometryReader { geometry in
        badgeSymbols
          .scaleEffect(1.0 / 4.0, anchor: .top)
          .position(x: geometry.size.width / 2.0, y: (3.0 / 4.0) * geometry.size.height)
      }
    }
    .scaledToFit()
  }
}

struct Badge_Previews: PreviewProvider {
  static var previews: some View {
    Badge()
  }
}

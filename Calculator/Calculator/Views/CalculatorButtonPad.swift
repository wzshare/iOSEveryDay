//
//  CalculatorButtonPad.swift
//  Calculator
//
//  Created by Zhe Wang on 2022/3/1.
//

import SwiftUI

struct CalculatorButtonPad: View {
  let pad: [[CalculatorButtonItem]] = [
    [.command(.clear), .command(.flip), .command(.percent), .op(.divide)],
    [.digit(7), .digit(8), .digit(9), .op(.multiply)],
    [.digit(4), .digit(8), .digit(6), .op(.minus)],
    [.digit(1), .digit(2), .digit(3), .op(.plus)],
    [.digit(0), .dot, .op(.equal)]
  ]
  var body: some View {
    VStack(spacing: 8) {
      ForEach(pad, id: \.self) { row in
        CalculatorButtonRow(row: row)
      }
    }
  }
}

struct CalculatorButtonPad_Previews: PreviewProvider {
  static var previews: some View {
    CalculatorButtonPad()
  }
}

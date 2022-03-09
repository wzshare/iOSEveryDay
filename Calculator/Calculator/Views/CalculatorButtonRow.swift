//
//  CalculatorButtonRow.swift
//  Calculator
//
//  Created by 王哲 on 2022/3/9.
//

import SwiftUI

struct CalculatorButtonRow: View {
  let row: [CalculatorButtonItem]
  var body: some View {
    HStack {
      ForEach(row, id: \.self) { item in
        CalculatorButton(
          title: item.title,
          size: item.size,
          backgroundColorName: item.backgroundColorName) {
            print(item.title)
          }
      }
    }
  }
}

struct CalculatorButtonRow_Previews: PreviewProvider {
  static var previews: some View {
    let row: [CalculatorButtonItem] = [
      .digit(1), .digit(2), .digit(3), .op(.plus)
    ]
    CalculatorButtonRow(row: row)
  }
}

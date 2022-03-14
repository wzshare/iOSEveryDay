//
//  CalculatorButton.swift
//  Calculator
//
//  Created by Zhe Wang on 2022/3/1.
//

import SwiftUI

struct CalculatorButton: View {
  let fontSize: CGFloat = 38
  let title: String
  let size: CGSize
  let backgroundColorName: String
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Text(title)
        .font(.system(size: fontSize))
        .foregroundColor(.white)
        .frame(width: size.width, height: size.height)
        .background(Color(backgroundColorName))
        .cornerRadius(size.width / 2)
    }
  }
}

struct CalculatorButton_Previews: PreviewProvider {
  static var previews: some View {
    CalculatorButton(
      title: "+",
      size: CGSize(width: 88, height: 88),
      backgroundColorName: "operatorBackground") {
        print("+ 1")
      }
  }
}

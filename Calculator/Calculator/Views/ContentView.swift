//
//  ContentView.swift
//  Calculator
//
//  Created by 王哲 on 2022/3/8.
//

import SwiftUI

// Actual view
struct ContentView: View {

  var body: some View {
    VStack(spacing: 12) {
      Spacer()
      Text("0")
        .font(.system(size: 76))
        .minimumScaleFactor(0.5)
        .padding(.trailing, 24)
        .lineLimit(1)
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .trailing)
      CalculatorButtonPad()
        .padding(.bottom)
    }

//    Text("+")
//      .font(.title)
//      .foregroundColor(.white)
//      .padding()
//      .background(Color.orange)
  }
}

// A dummy view followed PreviewProvider protocol
struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

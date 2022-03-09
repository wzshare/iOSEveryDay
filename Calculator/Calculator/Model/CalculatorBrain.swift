//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by 王哲 on 2022/3/9.
//

import Foundation

enum CalculatorBrain {
  case left(String)
  case leftOp(left: String, op: CalculatorButtonItem.Op)
  case leftOrRight(left: String, op: CalculatorButtonItem.Op, right: String)
  case error
}

extension CalculatorBrain {
  var output: String {
    return ""
  }
}

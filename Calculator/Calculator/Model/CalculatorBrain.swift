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

var formatter: NumberFormatter = {
  let f = NumberFormatter()
  f.minimumFractionDigits = 0
  f.maximumFractionDigits = 8
  f.numberStyle = .decimal
  return f
}()

extension CalculatorBrain {
  var output: String {
    let result: String
    switch self {
    case .left(let left):
      result = left
    case .leftOp(let left, _):
      result = left
    case .leftOrRight(_, _, let right):
      result = right
    case .error:
      result = "Error"
    }
    guard let value = Double(result) else {
      return "Error"
    }
    return formatter.string(from: value as NSNumber)!
  }

  func apply(item: CalculatorButtonItem) -> CalculatorBrain {
    switch item {
    case .digit(let num):
      return apply(num: num)
    case .dot:
      return applyDot()
    case .op(let op):
      return apply(op: op)
    case .command(let command):
      return apply(command: command)
    }
  }
}

typealias CalculatorState = CalculatorBrain
typealias CalculatorStateAction = CalculatorButton

struct Reducer {
  static func reduce(
    state: CalculatorState,
    action: CalculatorStateAction
  ) -> CalculatorState {
    return state.apply(item: action)
  }
}

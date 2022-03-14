//
//  SwiftUIDemoApp.swift
//  SwiftUIDemo
//
//  Created by zhe wang on 2021/5/23.
//

import SwiftUI

@main
struct SwiftUIDemoApp: App {
  @StateObject private var modelData = ModelData()

  var body: some Scene {
    WindowGroup {
      ContentView()
        .environmentObject(modelData)
    }
  }
}

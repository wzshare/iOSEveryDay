//
//  Landmark.swift
//  SwiftUIDemo
//
//  Created by 王哲 on 2022/3/5.
//

import Foundation
import SwiftUI
import CoreLocation

// Identifiable: simplify the List code by adding Identifiable conformance to the Landmark type.
struct Landmark: Hashable, Codable, Identifiable {
  var id: Int
  var name: String
  var park: String
  var state: String
  var description: String
  var isFavorite: Bool
  
  private var imageName: String
  var image: Image {
    Image(imageName)
  }
  
  private var coordinates: Coordinates
  var locationCoordinate: CLLocationCoordinate2D {
    CLLocationCoordinate2D(
      latitude: coordinates.latitude,
      longitude: coordinates.longitude)
  }
  
  struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
  }
}

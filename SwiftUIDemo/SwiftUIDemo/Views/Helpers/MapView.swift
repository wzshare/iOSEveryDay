//
//  MapView.swift
//  SwiftUIDemo
//
//  Created by zhe wang on 2022/3/6.
//

import SwiftUI
import MapKit

struct MapView: View {
  var coordinate: CLLocationCoordinate2D
  @State private var region = MKCoordinateRegion(
    center: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868),
    span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
  var body: some View {
    // By prefixing a state variable with $, you pass a binding, which is like a reference to the underlying value. When the user interacts with the map, the map updates the region value to match the part of the map that’s currently visible in the user interface.
    Map(coordinateRegion: $region)
      .onAppear {
        setRegion(coordinate)
      }
  }

  private func setRegion(_ coordinate: CLLocationCoordinate2D) {
    region = MKCoordinateRegion(
      center: coordinate,
      span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
  }
}

struct MapView_Previews: PreviewProvider {
  static var previews: some View {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 34.011_286, longitude: -116.166_868))
  }
}

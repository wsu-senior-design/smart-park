//
//  MapPins.swift
//  smart-park
//
//  Created by Phong Vo on 2/24/22.
//

import Foundation
import CoreLocation
import MapKit

struct MapLocation: Identifiable {
    let id = UUID()
    let company: String
    let parkingLot: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

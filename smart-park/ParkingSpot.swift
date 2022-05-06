//
//  ParkingSpot.swift
//  smart-park
//
//  Created by Phong Vo on 5/5/22.
//
import Foundation
import CoreLocation
import MapKit

struct ParkingSpot: Identifiable {
    let id = UUID()
    var isActive: Bool
    var isTaken: Bool
    let company: String
    let parkingLot: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

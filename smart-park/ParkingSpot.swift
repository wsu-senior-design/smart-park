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
    var status = Taken()
    let transID: String
    let parkingLot: String
    let latitude: Double
    let longitude: Double
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}

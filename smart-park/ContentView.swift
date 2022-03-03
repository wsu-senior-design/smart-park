//
//  ContentView.swift
//  smart-park
//
//  Created by Phong Vo on 2/24/22.
//

import UIKit
import MapKit
import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    // GoCreate Parking Lot
    //37.716216967393, -97.28907238823209
    @State private var defaultRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.716216967393, longitude: -97.28907238823209), span: MKCoordinateSpan(latitudeDelta: 0.0007, longitudeDelta: 0.0007))
    
    let MapLocations = [
        MapLocation(company: "Wichita State University", parkingLot: "GoCreate", latitude: 37.716216967393, longitude: -97.28907238823209)
    ]
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, annotationItems: MapLocations) { (location) in
                MapAnnotation(coordinate: location.coordinate) {
                    Button(action: {print("do something")}, label: {
                        Image("pin")
                            .renderingMode(Image.TemplateRenderingMode?.init(Image.TemplateRenderingMode.original))
                    })
                    
                }
            }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

final class ContentViewModel: NSObject, ObservableObject,
                                CLLocationManagerDelegate {
    
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.716216967393, longitude: -97.28907238823209), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    
    var locationManager: CLLocationManager?
    
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Display alert to go and enable location services.")
        }
    }
    
    private func checkLocationAuthorization() {
        guard let locationManager = locationManager else {
            return
        }
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted.")
        case .denied:
            print("You have denied this app location permissions.  Please change this in settings.")
        case .authorizedAlways, .authorizedWhenInUse:
            //temp break until we can grab user's location, update the UI
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.0007, longitudeDelta: 0.0007))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}

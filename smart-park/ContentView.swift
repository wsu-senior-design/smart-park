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
    
    @State private var buttonClicked = false
    @StateObject private var viewModel = ContentViewModel()
    @State var hidePins = false
    
    // Hard-coded list of Parking Lots
    let MapLocations = [
        MapLocation(company: "Wichita State University", parkingLot: "GoCreate", latitude: 37.716216967393, longitude: -97.28907238823209),
        MapLocation(company: "Wichita State University", parkingLot: "John Bardo Center", latitude: 37.71677259515639, longitude: -97.2856103058299),
        MapLocation(company: "Wichita State University", parkingLot: "Parking Lot A", latitude: 37.71607017390777, longitude: -97.29222805745869)
    ]
    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, annotationItems: MapLocations) { (location) in
                MapAnnotation(coordinate: location.coordinate) {
                    
                    // Hide pins when a parking lot is zoomed in.
                    if !hidePins {
                        Button(action: {
                            zoomIn(location: location)
                            buttonClicked = true
                        }, label: {
                            Pin()
                        })
                    }

                    
                }
            }
        
        // Zoom out of a parking lot when the button is tapped.
        if buttonClicked {
            Button(action: {
                zoomOut()
            }, label: {
                Back()
                    .zIndex(1)
            })
        }
    }
    
    // Function to zoom into a parking lot.
    // TODO: Make API Calls to ThingsBoard and fill parking lot with parking spaces to be updated every 5 seconds.
    func zoomIn(location: MapLocation) {
        hidePins = true
        
        viewModel.region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude), span: MKCoordinateSpan(latitudeDelta: 0.001, longitudeDelta: 0.001))
    }
    
    // Function to zoom out of a parking lot.
    // TODO: Stop making API Calls on a specific parking lot.
    func zoomOut() {
        buttonClicked = false
        hidePins = false
        viewModel.region = viewModel.defaultRegion
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

final class ContentViewModel: NSObject, ObservableObject,
                                CLLocationManagerDelegate {
    
    // Default coordinates of Wichita State University
    @State var defaultRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.71901259459135, longitude: -97.29011164705359), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    // Region to be updated dynamically.
    @Published var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.71901259459135, longitude: -97.29011164705359), span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
    
    var locationManager: CLLocationManager?
    func checkIfLocationServicesIsEnabled() {
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
        } else {
            print("Display alert to go and enable location services.")
        }
    }
    
    // Function to have users authorize the app permission to view location.
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
            defaultRegion = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MKCoordinateSpan(latitudeDelta: 0.0007, longitudeDelta: 0.0007))
        @unknown default:
            break
        }
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }
}

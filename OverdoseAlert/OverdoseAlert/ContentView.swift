//
//  ContentView.swift
//  OverdoseAlert
//
//  Created by Moughil Nandakumar on 9/16/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    

    
    var body: some View {
        Map(coordinateRegion: $viewModel.region, showsUserLocation: true)
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            .onAppear {
                viewModel.checkIfLocationServicesIsEnabled()
                
            }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
    
    
    final class ContentViewModel: NSObject, ObservableObject, CLLocationManagerDelegate {
        
        @State var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 37.33156, longitude: -121.89104), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
    
        var locationManager: CLLocationManager?

        func checkIfLocationServicesIsEnabled() {
            
            if CLLocationManager.locationServicesEnabled() {
                locationManager = CLLocationManager()
                locationManager!.delegate = self
                
            } else {
                print("LOCATION SERVICES ARE OFF // MAKE AN ALERT FOR THIS")
            }
        }
        
        
        private func checkLocationAuthorization () {
            guard let locationManager = locationManager else {return}
            
            switch locationManager.authorizationStatus {
            case .notDetermined:
                locationManager.requestWhenInUseAuthorization()
            case .restricted:
                print("your location is restricted......")
            case .denied:
                print("You have denied location permissions for this application, please allow location services")
            case .authorizedAlways, .authorizedWhenInUse:
                region = MKCoordinateRegion(center: locationManager.location!.coordinate ,
                                            span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
            @unknown default:
                break
            }
        }
        
        func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
            checkLocationAuthorization()
        }
        
        
        
    }
    
}

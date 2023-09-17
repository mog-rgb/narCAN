//
//  LocationsViewModel.swift
//  OverdoseAlert
//
//  Created by Moughil Nandakumar on 9/16/23.
//

import Foundation
import MapKit

class LocationsViewModel: ObservableObject {
    
    
    @Published var locations: [Location]
    
    
    //Current location on the map
    @Published var mapLocation : Location
    
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    
    
    init() {
        let locations = LocationsDataService.locations
        self.locations = locations
        self.mapLocation = locations.first!
    }
    
    
    private func updateMapRegion(location: Location) {
        mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
    }
    
    
}

//
//  LocationsView.swift
//  OverdoseAlert
//
//  Created by Moughil Nandakumar on 9/16/23.
//

import SwiftUI
import MapKit



struct LocationsView: View {
    
    //@StateObject private var vm = LocationsViewModel()
    @EnvironmentObject private var vm: LocationsViewModel
    
    
    var body: some View {
        ZStack {
            Map(coordinateRegion: $vm.mapRegion)
                .ignoresSafeArea()
            
            
            VStack(spacing: 0) {
                header
                    .padding()
                
                Spacer()
            }
           
        }
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView()
            .environmentObject(LocationsViewModel())
    }
}


extension LocationsView {
    
    private var header: some View {
        
        VStack{
            Button(action: vm.toggleLocationsList) {
                Text(vm.mapLocation.name + ", " + vm.mapLocation.cityName)
                    .font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                        .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(Color.purple)
                    .overlay(alignment: .leading) {
                    
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180: 0))
                          
                    }
            }
            
            
            if vm.showLocationsList {
                LocationsListView()
            }
            
           // LocationsListView()
            
            
        }
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x:0, y:15)
    }
    
    
}

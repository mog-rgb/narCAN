//
//  OverdoseAlertApp.swift
//  OverdoseAlert
//
//  Created by Moughil Nandakumar on 9/16/23.
//

import SwiftUI

@main
struct OverdoseAlertApp: App {
    
    
    @StateObject private var vm = LocationsViewModel()
    
    
    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}

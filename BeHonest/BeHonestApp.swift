//
//  BeHonestApp.swift
//  BeHonest
//
//  Created by Arshia Prince on 3/6/23.
//

import SwiftUI

@main
struct BeHonestApp: App {
    
    @StateObject private var mapModel = MapViewModel()
    @StateObject private var vm = LocationsViewModel()
    @StateObject private var fv = FormViewModel()

    var body: some Scene {
        WindowGroup {
//            SplashView().environmentObject(mapModel)
            MapView().environmentObject(mapModel).environmentObject(vm).environmentObject(fv)
            
//            LocationsListView().environmentObject(vm)
        }
    }
}

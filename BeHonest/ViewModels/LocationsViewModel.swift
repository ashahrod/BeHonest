//
//  LocationsViewModel.swift
//  BeHonest
//
//  Created by Arshia Prince on 4/14/23.
//

import SwiftUI
import MapKit

class LocationsViewModel: ObservableObject{
//
    @EnvironmentObject private var mapModel: MapViewModel

    //All loaded locations
    @Published var locations: [Location]
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
    }
    
    //Show list of locations
    @Published var showLocationsList: Bool = false
    
    func toggleLocationsList(){
        withAnimation(.easeInOut) {
            showLocationsList.toggle()
        }
    }
    
    func goToLocation(mv: MapViewModel, location: Location){
        withAnimation(.easeInOut){
            mv.region = MKCoordinateRegion(center: location.coordinates, span: MapDetails.defaultSpan)
            showLocationsList = false
        }
    }
    
}

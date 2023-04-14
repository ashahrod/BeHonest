//
//  LocationsViewModel.swift
//  BeHonest
//
//  Created by Arshia Prince on 4/14/23.
//

import Foundation

class LocationsViewModel: ObservableObject{
    
    @Published var locations: [Location]
    init(){
        let locations = LocationsDataService.locations
        self.locations = locations
    }
}

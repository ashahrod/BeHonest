//
//  Location.swift
//  BeHonest
//
//  Created by Arshia Prince on 4/14/23.
//

import Foundation
import MapKit

struct Location: Identifiable{
    let id = UUID().uuidString
    //can change ID if linked to backend database
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
}

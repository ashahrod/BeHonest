//
//  Location.swift
//  BeHonest
//
//  Created by Arshia Prince on 4/14/23.
//

import Foundation
import MapKit

struct Location: Identifiable, Equatable{
    let id = UUID().uuidString
    //can change ID if linked to backend database
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
//    Identifiable ( did the id up there instead)
//    var id: String {
//        name = "Times Square"
//        cityName = "New York City"
//        name + cityName
//    }
    
    //Equatable
    static func == (lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}

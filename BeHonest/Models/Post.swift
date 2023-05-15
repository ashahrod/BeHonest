//
//  Post.swift
//  BeHonest
//
//  Created by Arshia Prince on 3/19/23.
//

import Foundation
import MapKit


struct Post: Identifiable{
//    represent the pin location
//    let id = UUID().uuidString
    let id: Int
    let caption: String
    let longitude: Double
    let latitude: Double
    var coordinates: CLLocationCoordinate2D{
        return CLLocationCoordinate2D(latitude: CLLocationDegrees(latitude), longitude: CLLocationDegrees(longitude))
    }
    
    init(id: Int, caption: String, longitude: Double, latitude: Double) {
        self.id = id
        self.longitude = longitude
        self.latitude = latitude
        self.caption = caption
    }
    /*
     we need the Post's: emoji for pin,
                        longitude, latitude, Post Title, Comments,
     
     */

    
}

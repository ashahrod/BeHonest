//
//  Post.swift
//  BeHonest
//
//  Created by Arshia Prince on 3/19/23.
//

import Foundation
import MapKit

var incrementID = 1;

struct Post{
//    represent the pin location
//    let id = UUID().uuidString
    let id: Int
    let longitude: Float
    let latitude: Float
    let title: String
    let coordinates: CLLocationCoordinate2D
    
    init(longitude: Float, latitude: Float, title: String, coordinates: CLLocationCoordinate2D) {
        self.id = incrementID
        self.longitude = longitude
        self.latitude = latitude
        self.title = title
        self.coordinates = coordinates
        
        incrementID += 1
    }
    /*
     we need the Post's: emoji for pin,
                        longitude, latitude, Post Title, Comments,
     
     */

    
}

//
//  PostViewModel.swift
//  BeHonest
//
//  Created by Arshia Prince on 5/8/23.
//

import Foundation
import SwiftUI
import MapKit

class PostViewModel: ObservableObject{
//
    @EnvironmentObject private var mapModel: MapViewModel

    //All loaded Posts
    @Published var posts: [Post]
    init(){
        let posts = getAllUsers()
        self.posts = posts
    }

}


//
//  FormViewModel.swift
//  BeHonest
//
//  Created by Arshia Prince on 4/29/23.
//

import SwiftUI
import MapKit


class FormViewModel: ObservableObject {
    
    @EnvironmentObject private var mapModel: MapViewModel

    //Show list of locations
    @Published var showForm: Bool = false
    
    func toggleForm(){
        withAnimation(.easeInOut) {
            print("Button Toggled")
            showForm.toggle()
        }
//        showForm.toggle()
    }

    
}

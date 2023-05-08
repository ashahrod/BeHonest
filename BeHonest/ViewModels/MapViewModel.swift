//
//  MapViewModel.swift
//  BeHonest
//
//  Created by Arshia Prince on 3/20/23.
//

import SwiftUI
import MapKit

enum MapDetails {
    static let startingLocation = CLLocationCoordinate2DMake(37.331516, -121.891054)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
}

final class MapViewModel: NSObject, ObservableObject, CLLocationManagerDelegate{
    
    //Current region on map
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    //All loaded locations
    @Published var locations = [LocationsDataService.locations]


    var locationManager: CLLocationManager?

    //checks if Location Services of the Phone is enabled, not the app
    func checkIfLocationServicesIsEnabled(){
        if CLLocationManager.locationServicesEnabled() {
            locationManager = CLLocationManager()
            locationManager!.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.startUpdatingLocation()
        }
        else{
            print("Show an alert letting them know Phone Location Services is off and to go turn it on.")
        }
    }

    /* this function is called automatically by the Delegate, when the
     locationManager = CLLocationManager() is created, and when the app's authorization changes.
     per the CLLocationManager documentation
     */
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuthorization()
    }

    /* this func is for App Location permission
     make it private so that we can't call this outside the class */
    private func checkLocationAuthorization(){
        guard let locationManager = locationManager else { return } // return nil if the var is not set.
        switch locationManager.authorizationStatus {

        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your location is restricted likely due to parental controls.")
        case .denied:
            print("You have denied this app location permission. Go into settings to change it.")
        case .authorizedAlways, .authorizedWhenInUse:
            print("Authorization has been given for location.")
            // did force unwrap with the !. can fix that
            region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
        @unknown default:
            break
        }
    }
    
//    // created this to be called in LocationsViewModel
//    func updateMapRegion(coordinates: MKCoordinateRegion){
//        region = coordinates
//    }

}

struct Previews_MapViewModel_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}

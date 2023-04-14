//
//  MapView.swift
//  BeHonest
//
//  Created by Arshia Prince on 3/20/23.
//

import MapKit
import SwiftUI

struct MapView: View {
//    @StateObject private var mapModel = MapViewModel()
    @EnvironmentObject private var mapModel: MapViewModel

    var body: some View {
            Map(coordinateRegion: $mapModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .accentColor(Color(.systemPink))
                .onAppear{
                    /*when the map appears, we check to see if location services are enabled.
                     */
                    mapModel.checkIfLocationServicesIsEnabled()

                }
        }
    }


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().environmentObject(MapViewModel())
    }
}

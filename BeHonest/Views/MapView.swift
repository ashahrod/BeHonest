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
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $mapModel.region, showsUserLocation: true)
                .ignoresSafeArea()
                .accentColor(Color(.systemPink))
                .onAppear{
                    /*when the map appears, we check to see if location services are enabled.
                     */
                    mapModel.checkIfLocationServicesIsEnabled()
                    
                }
            VStack(spacing: 0){
                header.padding()
                Spacer()
            }
        }
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().environmentObject(MapViewModel()).environmentObject(LocationsViewModel())
    }
}

extension MapView{
    
    private var header: some View{
        // code for locations list top bar and its button
        VStack{
            Button(action: vm.toggleLocationsList) {
                Text("BeHonest").font(.title2).fontWeight(.black).foregroundColor(.primary).frame(height: 35).frame(maxWidth: .infinity)
                    .overlay(alignment: .leading){
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                        // toggle arrow direction on showLocationsList
                    }
            }
            if vm.showLocationsList{
                LocationsListView().environmentObject(vm).environmentObject(mapModel)
            }
        }
        
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x:0, y:15)
        
    }
    
}

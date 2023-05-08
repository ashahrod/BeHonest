//
//  MapView.swift
//  BeHonest
//
//  Created by Arshia Prince on 3/20/23.
//

import MapKit
import SwiftUI

struct MapView: View {
    @EnvironmentObject private var mapModel: MapViewModel
    @EnvironmentObject private var vm: LocationsViewModel
    @EnvironmentObject private var fm: FormViewModel
    
    var body: some View {
        ZStack{
            Map(coordinateRegion: $mapModel.region, showsUserLocation: true, annotationItems: vm.locations,
                annotationContent: {location in
                MapAnnotation(coordinate: location.coordinates, content: {
                    LocationMapAnnotationView()
                })
            })
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
            Button(action: fm.toggleForm)  {
                Image(systemName: "signpost.right.and.left.circle")
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 60, height: 60)
//                    .padding()
            }
            .background(Color(.clear))
//                .offset(x: 140, y: 330)
            .offset(x: 140 , y: -280)
                .foregroundColor(Color(.black))
                .padding()
                .fullScreenCover(isPresented: $fm.showForm) {
                    NewFormView()
                }
        }
    }
}


struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().environmentObject(MapViewModel()).environmentObject(LocationsViewModel()).environmentObject(FormViewModel())
    }
}

extension MapView{
    
    private var header: some View{
        // code for locations list top bar and its button
        VStack{
            Button(action: vm.toggleLocationsList) {
                Text("BeHonest").font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
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
    
    private var form: some View{
        VStack{
            Button(action: fm.toggleForm) {
                Text("Create a Post!").font(.title2)
                    .fontWeight(.black)
                    .foregroundColor(.primary)
                    .frame(height: 40)
                    .frame(maxWidth: .infinity)
                    .overlay(alignment: .leading){
                        Image(systemName: "arrow.down")
                            .font(.headline)
                            .foregroundColor(.primary)
                            .padding()
                            .rotationEffect(Angle(degrees: fm.showForm ? 0 : 180))
                        // toggle arrow direction on showLocationsList
                    }
            }
            .background(.thickMaterial)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.3), radius: 20, x:0, y:15)
//            if fm.showForm{
//                NewFormView()
//            }
        }
        
        .background(.thickMaterial)
        .cornerRadius(10)
//        .shadow(color: Color.black.opacity(0.3), radius: 20, x:0, y:15)
//        .shadow(color: Color.white, radius: 20, x:0, y:15)
    }
    
}


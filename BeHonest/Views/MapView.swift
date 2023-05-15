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
    @EnvironmentObject private var lvm: LocationsViewModel
    @EnvironmentObject private var fm: FormViewModel
    @EnvironmentObject private var pvm: PostViewModel
    
    
    var body: some View {
        ZStack{
            
            Map(coordinateRegion: $mapModel.region, showsUserLocation: true, annotationItems: pvm.posts,
                annotationContent: {post in
                MapAnnotation(coordinate: post.coordinates, content: {
                    LocationMapAnnotationView(caption: post.caption)
                })
            })
            .ignoresSafeArea()
            .accentColor(Color(.systemPink))
            .onAppear{
                /*when the map appears, we check to see if location services are enabled.
                 */
                mapModel.checkIfLocationServicesIsEnabled()
                
            }
            //                        Map(coordinateRegion: $mapModel.region, showsUserLocation: true, annotationItems: lvm.locations,
            //                            annotationContent: {location in
            //                            MapAnnotation(coordinate: location.coordinates, content: {
            //                                LocationMapAnnotationView(caption: "Hello")
            //                            })
            //                        })
            
            Button(action: {
                if let userLocation = mapModel.getUserLocation() {
                    let region = MKCoordinateRegion(center: userLocation, span: MapDetails.defaultSpan)
                    mapModel.updateMapRegion(coordinates: region)
                }
            }) {
                Image(systemName: "location.fill")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .foregroundColor(.primary)
            }
            .background(Color(.white))
            .cornerRadius(12)
            .padding(16)
            .position(x: 350, y: 700)
            
            
            
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
            .fullScreenCover(isPresented: $fm.showForm)
            {
                NewFormView(coordinates: mapModel.locationManager!.location!.coordinate)
            }
        }
    }
}



extension MapView{
    
    private var header: some View{
        // code for locations list top bar and its button
        VStack{
            Button(action: lvm.toggleLocationsList) {
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
                            .rotationEffect(Angle(degrees: lvm.showLocationsList ? 180 : 0))
                        // toggle arrow direction on showLocationsList
                    }
            }
            if lvm.showLocationsList{
                LocationsListView().environmentObject(lvm).environmentObject(mapModel)
            }
        }
        
        .background(.thickMaterial)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 20, x:0, y:15)
        
    }
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView().environmentObject(MapViewModel()).environmentObject(LocationsViewModel()).environmentObject(FormViewModel())
        //            .environmentObject(PostViewModel())
    }
}

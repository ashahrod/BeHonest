//
//  NewFormView.swift
//  BeHonest
//
//  Created by Arshia Prince on 4/29/23.
//

import SwiftUI
import MapKit

struct NewFormView: View {
    @State private var caption = ""
    @State private var coordinates: CLLocationCoordinate2D
    
    @State private var privatePost = false
    @State private var anonymous = false
    
    //had to add this due to passing in CLLocationCoordinate2D from MapView
    // this is to have the users location for the new pin
    init(coordinates: CLLocationCoordinate2D) {
        _coordinates = State(initialValue: coordinates)
    }
    
    //if not passed in, just use default Starting Location
    //for TESTING purposes
    init() {
        _coordinates = State(initialValue: MapDetails.startingLocation)
    }
    

    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            HStack{
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Cancel")
                        .foregroundColor(Color(.systemBlue))
                        .bold()
                }
                
                Spacer()
                
                Button {
                    saveUser()
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Submit")
                        .bold()
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                        .background(Color(.systemBlue))
                        .foregroundColor(.white)
                        .clipShape(Capsule())
                }
                
            }.padding()
            
            HStack(alignment: .top){
                Circle()
                    .frame(width: 64, height: 64)
                TextArea("What's popping", text: $caption)
            }
            .padding()
            
//            VStack {
//                Text(String(coordinates.longitude) + " a " + String(coordinates.latitude))
//            }
//            .padding()
            
            VStack(alignment: .center){
                Section(header: Text("Actions").bold()){
                    Toggle("Private Post (friends only)", isOn: $privatePost)
                    Toggle("Anonymous", isOn: $anonymous)
                    Link("Terms of Service", destination: URL(string: "https://google.com")!)
                }
            }.padding()
                .offset(y: -50)
        }
    }
    func saveUser(){
        print("User Saved")
        createPostsTable()
        print("lat, long:" + String(coordinates.latitude) + "  " + String(coordinates.longitude))
        insertPost(dbcaption: caption, dblongitude: String(coordinates.longitude), dblatitude: String(coordinates.latitude))
        printAllUsers()
        
    }
}



struct NewFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewFormView(coordinates: CLLocationCoordinate2D(latitude: 0, longitude: 0))
    }
}

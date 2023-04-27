//
//  LocationMapAnnotationView.swift
//  BeHonest
//
//  Created by Arshia Prince on 4/26/23.
//

import SwiftUI
//can change this to PostsMapAnnotationView

struct LocationMapAnnotationView: View {
    
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack(spacing: 0){
            Image(systemName: "mappin.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .font(.headline)
                .padding(6)
                .background(accentColor)
                .clipShape(Circle())
            
            Image(systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 10, height: 10)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -3)
                .padding(.bottom, 45)
//            might not need this line above^
            // its so that the pin doesnt block location, its half way up it. in conjunction with line below
        }
//        .background(Color.blue)
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotationView()
    }
}

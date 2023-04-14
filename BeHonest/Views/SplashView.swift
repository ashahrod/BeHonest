//
//  SplashView.swift
//  BeHonest
//
//  Created by Arshia Prince on 3/20/23.
//

import Foundation
import SwiftUI

struct SplashView: View {
    @State private var isActive = true
    @EnvironmentObject private var mapModel: MapViewModel
    
    var body: some View {
        
        if isActive {
            ZStack {
                Color.black
                Text("BeHonest")
                    .font(.system(size: 60, weight: .bold))
                    .foregroundColor(.white)
            }
            .ignoresSafeArea(.all)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0){
                    self.isActive = false
                }
            }
        }
        else{
            MapView()
            .environmentObject(mapModel)
        }
        
    }
}

//
//struct threeNav: View{
//    @State private var showingSplash = true
//    var body: some View{
//        ZStack {
//            Color.white
//
//            VStack {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundColor(.black)
//                Text("BeHonest!")
//                Spacer()
//                HStack(spacing: 30) {
//                    Button(action: {
//                        // action for home button
//                    }) {
//                        Image(systemName: "house")
//                    }
//                    .padding(30)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.white)
//
//                    Button(action: {
//                        // action for button 2
//                    }) {
//                        Image(systemName: "heart.fill")
//                            .font(.system(size: 30))
//                            .foregroundColor(.red)
//                    }
//                    .padding(30)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.white)
//
//                    Button(action: {
//                        // action for button 3
//                    }) {
//                        Circle()
//                            .frame(width: 60, height: 60)
//                            .foregroundColor(.gray)
//                    }
//                    .padding(30)
//                    .frame(maxWidth: .infinity)
//                    .background(Color.white)
//                }
//                .frame(maxWidth: .infinity)
//                .background(Color.white.ignoresSafeArea(.all))
//            }
//            .padding()
//
//            if showingSplash {
//                SplashView()
//                    .onAppear {
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
//                            withAnimation {
//                                showingSplash = false
//                            }
//                        }
//                    }
//            }
//        }
//    }
//}

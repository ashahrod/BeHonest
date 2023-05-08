//
//  NewFormView.swift
//  BeHonest
//
//  Created by Arshia Prince on 4/29/23.
//

import SwiftUI

struct NewFormView: View {
    @State private var caption = ""
    
    @State private var privatePost = false
    @State private var anonymous = false

    // get rid of this ppresetnation mode, its not working
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
                    print("Tweet")
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
}

struct NewFormView_Previews: PreviewProvider {
    static var previews: some View {
        NewFormView()
    }
}

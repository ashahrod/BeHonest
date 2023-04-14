import Foundation
import SwiftUI

struct formView: View {
    @State private var postTitle = ""
    @State private var description = ""
    @State private var privatePost = false
    @State private var anonymous = false
    var body: some View {
        NavigationView{
            Form{
                Section(header: Text("Post Information")){
                    TextField("Post Title", text: $postTitle)
                    TextField("Description", text: $description)
                }
                Section(header: Text("Actions")){
                    Toggle("Private Post (friends only)", isOn: $privatePost)
                    Toggle("Anonymous", isOn: $anonymous)
                    Link("Terms of Service", destination: URL(string: "https://google.com")!)
                }
                
            }.navigationTitle("Make A Post!")
                .toolbar{
                    ToolbarItemGroup (placement: .navigationBarTrailing){
                        Button {
                            hideKeyboard()
                        } label:{
                            Image(systemName: "keyboard.chevron.compact.down")
                        }
                        Button("Save", action: saveUser)
                    }
                }
            }
        }
        func saveUser(){
            print("User Saved")
            createPostsTable()
            insertPost(userName: description, postTitle: postTitle)
            getAllUsers()

    }
}

extension View{
    func hideKeyboard(){
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

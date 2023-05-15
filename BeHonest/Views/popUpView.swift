import SwiftUI

struct PopupTextView: View {
    @State private var isPopupVisible = false
    let inputText: String
    
    var body: some View {
        VStack {
            Button("Show Popup") {
                isPopupVisible.toggle()
            }
            .padding()
            
            if isPopupVisible {
                VStack {
                    Spacer()
                    Text(inputText)
                        .padding()
                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(Color.black.opacity(0.5))
                .transition(.move(edge: .bottom))
                .onTapGesture {
                    isPopupVisible.toggle()
                }
            }
        }
    }
}

struct PopupTextView_Previews: PreviewProvider {
    static var previews: some View {
        PopupTextView(inputText: "Hello, World!")
    }
}


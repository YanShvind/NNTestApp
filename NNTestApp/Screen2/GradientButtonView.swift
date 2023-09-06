
import SwiftUI

struct GradientButtonView: View {
    let fact: String
    @State private var showAlert = false
    
    var body: some View {
        Button(action: {
            showAlert = true
        }) {
            Rectangle()
                .fill(LinearGradient(gradient: Gradient(colors: [.blue, .purple]), startPoint: .leading, endPoint: .trailing))
                .frame(width: 200, height: 50)
                .cornerRadius(12)
                .overlay(
                    Text("Tap")
                        .foregroundColor(.white)
                )
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Fact"), message: Text(fact), dismissButton: .default(Text("OK")))
        }
    }
}

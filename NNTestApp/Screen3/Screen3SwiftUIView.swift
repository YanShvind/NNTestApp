
import SwiftUI

struct Screen3SwiftUIView: View {
    @Binding var isScreen4Presented: Bool
    
    var body: some View {
        Button(action: {
            isScreen4Presented = true
        }) {
            Text("Screen 4")
                .padding()
                .foregroundColor(.white)
                .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.blue]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(8)
        }
        .fullScreenCover(isPresented: $isScreen4Presented,
                         content: Screen4SwiftUIView.init)
    }
}

struct Screen3SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Screen3SwiftUIView(isScreen4Presented: .constant(false))
    }
}


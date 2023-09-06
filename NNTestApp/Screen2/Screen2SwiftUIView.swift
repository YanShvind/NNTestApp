
import SwiftUI

struct Screen2SwiftUIView: View {
    @ObservedObject var factsLoader: FactsLoader
    
    var body: some View {
        VStack {
            if factsLoader.facts.isEmpty {
                ProgressView()
            } else {
                Button(action: {
                    factsLoader.fetchData()
                }) {
                    Text("New Facts")
                        .padding()
                        .foregroundColor(.white)
                        .background(LinearGradient(gradient: Gradient(colors: [Color.yellow, Color.red]), startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(12)
                }
                ForEach(0..<10) { index in
                    if index < factsLoader.facts.count {
                        GradientButtonView(fact: factsLoader.facts[index].fact)
                    }
                }
            }
        }
        .onAppear() {
            factsLoader.fetchData()
        }
    }
}


struct Screen2_Previews: PreviewProvider {
    static var previews: some View {
        Screen2SwiftUIView(factsLoader: FactsLoader())
    }
}

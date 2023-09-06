
import SwiftUI

struct ContentView: View {
    @AppStorage("isScreen4Presented") var isScreen4Presented: Bool = false
    
    var body: some View {
        TabView {
            Screen1SwiftUIView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Screen 1")
                }
            
            Screen2SwiftUIView(factsLoader: FactsLoader())
                .tabItem {
                    Image(systemName: "person")
                    Text("Screen 2")
                }
            
            Screen3SwiftUIView(isScreen4Presented: $isScreen4Presented)
                .tabItem {
                    Image(systemName: "arrowshape.forward")
                    Text("Screen 3")
                }
        }
        .fullScreenCover(isPresented: $isScreen4Presented,
                         content: Screen4SwiftUIView.init)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

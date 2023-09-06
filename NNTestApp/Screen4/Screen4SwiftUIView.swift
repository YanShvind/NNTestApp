
import SwiftUI
import WebKit

struct Screen4SwiftUIView: View {
    var body: some View {
        WebView(url: URL(string: "https://google.com")!)
    }
}

struct Screen4SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        Screen4SwiftUIView()
    }
}

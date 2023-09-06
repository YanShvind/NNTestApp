
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: URL?

    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()

        let swipeLeft = UISwipeGestureRecognizer(target: webView, action: #selector(webView.goForward))
        swipeLeft.direction = .left
        webView.addGestureRecognizer(swipeLeft)

        let swipeRight = UISwipeGestureRecognizer(target: webView, action: #selector(webView.goBack))
        swipeRight.direction = .right
        webView.addGestureRecognizer(swipeRight)

        return webView
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let myURL = url else { return }
        let request = URLRequest(url: myURL)
        uiView.load(request)
    }
}

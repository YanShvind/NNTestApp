
import SwiftUI

final class FactsLoader: ObservableObject {
    @Published var facts: [Fact] = []

    func fetchData() {
        let url = URL(string: "https://api.api-ninjas.com/v1/facts?limit=10")!
        var request = URLRequest(url: url)
        request.setValue("DXS7S79tMDR6HnN7Y3L9iqy8WCDJiO7UNcDEpYBz", forHTTPHeaderField: "X-Api-Key")

        let task = URLSession.shared.dataTask(with: request) { [weak self] (data, response, error) in
            guard let data = data else { return }

            do {
                if let jsonObject = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    let fact = Fact(fact: jsonObject["fact"] as? String ?? "")
                    DispatchQueue.main.async {
                        self?.facts = [fact]
                    }
                } else {
                    let decoder = JSONDecoder()
                    let decodedData = try decoder.decode([Fact].self, from: data)

                    DispatchQueue.main.async {
                        self?.facts = decodedData
                    }
                }
            } catch {
                print("Error decoding data: \(error)")
            }
        }
        task.resume()
    }
}



import SwiftUI

@main
struct NNTestAppApp: App {
    @StateObject private var baseDataModel = BaseDataModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, baseDataModel.container.viewContext)
        }
    }
}

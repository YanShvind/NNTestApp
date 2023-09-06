
import Foundation
import CoreData

final class BaseDataModel: ObservableObject {
    let container = NSPersistentContainer(name: "BaseModel")
    
    init() {
        container.loadPersistentStores { desc, error in
            if let error = error {
                print("Failed to load the data \(error.localizedDescription)")
            }
        }
    }
}

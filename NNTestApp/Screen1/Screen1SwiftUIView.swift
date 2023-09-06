
import SwiftUI
import CoreData

struct Screen1SwiftUIView: View {
    @Environment(\.managedObjectContext) private var viewContext
    @State private var textFieldInput: String = ""
    @FetchRequest(entity: Base.entity(),
                  sortDescriptors: [NSSortDescriptor(keyPath: \Base.name, ascending: true)]) var baseItems: FetchedResults<Base>

    var body: some View {
        VStack {
            TextField("Enter data", text: $textFieldInput)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                if !textFieldInput.isEmpty {
                    addModel(name: textFieldInput)
                    textFieldInput = ""
                }
            }) {
                Text("Save")
                    .padding()
                    .foregroundColor(.white)
                    .background(LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .leading, endPoint: .trailing))
                    .cornerRadius(8)
            }
            
            List {
                ForEach(baseItems, id: \.self) { item in
                    Text(item.name ?? "")
                }
            }
        }
    }
    
    private func addModel(name: String) {
        withAnimation {
            let newBaseModel = Base(context: viewContext)
            newBaseModel.name = name
            saveContext()
        }
    }
    
    private func saveContext() {
        do {
            try viewContext.save()
            print("Data Saved!")
        } catch {
            print("We could not save the data...")
        }
    }
}

struct Screen1_Previews: PreviewProvider {
    static var previews: some View {
        Screen1SwiftUIView()
    }
}

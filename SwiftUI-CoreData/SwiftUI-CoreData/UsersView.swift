//
//  UsersView.swift
//  SwiftUI-CoreData
//
//  Created by David Lee on 22/04/20.
//  Copyright © 2020 David Lee. All rights reserved.
//

import SwiftUI

struct UsersView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Users.entity(), sortDescriptors: []) var users: FetchedResults<Users>
    
    var body: some View {
        VStack {
                    List {
                        ForEach(users, id: \.id) { user in
                            Text(user.name ?? "No user")
                        }
                    }
                    
                    Button("Add") {
                        let firstName = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                        let lastName = ["Granger", "Lovegood", "Potter", "Weasley"]
                        
                        let chooseFirstName = firstName.randomElement()!
                        let chooseLastName = lastName.randomElement()!
                        
                        let user = Users(context: self.moc)
                        user.id = UUID()
                        user.name = "\(chooseFirstName) \(chooseLastName)"
                        
                        try? self.moc.save()
                    }
                }
                
        //        CustomView()
    }
}

struct UsersView_Previews: PreviewProvider {
    static var previews: some View {
        UsersView()
    }
}

//struct CustomView: View {
//    @ObservedObject var observedData = Observable()
//    @State private var user = ""
//
//    var body: some View {
//
//        NavigationView {
//            VStack {
//                List {
//                    ForEach(observedData.data) { data in
//                        Text(data.user)
//                    }
//                    .onDelete { indexSet in
//                        self.observedData.deleteData(indexSet: indexSet, id: self.observedData.data[indexSet.first!].id)
//                    }
//                }
//                .navigationBarTitle("CoreData")
//
//                HStack {
//                    TextField("User", text: $user)
//                        .textFieldStyle(RoundedBorderTextFieldStyle())
//
//                    Button(action: {
//                        if self.user != "" {
//                            self.observedData.addData(user: self.user)
//                        }
//                        self.user = ""
//                    }) {
//                        Text("Add")
//                    }
//                }
//                .padding()
//            }
//        }
//    }
//
//}
//
//class Observable: ObservableObject {
//
//    @Published var data = [DataType]()
//
//    init() {
//        let app = UIApplication.shared.delegate as! AppDelegate
//        let context = app.persistentContainer.viewContext
//        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
//
//        do {
//            let res = try context.fetch(req)
//
//            for i in res as! [NSManagedObject] {
//                self.data.append(DataType(id: i.objectID, user: i.value(forKey: "user") as! String))
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//
//    func addData(user: String) {
//        let app = UIApplication.shared.delegate as! AppDelegate
//        let context = app.persistentContainer.viewContext
//        let entity = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
//
//        entity.setValue(user, forKey: "user")
//
//        do {
//            try context.save()
//            data.append(DataType(id: entity.objectID, user: user))
//            print("Success")
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//
//    func deleteData(indexSet: IndexSet, id: NSManagedObjectID) {
//        let app = UIApplication.shared.delegate as! AppDelegate
//        let context = app.persistentContainer.viewContext
//        let req = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
//
//        do {
//            let res = try context.fetch(req)
//
//            for i in res as! [NSManagedObject] {
//                if i.objectID == id {
//                    try context.execute(NSBatchDeleteRequest(objectIDs: [id]))
//                    self.data.remove(atOffsets: indexSet)
//                }
//            }
//        } catch {
//            print(error.localizedDescription)
//        }
//    }
//}
//
//struct DataType: Identifiable {
//    var id: NSManagedObjectID
//    var user: String
//}

//
//  PersonsAppApp.swift
//  PersonsApp
//
//  Created by Nefise Hazır on 21.01.2025.
//

import SwiftUI
import CoreData
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}
@main
struct PersonsAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            HomeScreen()
        }
    }
}

var persistentContainer: NSPersistentContainer = {
let container = NSPersistentContainer(name: "Model")
container.loadPersistentStores(completionHandler: { (storeDescription, error)
in
if let error = error as NSError? {
fatalError("Unresolved error \(error), \(error.userInfo)")
}
})
return container
}()
func saveContext () {
let context = persistentContainer.viewContext
if context.hasChanges {
do {
try context.save()
} catch {
let nserror = error as NSError
fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
}
}
}

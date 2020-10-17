//
//  githubappApp.swift
//  githubapp
//
//  Created by AlbertStanley on 17/10/20.
//

import SwiftUI

@main
struct githubappApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

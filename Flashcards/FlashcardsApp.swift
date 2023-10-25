//
//  FlashcardsApp.swift
//  Flashcards
//
//  Created by Bell Chen on 10/16/23.
//

import SwiftUI

@main
struct FlashcardsApp: App {
    @StateObject private var store = DataStore()
    var body: some Scene {
        WindowGroup {
            ContentView(collections: $store.collections){
                Task {
                    do {
                        try await store.save(collections: store.collections)
                    } catch {
                        fatalError(error.localizedDescription)
                    }
                }
            }.task{
                do {
                    try await store.load()
                } catch {
                    fatalError(error.localizedDescription)
                }
            }
        }
    }
}

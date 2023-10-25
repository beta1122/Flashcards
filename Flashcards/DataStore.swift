//
//  DataStore.swift
//  Flashcards
//
//  Created by Bell Chen on 10/17/23.
//

import Foundation
import SwiftUI

@MainActor
class DataStore: ObservableObject {
    @Published var collections: [Collection] = []
    
    private static func fileURL() throws -> URL {
        try FileManager.default.url(for: .documentDirectory,
                                    in: .userDomainMask,
                                    appropriateFor: nil,
                                    create: false)
        .appendingPathComponent("app.data")
    }
    
    func load() async throws {
        let task = Task<[Collection], Error> {
            let fileURL = try Self.fileURL()
            guard let data = try? Data(contentsOf: fileURL) else {
                return []
            }
            let data1 = try JSONDecoder().decode([Collection].self, from: data)
            return data1
        }
        let data = try await task.value
        self.collections = data
    }
    
    func save(collections: [Collection]) async throws {
        let task = Task {
            let data = try JSONEncoder().encode(self.collections)
            let outfile = try Self.fileURL()
            try data.write(to: outfile)
        }
        _ = try await task.value
    }
}

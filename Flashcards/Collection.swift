//
//  Collection.swift
//  Flashcards
//
//  Created by Bell Chen on 10/17/23.
//

import Foundation

struct Collection: Identifiable, Codable{
    let id: UUID
    let name: String
    let decks: [Deck]
    
    init(id: UUID = UUID(), name: String, decks: [Deck]) {
        self.id = id
        self.name = name
        self.decks = decks
    }
    
}

extension Collection{
    static var sampleCollection: Collection = Collection(name: "Psychology", decks: [Deck.sampleDeck, Deck.sampleDeck2, Deck.sampleDeck3, Deck.sampleDeck4, Deck.sampleDeck5])
    static var sampleList: [Collection] = [
        Collection(name: "History", decks: [Deck.sampleDeck, Deck.sampleDeck2, Deck.sampleDeck3, Deck.sampleDeck4, Deck.sampleDeck5]),
        Collection(name: "Psychology", decks: [Deck.sampleDeck]),
        Collection(name: "French", decks: [Deck.sampleDeck]),
    ]
}

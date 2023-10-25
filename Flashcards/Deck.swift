//
//  Deck.swift
//  Flashcards
//
//  Created by Bell Chen on 10/17/23.
//

import Foundation
struct Deck: Identifiable, Codable{
    let id: UUID
    let name: String
    let flashcards: [Flashcard]
    let shuffle: Bool
    
    private var correct: Int = 0
    private var incorrect: Int = 0
    
    mutating func addCorrect(){
        correct = correct + 1
    }
    mutating func addIncorrect(){
        incorrect = incorrect + 1
    }
    var accuracy: Double {
        return (Double)(correct) / (Double)(correct+incorrect)
    }
    
    init(id: UUID = UUID(), name: String, flashcards: [Flashcard], shuffle: Bool = false) {
        self.id = id
        self.name = name
        self.flashcards = flashcards
        self.shuffle = shuffle
    }
}

extension Deck{
    static let sampleDeck: Deck = Deck(name: "Sample Deck", flashcards: Flashcard.sampleArray)
    static let sampleDeck2: Deck = Deck(name: "Chapter 3", flashcards: Flashcard.chapter3)
    static let sampleDeck3: Deck = Deck(name: "Brain", flashcards: Flashcard.chapter3)
    static let sampleDeck4: Deck = Deck(name: "Drugs", flashcards: Flashcard.chapter3)
    static let sampleDeck5: Deck = Deck(name: "Neurotransmitters", flashcards: Flashcard.chapter3)
    
}


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
    var flashcards: [Flashcard]
    let shuffle: Bool
    var fontSize: CGFloat = 20
    var correct: Int = 0
    var incorrect: Int = 0
    var theme: Theme = .blue
    
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
    static let sampleDeck2: Deck = Deck(name: "Chapter 3", flashcards: Flashcard.chapter3, shuffle: true)
    static let sampleDeck3: Deck = Deck(name: "Chapter 6", flashcards: Flashcard.chapter6, shuffle: true)
    static let sampleDeck4: Deck = Deck(name: "Chapter 7", flashcards: Flashcard.chapter7, shuffle: true)
    static let sampleDeck5: Deck = Deck(name: "Neurotransmitters", flashcards: Flashcard.chapter3)
    
}


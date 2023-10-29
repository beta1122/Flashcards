//
//  FlashcardManager.swift
//  Flashcards
//
//  Created by Bell Chen on 10/20/23.
//

import Foundation

struct FlashcardManager{
    private var flashcards: [Flashcard] = []
    
    init(deck: Deck){
        self.flashcards = deck.flashcards
        if(deck.shuffle){
            shufflecards()
        }
        flipcards()
    }
    init(){
        
    }
    
    
    mutating func shufflecards(){
        for _ in 0..<flashcards.count{
            let randomIndex1 = Int.random(in: 0..<flashcards.count)
            let randomIndex2 = Int.random(in: 0..<flashcards.count)
            let tempCard1 = flashcards[randomIndex1]
            flashcards[randomIndex1] = flashcards[randomIndex2]
            flashcards[randomIndex2] = tempCard1
        }
        print("Shuffled deck")
    }
    mutating func flipcards(){
        for i in 0..<flashcards.count{
            if(flashcards[i].type == .definition){
                let randomValue = arc4random_uniform(2)
                if(randomValue == 1){
                    let temp = flashcards[i].front
                    flashcards[i].front = flashcards[i].back
                    flashcards[i].back = temp
                }
            }
        }
    }
    mutating func add(flashcard: Flashcard){
        flashcards.append(flashcard)
    }
    mutating func addDeck(deck: Deck){
        flashcards = deck.flashcards
        if(deck.shuffle){
            shufflecards()
        }
    }
    mutating func remove(){
        flashcards.removeFirst()
    }
    mutating func moveToBack(){
        flashcards.append(flashcards.removeFirst())
    }
    var front: Flashcard?{
        return flashcards.first
    }
    
}

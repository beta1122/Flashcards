//
//  CardEditView.swift
//  Flashcards
//
//  Created by Bell Chen on 10/17/23.
//

import SwiftUI

struct CardEditView: View {
    
    @Binding var flashcard: Flashcard
    
    var body: some View {
        Form{
            Section("Edit flashcard"){
                switch(flashcard.type){
                case .normal:
                    TextField("Front",text: $flashcard.front)
                    TextField("Back",text: $flashcard.back)
                case .definition:
                    TextField("Term",text: $flashcard.front)
                    TextField("Definition",text: $flashcard.back)
                case .list:
                    TextField("Prompt", text: $flashcard.prompt)
                    ForEach($flashcard.listItems, id:\.self){ $item in
                        Text("\(item)")
                    }.onDelete(){ indices in
                        flashcard.listItems.remove(atOffsets: indices)
                    }
                }
            }
        }
    }
}

struct CardEditView_Previews: PreviewProvider {
    static let sampleFlashcard = Flashcard(front: "a", back: "b")
    static var previews: some View {
        CardEditView(flashcard: .constant(sampleFlashcard))
    }
}

//
//  FlashcardEditView.swift
//  Flashcards
//
//  Created by Bell Chen on 10/24/23.
//

import SwiftUI

struct FlashcardEditView: View {
    @Binding var manager: FlashcardManager
    var body: some View {
        Form{
            Section("Options"){
                Text("Shuffle deck")
            }
            
        }
    }
}

struct FlashcardEditView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardEditView(manager: .constant(FlashcardManager()))
    }
}

//
//  ListCardView.swift
//  Flashcards
//
//  Created by Bell Chen on 10/24/23.
//

import SwiftUI

struct ListCardView: View {
    var currentIndex: Int
    
    var flashcard: Flashcard
    var fontSize: CGFloat
    var body: some View {
        if(currentIndex == -1){
            Text(flashcard.prompt)
                .font(.system(size: fontSize))
                .padding(10)
                .frame(maxWidth: .infinity, maxHeight: 500, alignment: .top)
        } else if(currentIndex >= 0 && currentIndex < flashcard.listItems.count){
            VStack{
                Text(flashcard.prompt)
                    .font(.system(size: fontSize))
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: 500, alignment: .top)
                Text("\(currentIndex+1). \(flashcard.listItems[currentIndex])")
                    .font(.system(size: fontSize))
                    .padding(10)
                    .frame(maxWidth: .infinity, maxHeight: 500, alignment: .top)
                Spacer()
            }
        }else if(currentIndex == flashcard.listItems.count){
            Text("Hi")
        }
        
    }
}

struct ListCardView_Previews: PreviewProvider {
    static var previews: some View {
        
        ListCardView(currentIndex: 1, flashcard: Flashcard(prompt: "What are the first five letters", listItems: ["A","b","c","d","E"]), fontSize: 20)
       
    }
}

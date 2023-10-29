//
//  DeckView.swift
//  Flashcards
//
//  Created by Bell Chen on 10/18/23.
//

import SwiftUI

struct DeckView: View {
    var deck: Deck
    var body: some View {
        ZStack(alignment: .top){
            RoundedRectangle(cornerRadius: 20)
                .fill(deck.theme.mainColor)
                .frame(height: 200)
            VStack{
                HStack{
                    Text(deck.name)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding()
                    Text("\(deck.flashcards.count) flashcards")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                        .padding()
                    
                }
                Spacer()
                HStack{
                    Text("90% accuracy")
                        .font(.body)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding()
                    Text("Last opened: Yesterday")
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .topTrailing)
                        .padding()
                    
                }
            }.padding()
            
                
        }.frame(height:200)
        
    }
}

struct DeckView_Previews: PreviewProvider {
    static var previews: some View {
        DeckView(deck: Deck.sampleDeck)
    }
}

//
//  DeckListView.swift
//  Flashcards
//
//  Created by Bell Chen on 10/18/23.
//

import SwiftUI

struct DeckListView: View {
    @Binding var collection: Collection
    @Environment(\.presentationMode) private var presentationMode
    var body: some View {
        NavigationStack{
            ScrollView{
                HStack(alignment:.top){
                    Button("Back"){
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                    Text(collection.name).frame(alignment: .leading).font(.title)
                    Spacer()
                    NavigationLink(destination: NewDeckView(collection: $collection)){
                        Text("New  ")
                    }.navigationTitle(collection.name).navigationBarHidden(true)
                    
                }.padding()
                
                ForEach($collection.decks){ $deck in
                    NavigationLink(destination: FlashcardView(deck: $deck)){
                        DeckView(deck: deck)
                    }.buttonStyle(PlainButtonStyle())
                }
                
                
                Spacer()
            }
            
        }
        
    }
}

struct DeckListView_Previews: PreviewProvider {
    static var previews: some View {
        DeckListView(collection: .constant(Collection.sampleCollection))
    }
}

//
//  ContentView.swift
//  Flashcards
//
//  Created by Bell Chen on 10/16/23.
//

import SwiftUI

struct ContentView: View {
    @Binding var collections: [Collection]
    let saveAction : () -> Void
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack {
                    HStack{
                        Text("Collections").font(.largeTitle).frame(maxWidth: .infinity, alignment:.leading)
                        Spacer()
                        NavigationLink("New"){
                            
                        }
                    }
                    
                    ForEach($collections, id: \.id){$collection in
                        
                        NavigationLink(destination: DeckListView(collection: $collection)){
                            CollectionView(collection: collection).background(Color.blue)
                        }.buttonStyle(PlainButtonStyle())
                            
                        
                    }
                    Spacer()
                    
                }.navigationTitle("Collections").navigationBarHidden(true)
                    
            }.padding()
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(collections: .constant(Collection.sampleList), saveAction: {})
    }
}

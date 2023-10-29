//
//  CollectionView.swift
//  Flashcards
//
//  Created by Bell Chen on 10/17/23.
//

import SwiftUI

struct CollectionView: View {
    var collection: Collection
    var body: some View {
        
                
                VStack{
                    Text(collection.name)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding()
                    
                }
                .padding()
                .foregroundColor(collection.theme.accentColor)
                
                
                
            
            Spacer()
        
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView(collection: Collection.sampleCollection)
    }
}

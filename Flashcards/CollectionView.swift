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
            ZStack(alignment: .top){
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(red: 0/255, green: 255/255, blue: 255/255))
                    .frame(height: 200)
                VStack{
                    Text(collection.name)
                        .frame(maxWidth: .infinity, alignment: .topLeading)
                        .padding()
                    
                }
                
            }
            Spacer()
        }
    }
}

struct CollectionView_Previews: PreviewProvider {
    static var previews: some View {
        CollectionView(collection: Collection.sampleCollection)
    }
}

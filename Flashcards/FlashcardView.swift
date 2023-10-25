//
//  FlashcardView.swift
//  Flashcards
//
//  Created by Bell Chen on 10/16/23.
//

import SwiftUI

//green button removes and red button puts at the back of deck
struct FlashcardView: View {
    @State var currentIndex: Int = 0
    @State var isFlipped: Bool = false
    @State var isTouched: Bool = false
    @State var redButtonIsTouched: Bool = false
    @State var manager: FlashcardManager = FlashcardManager()
    @Environment(\.presentationMode) private var presentationMode
    var deck: Deck
    var body: some View {
        
        NavigationStack{
            VStack(alignment:.leading, spacing: 15){
                HStack(alignment:.top){
                    Button("Back"){
                        presentationMode.wrappedValue.dismiss()
                    }
                    Spacer()
                    Text("Psych chapter 3").font(.title)
                        .frame(alignment:.center)
                    Spacer()
                    NavigationLink(destination: Text("heh heh")){
                        Text("Edit")
                    }
                    
                }.onAppear(){
                    manager.addDeck(deck: deck)
                }
                
                
                ZStack(alignment: .center){
                    GeometryReader{ geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 184 / 255, green: 204 / 255, blue: 255 / 255))
                            .frame(width: geometry.size.width)
                        if let flashcard = manager.front{
                            if(!isFlipped){
                                Text(flashcard.front)
                                    .font(.largeTitle)
                                    .padding(10)
                                    .frame(maxWidth: .infinity, maxHeight: 500, alignment: .top)
                                
                            } else {
                                Text(flashcard.back)
                                    .font(.largeTitle)
                                    .padding(10)
                                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                                    .multilineTextAlignment(.center)
                            }
                        } else {
                            Text("loading")
                        }
                        
                        
                    }
                    
                }
                .frame(height: 500)
                .onTapGesture {
                    isFlipped.toggle()
                }
                .navigationBarHidden(true)
                
                GeometryReader{ geometry in
                    HStack(){
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(isTouched ? .blue: .green)
                                .frame(width: geometry.size.width/2-10)
                                .onTapGesture {
                                    isTouched = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                                        manager.remove()
                                        isTouched = false
                                        isFlipped = false
                                    }
                                }
                            Text("Remembered")
                        }
                        Spacer()
                        ZStack{
                            RoundedRectangle(cornerRadius: 20)
                                .fill(.red)
                                .frame(width: geometry.size.width/2-10)
                                .onTapGesture {
                                    redButtonIsTouched = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.2){
                                        manager.remove()
                                        redButtonIsTouched = false
                                        isFlipped = false
                                    }
                                }
                            Text("Didn't")
                        }
                        
                    }
                }
                
                Spacer()
                
            }.padding()
        }
    }
}

struct FlashcardView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardView(deck: Deck.sampleDeck2)
    }
}

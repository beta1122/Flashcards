//
//  FlashcardView.swift
//  Flashcards
//
//  Created by Bell Chen on 10/16/23.
//

import SwiftUI

//green button removes and red button puts at the back of deck
struct FlashcardView: View {
    @State var currentIndex: Int = -1
    @State var isFlipped: Bool = false
    @State var isTouched: Bool = false
    @State var redButtonIsTouched: Bool = false
    @State private var isPressed = false
    @State var manager: FlashcardManager = FlashcardManager()
    @Environment(\.presentationMode) private var presentationMode
    @Binding var deck: Deck
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
                    NavigationLink(destination: FlashcardEditView(manager: $manager, deck: $deck)){
                        Text("Edit")
                    }
                    
                }.onAppear(){
                    manager.addDeck(deck: deck)
                    print("Added deck")
                }
                
                
                ZStack(alignment: .center){
                    GeometryReader{ geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .fill(Color(red: 184 / 255, green: 204 / 255, blue: 255 / 255))
                            .frame(width: geometry.size.width)
                            
                                       
                        
                        if let flashcard = manager.front{
                            switch(flashcard.type){
                            case .definition,.normal:
                                if(!isFlipped){
                                    Text(flashcard.front)
                                        .font(.system(size: deck.fontSize))
                                        .padding(10)
                                        .frame(maxWidth: .infinity, maxHeight: 500, alignment: .top)
                                    
                                } else {
                                    Text(flashcard.back)
                                        .font(.system(size: deck.fontSize))
                                        .padding(10)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                                        .multilineTextAlignment(.center)
                                }
                            case .list:
                                ListCardView(currentIndex: currentIndex, flashcard: flashcard, fontSize: deck.fontSize)
                            
                            }
                        } else {
                            VStack{
                                Text("Your done!!! YAY :D")
                                    .font(.largeTitle)
                                    .padding(10)
                                    .frame(maxWidth: .infinity, maxHeight: 500, alignment: .top)
                                Text("Don't press the buttons (the app will crash)")
                            }
                                
                        }
                        
                        
                    }
                    
                }
                .frame(height: 500)
                .onTapGesture {
                    withAnimation(){
                        isFlipped.toggle()
                    }
                    if let flashcard = manager.front{
                        if(flashcard.type == .list){
                            currentIndex += 1
                                
                            if(currentIndex == flashcard.listItems.count){
                                currentIndex = -1
                                print("Reset index")
                            }
                        }
                    }
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
                                        currentIndex = -1
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
                                        manager.moveToBack()
                                        redButtonIsTouched = false
                                        isFlipped = false
                                        currentIndex = -1
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
        FlashcardView(deck: .constant(Deck.sampleDeck2))
    }
}

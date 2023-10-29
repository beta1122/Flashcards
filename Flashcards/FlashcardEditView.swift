//
//  FlashcardEditView.swift
//  Flashcards
//
//  Created by Bell Chen on 10/24/23.
//

import SwiftUI

struct FlashcardEditView: View {
    @Binding var manager: FlashcardManager
    @Binding var deck: Deck
    @State var textbox: String = ""
    @State var textbox1: String = ""
    @State var textbox2: String = ""
    @State var shuffle = true
    @State var buttonValue: ButtonValue = .definition
    @State var listItems: [String] = []
    enum ButtonValue: String{
        case definition = "Definition"
        case normal = "Normal"
        case list =  "List"
    }
    var body: some View {
        NavigationStack{
            Form{
                Section("Options"){
                    Button("Shuffle deck"){
                        manager.shufflecards()
                    }
                    VStack(alignment: .leading){
                        Text("Font size: \(Int(round(deck.fontSize)))")
                        Slider(value: $deck.fontSize, in: 5.0...40.0, step: 1)
                        Text("This is what \(Int(round(deck.fontSize))) size looks like").font(.system(size: deck.fontSize))
                    }
                }
                Section("Add flashcards"){
                    Picker("selector", selection: $buttonValue){
                        Text("Definition").tag(ButtonValue.definition)
                        Text("Normal").tag(ButtonValue.normal)
                        Text("Chain").tag(ButtonValue.list)
                    }.pickerStyle(.segmented)
                    
                    switch(buttonValue){
                    case .definition:
                        TextField("Term",text: $textbox1)
                        TextField("Definition",text: $textbox2)
                        Button("Add"){
                            withAnimation{
                                deck.flashcards.append(Flashcard(front: textbox1, back: textbox2))
                            }
                            textbox1 = ""
                            textbox2 = ""
                        }.disabled(textbox1.isEmpty||textbox2.isEmpty)
                    case .normal:
                        TextField("Front",text: $textbox1)
                        TextField("Back",text: $textbox2)
                        Button("Add"){
                            withAnimation{
                                deck.flashcards.append(Flashcard(front: textbox1, back: textbox2, type: .normal))
                            }
                            textbox1 = ""
                            textbox2 = ""
                        }.disabled(textbox1.isEmpty||textbox2.isEmpty)
                    case .list:
                        TextField("Prompt", text: $textbox1)
                        ForEach(listItems, id:\.self){ item in
                            Text("\(item)")
                        }.onDelete(){ indices in
                            listItems.remove(atOffsets: indices)
                        }
                        HStack{
                            TextField("List item \(listItems.count+1)", text: $textbox2)
                            Button("Add"){
                                withAnimation{
                                    listItems.append(textbox2)
                                }
                                textbox2 = ""
                            }.disabled(textbox2.isEmpty)
                        }
                        Button("Add"){
                            withAnimation{
                                if(!textbox2.isEmpty){
                                    listItems.append(textbox2)
                                }
                                deck.flashcards.append(Flashcard(prompt: textbox1, listItems: listItems))
                                listItems = []
                            }
                            textbox1 = ""
                            textbox2 = ""
                        }.disabled(textbox1.isEmpty||listItems.isEmpty)
                    }
                    
                }
                
                Section("Flashcards"){
                    ForEach($deck.flashcards){ $flashcard in
                        NavigationLink(destination: CardEditView(flashcard: $flashcard)){
                            HStack{
                                
                                if(flashcard.type == .list){
                                    VStack{
                                        Text("Prompt")
                                        Text(flashcard.prompt)
                                    }
                                    Spacer()
                                    VStack{
                                        Text("Items")
                                        ForEach(flashcard.listItems, id:\.self){ item in
                                            Text("\(item)")
                                        }
                                    }
                                }else {
                                    VStack(alignment:.leading){
                                        if(flashcard.type == .definition){
                                            Text("Term")
                                            Text(flashcard.front).font(.callout)
                                        } else {
                                            Text("Front")
                                            Text(flashcard.front).font(.callout)
                                        }
                                        Spacer()
                                    }.padding(.top)
                                    Spacer()
                                    VStack(alignment: .trailing){
                                        if(flashcard.type == .definition){
                                            Text("Definition")
                                            Text(flashcard.back).font(.callout)
                                        } else {
                                            Text("Back")
                                            Text(flashcard.back).font(.callout)
                                        }
                                        Spacer()
                                    }.padding(.top)
                                }
                            }
                        }
                    }
                }
                
                
            }
            
        }
    }
}
struct FlashcardEditView_Previews: PreviewProvider {
    static var previews: some View {
        FlashcardEditView(manager: .constant(FlashcardManager()), deck: .constant(Deck.sampleDeck))
    }
}

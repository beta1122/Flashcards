//
//  EditCardView.swift
//  Flashcards
//
//  Created by Bell Chen on 10/17/23.
//

import SwiftUI

struct NewDeckView: View {
    @Binding var collection: Collection
    @State var flashcards: [Flashcard] = []
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
        Form{
            Section("Deck config"){
                TextField("Enter name here", text: $textbox)
                Toggle("Shuffle after use", isOn: $shuffle)
                
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
                            flashcards.append(Flashcard(front: textbox1, back: textbox2))
                        }
                        textbox1 = ""
                        textbox2 = ""
                    }.disabled(textbox1.isEmpty||textbox2.isEmpty)
                case .normal:
                    TextField("Front",text: $textbox1)
                    TextField("Back",text: $textbox2)
                    Button("Add"){
                        withAnimation{
                            flashcards.append(Flashcard(front: textbox1, back: textbox2, type: .normal))
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
                            flashcards.append(Flashcard(prompt: textbox1, listItems: listItems))
                            listItems = []
                        }
                        textbox1 = ""
                        textbox2 = ""
                    }.disabled(textbox1.isEmpty||listItems.isEmpty)
                }
                
            }
            
            Section("Flashcards"){
                ForEach(flashcards){ flashcard in
                    HStack{
                        if(flashcard.type == .list){
                            VStack{
                                Text("Prompt")
                                Text(flashcard.prompt).font(.callout)
                            }
                            Spacer()
                            VStack{
                                Text("Items")
                                ForEach(flashcard.listItems, id:\.self){ item in
                                    Text("\(item)").font(.callout)
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
                }.onDelete{ indices in
                    deleteFlashcard(at: indices)
                }
            }
            
            
        }
        
    }
    private func deleteFlashcard(at indices: IndexSet) -> Void{
        flashcards.remove(atOffsets: indices)
    }
    
}

struct EditCardView_Previews: PreviewProvider {
    static var previews: some View {
        NewDeckView(collection: .constant(Collection.sampleCollection), flashcards: Flashcard.sampleArray)
    }
}

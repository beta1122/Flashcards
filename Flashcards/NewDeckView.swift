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
    enum ButtonValue: String{
        case definition = "Definition"
        case normal = "Normal"
        case list =  "Chain"
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
                    Button("add"){
                        withAnimation{
                            flashcards.append(Flashcard(front: textbox1, back: textbox2))
                        }
                    }
                case .normal:
                    TextField("Front",text: $textbox1)
                    TextField("Back",text: $textbox2)
                    Button("add"){
                        withAnimation{
                            flashcards.append(Flashcard(front: textbox1, back: textbox2, type: .normal))
                        }
                        textbox1 = ""
                        textbox2 = ""
                    }
                case .list:
                    Text("3")
                }
                
            }
            
            Section("Flashcards"){
                ForEach(flashcards){ flashcard in
                    HStack{
                        VStack(alignment:.leading){
                            if(flashcard.type == .definition){
                                Text("Term")
                                Text(flashcard.front)
                            } else {
                                Text("Front")
                                Text(flashcard.front)
                            }
                            Spacer()
                        }.padding(.top)
                        Spacer()
                        VStack(alignment: .trailing){
                            if(flashcard.type == .definition){
                                Text("Definition")
                                Text(flashcard.back)
                            } else {
                                Text("Back")
                                Text(flashcard.back)
                            }
                            Spacer()
                        }.padding(.top)
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

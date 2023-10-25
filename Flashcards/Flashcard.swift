//
//  Flashcard.swift
//  Flashcards
//
//  Created by Bell Chen on 10/16/23.
//

import Foundation

struct Flashcard: Identifiable, Codable{
    let id: UUID
    let front: String
    let back: String
    let type: FlashcardType
    
    
    
    
    enum FlashcardType: Codable{
        case definition
        case normal
        case list
    }
    init(id: UUID = UUID(), front: String, back: String, type: FlashcardType = .definition) {
        self.id = id
        self.front = front
        self.back = back
        self.type = type
    }
    
}
//definition flashcards can appear both as front and back
//
extension Flashcard{
    static let sampleArray: [Flashcard] = [
        Flashcard(front: "1+1111111111111111111111jas;jf71403978012734217047817401747180374817242074801\n\n7482704780173487109478127034;klsafkldjsal;dfjsajd;fkjsjfds;kjafj;kakjdfkjkasl;fjksaldfjksa;kdjfasjd;lfjakfjd;sjkalf1111111", back: "2", type: .definition),
        Flashcard(front: "2+2", back: "4", type: .definition),
        Flashcard(front: "5+7", back: "12", type: .definition),
        Flashcard(front: "9+1", back: "10", type: .definition)
    ]
    static let chapter3: [Flashcard] = [
        Flashcard(front: "Exocytosis", back: "The process of letting out NT"),
        Flashcard(front: "2 NT receptor types", back: "Ionotropic: changes shape to let ions in, Metabotropic: send secondary messengers", type: .normal),
        Flashcard(front: "Endogenous", back: "Substance that arise from inside body"),
        Flashcard(front: "Exogenous", back: "Substance that arise from outside body"),
        Flashcard(front: "This guy did a frog experiment to prove that soup", back: "Otto Loewi"),
        Flashcard(front: "Classic definition of NT", back: "1. Released when action potential happens\n2. Synthesized in terminals \n3.Recognized by receptors\n4. Causes change in post cell\n5. If you block release, the effects on post cell don't happen", type: .list),
        Flashcard(front: "Amino acid NT", back: "A NT with since amino acid molecule base"),
        Flashcard(front: "Most common receptor subtype", back: "ionotropic AMPA",type: .normal),
        Flashcard(front: "Ionotropic AMPA", back: "Glutamate receptor that produces excitatory effects"),
        Flashcard(front: "NMPA receptors", back: "Glutamate receptor with central role in memory formation"),
        Flashcard(front: "Drugs in family of benzodiazepines activate this receptor", back: "What family of drugs activate GABA-A receptors?"),
        Flashcard(front: "Gaba-a is ___otropic, Gaba-b is ___otropic", back: "Gaba-a is ionotropic, Gaba-b is metabotropic", type: .normal),
        Flashcard(front: "Many cholingeric cells are found here", back: "What NT is common in basal forebrain"),
        Flashcard(front: "Where do Ach in the brain project to?", back: "What NT travels to the cerebral cortex, amygdala, and hippocampus?"),
        Flashcard(front: "What is the main dopamine pathway called?", back: "What NT does the Mesostraital pathway project?"),
        Flashcard(front: "Where does the Mesostraital pathway originate and project to", back: "This originates in substantia nigra and projects to basal ganglia"),
        Flashcard(front: "Where does the mesolimbocortical pathway originate and project to?", back: "What pathway originates in the Ventral Tegmental Area and projects to the cortex and limbic system?"),
        Flashcard(front: "Where do serotonergic neurons originate?", back: "What NT originates in the raphe nuclei?"),
        Flashcard(front: "Another name for serotonin", back: "Another name for 5-HT"),
        Flashcard(front: "Where do noradrenergic neurons originate and project to?", back: "What NT originates in the locus coeruleus and Lateral Tegmental Area and projects to the cerebellum?"),
        Flashcard(front: "A malfunction in GABA can cause:", back: "Insomnia and tremors can be caused by a malfunction in:"),
        Flashcard(front: "A malfunction in dopamine can cause:", back: "Schizophrenia and Parkinsons can be caused by a malfunction in:"),
        Flashcard(front: "A malfunction in opioid peptides can cause", back: "Unusual breathing and heart rate can be caused by a malfunction in:"),
        Flashcard(front: "Bioavailable", back: "How much of a drug in body that is ready to interact"),
        Flashcard(front: "Biotransformation", back: "The process of chemical change of a substance in the body"),
        Flashcard(front: "Pharmacokinetics", back: "The movement of drugs into, through, and out of the body"),
        Flashcard(front: "3x things that affect drug effects", back: "Affinity, efficacy, dosage", type:.normal),
        Flashcard(front: "Affinity", back: "bias of drugs to certain receptors"),
        Flashcard(front: "Efficacy", back: "Amount of activation of receptor in response to drug"),
        Flashcard(front: "Metabolic tolerance", back: "The tolerance that happens when the body becomes more effective at removing a drug from the bloodstream"),
        Flashcard(front: "Functional tolerance", back: "The tolerance that happens when the receptors become up or down regulated"),
        Flashcard(front: "Cross-tolerance", back: "Generalization of tolerance to same chemical class"),
        Flashcard(front: "Conditioned tolerance", back: "Adaptation to the environment in which a drug is administered"),
        Flashcard(front: "3x presynaptic drug effects", back: "1. effect on transmitter production\n2. Effect on transmitter release\n3. Effect on transmitter clearance ", type: .list),
        Flashcard(front: "3x ways a drug can affect NT production", back: "1. Inhibit enzymes responsible for synthesis of the NT\n2. Block materials from reaching the terminals\n3. Stop the storage of the NT", type: .list),
        Flashcard(front: "Caffeine does this to make you feel awake", back: "This drug blocks adenosine receptors, which tells the neuron it has released enough dopamine."),
        Flashcard(front: "Neuromodulator", back: "A NT coreleased with another NT to tell the cell not to release too much of it"),
        Flashcard(front: "Autoreceptor", back: "A receptor that monitors the amount of NT released by the same cell"),
        Flashcard(front: "3x ways a drug can affect NT release", back: "1. Block sodium channels, thereby blocking action potential\n2. Block Ca channels, thereby blocking release\n3. Mess with autoreceptors", type: .list),
        Flashcard(front: "2x ways a drug can affect NT clearance", back: "1. Inhibit reuptake\n 2. Block enzymes that degrade", type: .list),
        Flashcard(front: "Another word for first generation antipsychotics", back: "Another word for neuroleptics"),
        Flashcard(front: "Second generation antipsychotics are better than 1st at ___ but worse at _____", back: "2nd gen are better at treating negative symptoms but aren't as effective for general use", type: .normal),
        Flashcard(front: "1st generation antidepressants are also called", back: "Monoamine oxidase inhibitors are also called"),
        Flashcard(front: "Monoamine oxidase break these NT down", back: "The enzymes that break dopamine and serotonin and norepinephrine"),
        Flashcard(front: "2nd gen antidepressants", back: "Tricyclic antidepressants are also called"),
        Flashcard(front: "Two examples of SSRI", back: "Fluxetine (Prozac) and Citalopram (Celexa) are examples of"),
        Flashcard(front: "SNRI example and function", back: "Venlafaxine (Effexor), can be used to treat anxiety and depression, is an example of"),
        Flashcard(front: "These drugs combat anxiety", back: "Anxiolytics"),
        Flashcard(front: "These drugs replaced barbituate drugs because they were safer and more specific", back: "There drugs were used before benzodiazepines, but were replaced because ___  and  ___"),
        Flashcard(front: "Major active substance in opium", back: "Morphine is the major active substance in this drug"),
        Flashcard(front: "Another word for painkiller", back: "Analgesic"),
        Flashcard(front: "These two drugs are forms of morphine", back: "heroin, fentanyl", type: .normal),
        Flashcard(front: "Three families of endogenous opioids", back: "Enkephalins, endorphins, dynorphins are three families of:"),
        Flashcard(front:"This receptor is found in substantia nigra, hippocampus, cerebral cortex", back:"Cannabinoid receptors are found in "),
        Flashcard(front:"Anandamide is a ____ that causes ___", back:"cannabinoid ligand that causes mood improvement, pain relief, lowered blood pressure"),
        Flashcard(front:"4x stimulants", back:"Nicotine, caffeine, amphetamine, cocaine", type: .normal),
        Flashcard(front:"Nicotine effects", back:"This drug increases heart rate, blood pressure, alertness"),
        Flashcard(front:"Dual dependence", back:"When the interaction of two drugs creates addiction for both of them at the same time"),
        Flashcard(front:"Khat", back:"An African shrub that releases cathinones when chewed"),
        Flashcard(front:"Cathinones", back:"Amphetamine-like stimulant", type: .normal),
        Flashcard(front:"2 things amphetamine does", back:"This drug causes axon terminal to release more and interferes with clearance"),
        Flashcard(front:"Short term and long term effects of amphetamine", back:"This drug creates more stamina and decreased appetite in the short term and brain damage, sleeplessness, weight loss, and schizophrenic symptoms in the long term"),
        Flashcard(front:"Cocaine was used as ___ and  ___ before recreational use", back:"this drug had earlier uses as an anesthetic and an antidepressant"),
        Flashcard(front:"LSD structually resembles", back:"this drug structually resembles serotonin"),
        Flashcard(front:"Ketamine blocks these receptors", back:"NMDA receptors are blocked by this drug"),
        Flashcard(front:"LSD can be used to treat ___, ___, and ___", back:"depression, anxiety, and OCD can be treated by"),
        Flashcard(front:"Hallucinogens can act on a variety of receptors, but one thing they all have in common is", back:"They all act on serotonin", type:.normal),
        Flashcard(front:"3x main types of catacolamines", back:"Dopamine, norepinephrine and epinephrine are all examples of"),
        Flashcard(front:"Chronic alcohol use is associoted with pathological changes in:", back:"White matter pathways, cortical atrophy, and damage of diencephalon and cerebullum. Damage here is associated with the following symptoms: cognitive decline, memory impairment, and movement disorders", type: .list),
        Flashcard(front:"Although it was previously assumed that you can have a few drinks during pregnancy, this can cause (x4)", back:"Lower birth weight, changes in craniofacial development, cognitive function effects, behavioral problems", type:.normal),
        Flashcard(front:"Psilocybin disinhibits this", back:"Emotion processing portions of the limbic system are disinhibited by this drug"),
        Flashcard(front:"3x drugs that affect gaba", back:"alcohol, barbituates, and benzodiazephines all affect this neurotransmitter"),
        Flashcard(front:"Endocannabinoid special facts (x3)", back:"They are produced on demand, go from post cell to pre cell, and are lipid based", type: .normal),
        Flashcard(front:"Anhedonia", back:"A general loss of pleasure"),
        Flashcard(front:"Insula", back:"This brain part plays a large role in addiction, pleasure, and craving"),
        Flashcard(front:"Insula damage might cause", back:"Damage to this brain part might relieve addiction"),
        Flashcard(front:"The disease and physical dependence model struggle to explain", back:"these models struggle to explain how addiction starts"),
        Flashcard(front:"Nucleus accumbens (in the context of drugs)", back:"Most drugs release dopamine here, it is the motivation and reward system"),
        Flashcard(front:"Damage to ___ and ___ would lead to dysfunction in the experience of reward", back:"Nucleus accumbens, VTA damage would lead to"),
        Flashcard(front:"Damage to the ____ would lead to movement disorder", back:"Substantia nigra damage would lead to"),
        
    
    
    ]
    static let chapter7: [Flashcard] = [
        Flashcard(front:"What muscle controls the lens?", back:"What does the ciliary muscle control?"),
        Flashcard(front:"What is the process of lens change called?", back:"Accomodation"),
        Flashcard(front:"List the layers of cells in the retina", back:"Photoreceptors, horizontal, bipolar, amacrine, ganglion", type: .list),
        Flashcard(front:"Scotopic system", back:"Rod based system"),
        Flashcard(front:"Phototopic system", back:"Cone based system"),
        Flashcard(front:"Rhodopsin", back:"Photopigment for rods"),
        Flashcard(front:"Cornea", back:"This part focuses eye"),
        Flashcard(front:"Iris", back:"Restricts amount of light entering eye"),
        Flashcard(front:"Myopia", back:"Nearsightedness"),
        Flashcard(front:"_____ are the cells that capture photons of light, which have molecules called _____, which perform _____", back:"Photoreceptors, photopigments, phototransduction"),
        Flashcard(front:"Optic nerve is formed by ___ cells", back:"Ganglion cells form this"),
        Flashcard(front:"When you take a picture of your eyes, there is a dark spot in the ", back:"Fovea", type:.normal),
        Flashcard(front:"There are 4 million ____ and 100 million ___ in the eye", back:"There are _____ cones, and ____ rods in the eye"),
        Flashcard(front: "Straite cortex", back: "another word for primary visual cortex"),
        Flashcard(front: "Scotoma", back: "Medical term for blind spot"),
        Flashcard(front: "Blindsight", back: "term for being unable to conciously perceive but can guess if stimulus is present"),
        Flashcard(front: "On center bipolar cells are ___ by glutamate", back: "__ center bipolar cells are inhibited by glutamate"),
        Flashcard(front: "____ can be effective for the LGN but ____ is more effective for V1", back: "Spots of light can be effective for ____ but prolonged stimuli is more effective for ___"),
        Flashcard(front: "Simple cortical cells", back: "These cells prefer bar or edge, some prefer certain direction"),
        Flashcard(front: "Complex cortical cells", back: "These cells prefer movement, some prefer a certain direction"),
        Flashcard(front: "Hubel and Weisel's model of visual analysis", back: "These two proposed hierarchial system"),
        Flashcard(front: "Spatial frequency model", back: "We detect changes in color", type: .normal),
        Flashcard(front: "Evidence against hierarchial system", back: "When parts of a face were presented, the face neuron didn't fire", type: .normal),
        Flashcard(front: "The spatial frequency model is more", back: ""),
        Flashcard(front: "If you go from a bright area to dim room", back: "Photopigments in rods break down and can take 15 minutes to respond when"),
        Flashcard(front: "If you go from dim room to bright area", back: "All photopigments briefly break down and cones recover quickly when"),
        Flashcard(front: "Bipolar cells and photoreceptors send ", back: "____ and ____ send graded signals (not myelinated)"),
        Flashcard(front: "At the optic chiasm, the axons from ___ cross over, while the axons from ___ stay on the same side", back: "At the optic chaism, the axons from the nasal retina ____, while the axons from the temportal retina ____"),
        Flashcard(front: "After the optic chiasm, the optic nerve becomes the ____", back: "Before the optic chiasm, the optic tract was the ____ "),
        Flashcard(front: "Optic radiations go to ", back: "Primary visual cortex receives signals from"),
        Flashcard(front: "", back: ""),
    
    ]
}


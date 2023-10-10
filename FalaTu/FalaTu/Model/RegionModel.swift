//
//  RegionModel.swift
//  FalaTu
//
//  Created by Leonardo Mota on 26/09/23.
//

struct RegionModel {
    var regionName: String
    var numOfStates: Int
    var numOfStatesUnlocked: Int
    var numOfItensInRegion: Int
    var states: [StateModel]
}


// Função para criar estado
func createState(name: String, numberOfItemsUnlocked: Int = 0, wordsWithHints: [String: (String, String)]) -> StateModel {
    return StateModel(stateName: name, numberOfItemsUnlocked: numberOfItemsUnlocked, words: wordsWithHints)
}

// Função para criar região
func createRegion(regionName: String, statesData: [(String, Int, [String: (String, String)])]) -> RegionModel {
    let states = statesData.map { createState(name: $0.0, numberOfItemsUnlocked: $0.1, wordsWithHints: $0.2) }
    let numOfStates = states.count
    let numOfStatesUnlocked = states.filter { $0.numberOfItemsUnlocked > 0 }.count
    let numOfItemsInRegion = states.reduce(0) { $0 + $1.numberOfItemsUnlocked }
    
    return RegionModel(regionName: regionName, numOfStates: numOfStates, numOfStatesUnlocked: numOfStatesUnlocked, numOfItensInRegion: numOfItemsInRegion, states: states)
}

// Devolve uma palavra aleatória com exatamente 5 caracteres, sua dica, significado E O ESTADO QUE ELA PERTENCE
func getRandom_Word_Hint_Meaning() -> (word: String, hint: String, meaning: String, region: RegionModel)? {
    guard let randomRegion = regions_BR.randomElement(),
        let randomState = randomRegion.states.randomElement() else {
            return nil
    }

    if let (word, (hint, meaning)) = randomState.words.randomElement(), word.count == 5 {
        return (word, hint, meaning, randomRegion)
    } else {
        return getRandom_Word_Hint_Meaning()
    }
}


// Incrementando pontuação para um estado aleatório na região de palavra acertada
func incrementRandomStateItemsUnlocked(in region: inout RegionModel) {
    guard let randomStateIndex = region.states.indices.randomElement() else {
        return
    }
    
    region.states[randomStateIndex].numberOfItemsUnlocked += 1
}



// Criando instâncias de RegionModel para cada região com palavras associadas a cada estado
let regions_BR: [RegionModel] = [
    // NORTE
    createRegion(regionName: "Norte", statesData: [
        ("Amazonas", 1,
         ["brabo": ("legal", "é utilizada para descrever algo ou alguém que é muito bom, habilidoso ou impressionante. Ela sugere um alto nível de excelência ou destaque em alguma área específica."),
          "testeAM2": ("dicaAM2", "significadoAM2")]),
        
        ("Pará", 0,
         ["testePA1": ("dicaPA1", "significadoPA1"),
          "testePA2": ("dicaPA2", "significadoPA2")]),
        
        ("Roraima", 0,
         ["testeRR1": ("dicaRR1", "significadoRR1"),
          "testeRR2": ("dicaRR2", "significadoRR2")]),
        
        ("Amapá", 0,
         ["testeAP1": ("dicaAP1", "significadoAP1"),
          "testeAP2": ("dicaAP2", "significadoAP2")]),
        
        ("Acre", 0,
         ["testeAC1": ("dicaAC1", "significadoAC1"),
          "testeAC2": ("dicaAC2", "significadoAC2")]),
        
        ("Tocantins", 0,
         ["testeTO1": ("dicaTO1", "significadoTO1"),
          "testeTO2": ("dicaTO2", "significadoTO2")]),
        
        ("Rondônia", 0,
         ["testeRO1": ("dicaRO1", "significadoRO1"),
          "testeRO2": ("dicaRO2", "significadoRO2")])
    ]),
    
    // NORDESTE
    createRegion(regionName: "Nordeste", statesData: [
        ("Maranhão", 0,
         ["testeMA1": ("dicaMA1", "significadoMA1"),
          "testeMA2": ("dicaMA2", "significadoMA2")]),
        
        ("Piauí", 0,
         ["testePI1": ("dicaPI1", "significadoPI1"),
          "testePI2": ("dicaPI2", "significadoPI2")]),
        
        ("Ceará", 0,
         ["testeCE1": ("dicaCE1", "significadoCE1"),
          "testeCE2": ("dicaCE2", "significadoCE2")]),
        
        ("Rio Grande do Norte", 0,
         ["testeRN1": ("dicaRN1", "significadoRN1"),
          "testeRN2": ("dicaRN2", "significadoRN2")]),
        
        ("Paraíba", 0,
         ["testePB1": ("dicaPB1", "significadoPB1"),
          "testePB2": ("dicaPB2", "significadoPB2")]),
        
        ("Pernambuco", 0,
         ["testePE1": ("dicaPE1", "significadoPE1"),
          "testePE2": ("dicaPE2", "significadoPE2")]),
        
        ("Alagoas", 0,
         ["testeAL1": ("dicaAL1", "significadoAL1"),
          "testeAL2": ("dicaAL2", "significadoAL2")]),
        
        ("Sergipe", 0,
         ["testeSE1": ("dicaSE1", "significadoSE1"),
          "testeSE2": ("dicaSE2", "significadoSE2")]),
        
        ("Bahia", 0,
         ["testeBA1": ("dicaBA1", "significadoBA1"),
          "testeBA2": ("dicaBA2", "significadoBA2")])
    ]),
    
    // SUDESTE
    createRegion(regionName: "Sudeste", statesData: [
        ("Minas Gerais", 0,
         ["testeMG1": ("dicaMG1", "significadoMG1"),
          "testeMG2": ("dicaMG2", "significadoMG2")]),
        
        ("Espírito Santo", 0,
         ["testeES1": ("dicaES1", "significadoES1"),
          "testeES2": ("dicaES2", "significadoES2")]),
        
        ("Rio de Janeiro", 0,
         ["testeRJ1": ("dicaRJ1", "significadoRJ1"),
          "testeRJ2": ("dicaRJ2", "significadoRJ2")]),
        
        ("São Paulo", 0,
         ["testeSP1": ("dicaSP1", "significadoSP1"),
          "testeSP2": ("dicaSP2", "significadoSP2")])
    ]),
    
    // SUL
    createRegion(regionName: "Sul", statesData: [
        ("Paraná", 0,
         ["testePR1": ("dicaPR1", "significadoPR1"),
          "testePR2": ("dicaPR2", "significadoPR2")]),
        
        ("Santa Catarina", 0,
         ["testeSC1": ("dicaSC1", "significadoSC1"),
          "testeSC2": ("dicaSC2", "significadoSC2")]),
        
        ("Rio Grande do Sul", 0,
         ["testeRS1": ("dicaRS1", "significadoRS1"),
          "testeRS2": ("dicaRS2", "significadoRS2")])
    ]),
    
    // CENTRO-OESTE
    createRegion(regionName: "Centro-Oeste", statesData: [
        ("Goiás", 0,
         ["testeGO1": ("dicaGO1", "significadoGO1"),
          "testeGO2": ("dicaGO2", "significadoGO2")]),
        
        ("Mato Grosso", 0,
         ["testeMT1": ("dicaMT1", "significadoMT1"),
          "testeMT2": ("dicaMT2", "significadoMT2")]),
        
        ("Mato Grosso do Sul", 0,
         ["testeMS1": ("dicaMS1", "significadoMS1"),
          "testeMS2": ("dicaMS2", "significadoMS2")]),
        
        ("Distrito Federal", 0,
         ["testeDF1": ("dicaDF1", "significadoDF1"),
          "testeDF2": ("dicaDF2", "significadoDF2")])
    ])
]


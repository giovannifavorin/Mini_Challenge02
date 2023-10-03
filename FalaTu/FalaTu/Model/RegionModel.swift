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
    var states: [StateModel]
}

func createState(name: String, numberOfItemsUnlocked: Int, wordsWithHints: [String: String]) -> StateModel {
    return StateModel(stateName: name, numberOfItemsUnlocked: numberOfItemsUnlocked, words: wordsWithHints)
}

func createRegion(regionName: String, statesData: [(String, Int, [String: String])]) -> RegionModel {
    let states = statesData.map { createState(name: $0.0, numberOfItemsUnlocked: $0.1, wordsWithHints: $0.2) }
    let numOfStates = states.count
    let numOfStatesUnlocked = states.filter { $0.numberOfItemsUnlocked > 0 }.count // Estados desbloqueados = têm pelo menos um item desbloqueado
    return RegionModel(regionName: regionName, numOfStates: numOfStates, numOfStatesUnlocked: numOfStatesUnlocked, states: states)
}

// Devolve uma palavra aleatória com exatamente 5 caracteres e sua dica
func getRandomWordAndHint() -> (word: String, hint: String)? {
    guard let randomRegion = regions_BR.randomElement(),
          let randomState = randomRegion.states.randomElement() else {
        return nil
    }
    
    // Filtra palavras com 5 caracteres e pega um elemento aleatório
    if let (word, hint) = randomState.words.filter({ $0.key.count == 5 }).randomElement() {
        return (word, hint)
    } else {
        // Se não encontrar uma palavra com 5 caracteres, chama recursivamente a função para tentar novamente
        return getRandomWordAndHint()
    }
}


// Criando instâncias de RegionModel para cada região com palavras associadas a cada estado
let regions_BR: [RegionModel] = [
    
    // NORTE
    createRegion(regionName: "Norte", statesData: [
        ("Amazonas", 3,
         ["teste": "dicaAM1",
          "testeAM2": "dicaAM2",
          "testeAM3": "dicaAM3"]),
        
        ("Pará", 3,
         ["testePA1": "dicaPA1",
          "testePA2": "dicaPA2",
          "testePA3": "dicaPA3"]),
        
        ("Roraima", 3,
         ["testeRR1": "dicaRR1",
          "testeRR2": "dicaRR2",
          "testeRR3": "dicaRR3"]),
        
        ("Amapá", 3,
         ["testeAP1": "dicaAP1",
          "testeAP2": "dicaAP2",
          "testeAP3": "dicaAP3"]),
        
        ("Acre", 3,
         ["testeAC1": "dicaAC1",
          "testeAC2": "dicaAC2",
          "testeAC3": "dicaAC3"]),
        
        ("Tocantins", 3,
         ["testeTO1": "dicaTO1",
          "testeTO2": "dicaTO2",
          "testeTO3": "dicaTO3"]),
        
        ("Rondônia", 3,
         ["testeRO1": "dicaRO1",
          "testeRO2": "dicaRO2",
          "testeRO3": "dicaRO3"])
    ]),
    
    // NORDESTE
    createRegion(regionName: "Nordeste", statesData: [
        ("Maranhão", 3,
         ["testeMA1": "dicaMA1",
          "testeMA2": "dicaMA2",
          "testeMA3": "dicaMA3"]),
        
        ("Piauí", 3,
         ["testePI1": "dicaPI1",
          "testePI2": "dicaPI2",
          "testePI3": "dicaPI3"]),
        
        ("Ceará", 3,
         ["testeCE1": "dicaCE1",
          "testeCE2": "dicaCE2",
          "testeCE3": "dicaCE3"]),
        
        ("Rio Grande do Norte", 3,
         ["testeRN1": "dicaRN1",
          "testeRN2": "dicaRN2",
          "testeRN3": "dicaRN3"]),
        
        ("Paraíba", 3,
         ["testePB1": "dicaPB1",
          "testePB2": "dicaPB2",
          "testePB3": "dicaPB3"]),
        
        ("Pernambuco", 3,
         ["testePE1": "dicaPE1",
          "testePE2": "dicaPE2",
          "testePE3": "dicaPE3"]),
        
        ("Alagoas", 3,
         ["testeAL1": "dicaAL1",
          "testeAL2": "dicaAL2",
          "testeAL3": "dicaAL3"]),
        
        ("Sergipe", 3,
         ["testeSE1": "dicaSE1",
          "testeSE2": "dicaSE2",
          "testeSE3": "dicaSE3"]),
        
        ("Bahia", 3,
         ["testeBA1": "dicaBA1",
          "testeBA2": "dicaBA2",
          "testeBA3": "dicaBA3"])
    ]),
    
    // CENTRO - OESTE
    createRegion(regionName: "Centro-Oeste", statesData: [
        ("Mato Grosso", 3,
         ["testeMT1": "dicaMT1",
          "testeMT2": "dicaMT2",
          "testeMT3": "dicaMT3"]),
        
        ("Mato Grosso do Sul", 3,
         ["testeMS1": "dicaMS1",
          "testeMS2": "dicaMS2",
          "testeMS3": "dicaMS3"]),
        
        ("Goiás", 3,
         ["testeGO1": "dicaGO1",
          "testeGO2": "dicaGO2",
          "testeGO3": "dicaGO3"]),
        
        ("Distrito Federal", 3,
         ["testeDF1": "dicaDF1",
          "testeDF2": "dicaDF2",
          "testeDF3": "dicaDF3"])
    ]),
    
    // SUDESTE
    createRegion(regionName: "Sudeste", statesData: [
        ("São Paulo", 3,
         ["testeSP1": "dicaSP1",
          "testeSP2": "dicaSP2",
          "testeSP3": "dicaSP3"]),
        
        ("Rio de Janeiro", 3,
         ["testeRJ1": "dicaRJ1",
          "testeRJ2": "dicaRJ2",
          "testeRJ3": "dicaRJ3"]),
        
        ("Espírito Santo", 3,
         ["testeES1": "dicaES1",
          "testeES2": "dicaES2",
          "testeES3": "dicaES3"]),
        
        ("Minas Gerais", 3,
         ["testeMG1": "dicaMG1",
          "testeMG2": "dicaMG2",
          "testeMG3": "dicaMG3"])
    ]),
    
    // SUL
    createRegion(regionName: "Sul", statesData: [
        ("Rio Grande do Sul", 3,
         ["testeRS1": "dicaRS1",
          "testeRS2": "dicaRS2",
          "testeRS3": "dicaRS3"]),
        
        ("Santa Catarina", 3,
         ["testeSC1": "dicaSC1",
          "testeSC2": "dicaSC2",
          "testeSC3": "dicaSC3"]),
        
        ("Paraná", 3,
         ["testePR1": "dicaPR1",
          "testePR2": "dicaPR2",
          "testePR3": "dicaPR3"])
    ])
]





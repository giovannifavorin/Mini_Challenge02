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

func createState(name: String, numberOfItemsUnlocked: Int, words: [String]) -> StateModel {
    return StateModel(stateName: name, numberOfItemsUnlocked: numberOfItemsUnlocked, words: words)
}

func createRegion(regionName: String, statesData: [(String, Int, [String])]) -> RegionModel {
    let states = statesData.map { createState(name: $0.0, numberOfItemsUnlocked: $0.1, words: $0.2) }
    let numOfStates = states.count
    let numOfStatesUnlocked = states.filter { $0.numberOfItemsUnlocked > 0 }.count // Estados desbloqueados = tem pelo menos UM item desbloqueado
    return RegionModel(regionName: regionName, numOfStates: numOfStates, numOfStatesUnlocked: numOfStatesUnlocked, states: states)
}

func getRandomWord() -> String? {
    guard let randomRegion = regions_BR.randomElement(),
          let randomState = randomRegion.states.randomElement(),
          let randomWord = randomState.words.randomElement() else {
        return nil
    }
    return randomWord
}

// Criando instâncias de RegionModel para cada região com palavras associadas a cada estado
let regions_BR: [RegionModel] = [
    createRegion(regionName: "Norte", statesData: [
        ("Amazonas", 3, ["testeAM1", "testeAM2", "testeAM3"]),
        ("Pará", 3, ["testePA1", "testePA2", "testePA3"]),
        ("Roraima", 3, ["testeRR1", "testeRR2", "testeRR3"]),
        ("Amapá", 3, ["testeAP1", "testeAP2", "testeAP3"]),
        ("Acre", 3, ["testeAC1", "testeAC2", "testeAC3"]),
        ("Tocantins", 3, ["testeTO1", "testeTO2", "testeTO3"]),
        ("Rondônia", 3, ["testeRO1", "testeRO2", "testeRO3"])
    ]),
    createRegion(regionName: "Nordeste", statesData: [
        ("Maranhão", 3, ["testeMA1", "testeMA2", "testeMA3"]),
        ("Piauí", 3, ["testePI1", "testePI2", "testePI3"]),
        ("Ceará", 3, ["testeCE1", "testeCE2", "testeCE3"]),
        ("Rio Grande do Norte", 3, ["testeRN1", "testeRN2", "testeRN3"]),
        ("Paraíba", 3, ["testePB1", "testePB2", "testePB3"]),
        ("Pernambuco", 3, ["testePE1", "testePE2", "testePE3"]),
        ("Alagoas", 3, ["testeAL1", "testeAL2", "testeAL3"]),
        ("Sergipe", 3, ["testeSE1", "testeSE2", "testeSE3"]),
        ("Bahia", 3, ["testeBA1", "testeBA2", "testeBA3"])
    ]),
    createRegion(regionName: "Centro-Oeste", statesData: [
        ("Mato Grosso", 3, ["testeMT1", "testeMT2", "testeMT3"]),
        ("Mato Grosso do Sul", 3, ["testeMS1", "testeMS2", "testeMS3"]),
        ("Goiás", 3, ["testeGO1", "testeGO2", "testeGO3"]),
        ("Distrito Federal", 3, ["testeDF1", "testeDF2", "testeDF3"])
    ]),
    createRegion(regionName: "Sudeste", statesData: [
        ("São Paulo", 3, ["testeSP1", "testeSP2", "testeSP3"]),
        ("Rio de Janeiro", 3, ["testeRJ1", "testeRJ2", "testeRJ3"]),
        ("Espírito Santo", 3, ["testeES1", "testeES2", "testeES3"]),
        ("Minas Gerais", 3, ["testeMG1", "testeMG2", "testeMG3"])
    ]),
    createRegion(regionName: "Sul", statesData: [
        ("Rio Grande do Sul", 3, ["testeRS1", "testeRS2", "testeRS3"]),
        ("Santa Catarina", 3, ["testeSC1", "testeSC2", "testeSC3"]),
        ("Paraná", 3, ["testePR1", "testePR2", "testePR3"])
    ])
]





//
//  RegionModel.swift
//  FalaTu
//
//  Created by Leonardo Mota on 26/09/23.
//

import Foundation

struct RegionModel {
    var regionName: String
    var numOfStates: Int
    var numOfStatesUnlocked: Int
    var numOfItensInRegion: Int
    var numOfWordsCorrectInRegion: Int
    var states: [StateModel]
}


// Função para criar estado
func createState(name: String, numberOfItemsUnlocked: Int = 0, wordsWithHints: [String: (String, String)]) -> StateModel {
    return StateModel(stateName: name, numberOfItemsUnlocked: numberOfItemsUnlocked, words: wordsWithHints)
}

// Função para criar região
func createRegion(regionName: String, statesData: [(String, Int, [String: (String, String)])]) -> RegionModel {
    let states = statesData.map { createState(name: $0.0, numberOfItemsUnlocked: $0.1, wordsWithHints: $0.2) }
    var numOfItemsInRegion = 0
    
    for state in states {
        let stateKey = "\(regionName)_\(state.stateName)_numOfItemsUnlocked"
        if let savedItemsUnlocked = UserDefaults.standard.value(forKey: stateKey) as? Int {
            numOfItemsInRegion += savedItemsUnlocked
        } else {
            numOfItemsInRegion += state.numberOfItemsUnlocked
        }
    }
    
    let numOfStates = states.count
    let numOfStatesUnlocked = states.filter { $0.numberOfItemsUnlocked > 0 }.count
    let numOfWordsCorrectInRegion = 0 // Inicializando com 0
    
    return RegionModel(regionName: regionName, numOfStates: numOfStates, numOfStatesUnlocked: numOfStatesUnlocked, numOfItensInRegion: numOfItemsInRegion, numOfWordsCorrectInRegion: numOfWordsCorrectInRegion, states: states)
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
    
    // Obtendo o estado aleatório
    var randomState = region.states[randomStateIndex]
    
    // Verificando se o número de itens do estado está armazenado em UserDefaults
    if let savedItemsUnlocked = UserDefaults.standard.value(forKey: "\(region.regionName)_\(randomState.stateName)_numOfItemsUnlocked") as? Int {
        randomState.numberOfItemsUnlocked = savedItemsUnlocked
    } else {
        // Se não estiver armazenado, inicializa como 0
        randomState.numberOfItemsUnlocked = 0
    }
    
    // Incrementando o número de itens do estado
    randomState.numberOfItemsUnlocked += 1
    
    // Salvando o novo valor em UserDefaults
    UserDefaults.standard.set(randomState.numberOfItemsUnlocked, forKey: "\(region.regionName)_\(randomState.stateName)_numOfItemsUnlocked")
    
    // Atualizando o estado na região
    region.states[randomStateIndex] = randomState
}


// Incrementando número de palavras corretas naquela região
func incrementWordsCorrectInRegion(in region: inout RegionModel) {
    if let savedWordsCorrect = UserDefaults.standard.value(forKey: "\(region.regionName)_numOfWordsCorrectInRegion") as? Int {
        region.numOfWordsCorrectInRegion = savedWordsCorrect
        region.numOfWordsCorrectInRegion += 1
        
        //if region.numOfWordsCorrectInRegion % 3 == 0 {
            incrementRandomStateItemsUnlocked(in: &region)
        //}
        
        // Atualizando o valor no UserDefaults
        UserDefaults.standard.set(region.numOfWordsCorrectInRegion, forKey: "\(region.regionName)_numOfWordsCorrectInRegion")
    } else {
        // Incrementa
        region.numOfWordsCorrectInRegion += 1
        // Guarda o valor
        UserDefaults.standard.set(region.numOfWordsCorrectInRegion, forKey: "\(region.regionName)_numOfWordsCorrectInRegion")
    }
}




// Criando instâncias de RegionModel para cada região com palavras associadas a cada estado
let regions_BR: [RegionModel] = [
    
    
    // NORTE
    createRegion(regionName: "Norte", statesData: [
        ("Amazonas", 0,
         ["brabo": ("legal", "é utilizada para descrever algo ou alguém que é muito bom, habilidoso ou impressionante. Ela sugere um alto nível de excelência ou destaque em alguma área específica.")]),
        
        ("Pará", 0,
         ["cunha": ("Moça", "Usado para designar mulheres e garotas."),
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
         ["fuzue": ("Confusão", "Se refere a uma agitação, tumulto ou confusão, geralmente de natureza festiva ou barulhenta. Pode ser associada a situações em que há muita animação, movimento e barulho, como em festas, eventos agitados ou celebrações. Em resumo, fuzuê descreve um ambiente de agitação e diversão, muitas vezes com música, dança e comemoração."),
          "testeRN2": ("dicaRN2", "significadoRN2")]),
        
        ("Paraíba", 0,
         ["avoar": ("Arremessar", "Usada para se referir a Arremessar algo ou a jogar algo fora."),
          "testePB2": ("dicaPB2", "significadoPB2")]),
        
        ("Pernambuco", 0,
         ["jegue": ("Burro", "Usada para designar alguém que é considerada incapaz ou desprovida de inteligência"),
          "testePE2": ("dicaPE2", "significadoPE2")]),
        
        ("Alagoas", 0,
         ["lomba": ("Engraçado", "Usado para dizer que algo é engraçado."),
          "testeAL2": ("dicaAL2", "significadoAL2")]),
        
        ("Sergipe", 0,
         ["testeSE1": ("dicaSE1", "significadoSE1"),
          "testeSE2": ("dicaSE2", "significadoSE2")]),
        
        ("Bahia", 0,
         ["testeBA1": ("dicaBA1", "significadoBA1"),
          "testeBA2": ("dicaBA2", "significadoBA2")])
    ]),
    
    // CENTRO-OESTE
    createRegion(regionName: "Centro-Oeste", statesData: [
        ("Goiás", 0,
         ["avesa": ("À toa", "É usada para designar alguém que é desocupado."),
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
         ["truta": ("Ei, mano!", "É usado para se referir a um amigo."),
          "muque": ("Força", "Músculo desenvolvido, resultante de exercícios físicos constantes, esp. o bíceps e o tríceps, que impulsionam ou sustentam a força dos membros superiores."),
          "migue": ("Mentira", "Usado quando quer dizer que alguém esta mentido.")
         ]),
        ("São Paulo", 0,
         ["moleza": ("Tranquilo", "Usada para se referir a algo que pode ser feito com facilidade."),
          "testeSP2": ("dicaSP2", "significadoSP2")])
    ]),
    
    // SUL
    createRegion(regionName: "Sul", statesData: [
        ("Paraná", 0,
         ["ximas": ("chá", "Uma abreviação da palavra chimarrão, chá da folha do mate."),
          "testePR2": ("dicaPR2", "significadoPR2")]),
        
        ("Santa Catarina", 0,
         ["testeSC1": ("dicaSC1", "significadoSC1"),
          "testeSC2": ("dicaSC2", "significadoSC2")]),
        
        ("Rio Grande do Sul", 0,
         ["guris": ("Os rapazes", "Usado para se referir a crianças, mais especificamente a garotos. Também usado na expressão é os Guris"),
          "olada": ("Ocasião", "Se refere a uma ocasião, oportunidade"),
          "boita": ("Grande", "Usado dar o sentido de intensidade"),
          "bomba": ("Tem na padaria", "Bomba é um doce, uma massa coberta de chocolate."),
          "chiar": ("Barulho", "Usado para falar de algo ou alguém que faz muito barulho."),
          "cusco": ("Vira-lata", "Usado para se referir a cachorros pequenos ou sem raça."),
         ])
    ]),

    createRegion(regionName: "Brasil", statesData: [
        ("Brasil", 0,
         ["manja": ("Entendeu?", "Significa \"entender\" ou \"saber\"."),
          "zicou": ("Azar", "Estar em apuros ou ter azar"),
          "bucha": ("Fraco", "Refere-se a alguém fraco que é facilmente derrubado, derrotado ou abatido."),
          "pilha": ("anima?", "Usado para dizer quando esta disposto ou animado com algo."),
          "ruela": ("Rua pequena.", "Usado para designar uma rua pequena ou espaço estreito.")
         ]),
    ]),
]


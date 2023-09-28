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

// REGIÃO NORTE ====================================================================================
var state1_AM = StateModel(stateName: "Amazonas", numberOfItemsUnlocked: 3)
var state2_PA = StateModel(stateName: "Pará", numberOfItemsUnlocked: 0)
var state3_RR = StateModel(stateName: "Roraima", numberOfItemsUnlocked: 0)
var state4_AP = StateModel(stateName: "Amapá", numberOfItemsUnlocked: 0)
var state5_AC = StateModel(stateName: "Acre", numberOfItemsUnlocked: 0)
var state6_TO = StateModel(stateName: "Tocantins", numberOfItemsUnlocked: 0)
var state7_RO = StateModel(stateName: "Rondônia", numberOfItemsUnlocked: 3)

// Array - estados da região NORTE
let states_Norte = [state1_AM, state2_PA, state3_RR, state4_AP, state5_AC, state6_TO, state7_RO]

// Número de estados desbloqueados = se já desbloqueou algum item do estado
let numOfStatesUnlocked_Norte = states_Norte.filter { $0.numberOfItemsUnlocked > 0 }.count

// Criando instância de RegionModel com os estados
let region_Norte = RegionModel(regionName: "Norte",
                               numOfStates: states_Norte.count,
                               numOfStatesUnlocked: numOfStatesUnlocked_Norte,
                               states: states_Norte)

// REGIÃO NORDESTE ====================================================================================
var state1_MA = StateModel(stateName: "Maranhão", numberOfItemsUnlocked: 0)
var state2_PI = StateModel(stateName: "Piauí", numberOfItemsUnlocked: 0)
var state3_CE = StateModel(stateName: "Ceará", numberOfItemsUnlocked: 0)
var state4_RN = StateModel(stateName: "Rio Grande do Norte", numberOfItemsUnlocked: 0)
var state5_PB = StateModel(stateName: "Paraíba", numberOfItemsUnlocked: 0)
var state6_PE = StateModel(stateName: "Pernambuco", numberOfItemsUnlocked: 0)
var state7_AL = StateModel(stateName: "Alagoas", numberOfItemsUnlocked: 0)
var state8_SE = StateModel(stateName: "Sergipe", numberOfItemsUnlocked: 0)
var state9_BA = StateModel(stateName: "Bahia", numberOfItemsUnlocked: 0)

// Array - estados da região NORDESTE
let states_Nordeste = [state1_MA, state2_PI, state3_CE, state4_RN, state5_PB, state6_PE, state7_AL, state8_SE, state9_BA]

// Número de estados desbloqueados = se já desbloqueou algum item do estado
let numOfStatesUnlocked_Nordeste = states_Nordeste.filter { $0.numberOfItemsUnlocked > 0 }.count

// Criando instância de RegionModel com os estados
let region_Nordeste = RegionModel(regionName: "Nordeste",
                                  numOfStates: states_Nordeste.count,
                                  numOfStatesUnlocked: numOfStatesUnlocked_Nordeste,
                                  states: states_Nordeste)

// REGIÃO CENTRO-OESTE ====================================================================================
var state1_MT = StateModel(stateName: "Mato Grosso", numberOfItemsUnlocked: 0)
var state2_MS = StateModel(stateName: "Mato Grosso do Sul", numberOfItemsUnlocked: 0)
var state3_GO = StateModel(stateName: "Goiás", numberOfItemsUnlocked: 0)
var state4_DF = StateModel(stateName: "Distrito Federal", numberOfItemsUnlocked: 0)

// Array - estados da região CENTRO-OESTE
let states_CentroOeste = [state1_MT, state2_MS, state3_GO, state4_DF]

// Número de estados desbloqueados = se já desbloqueou algum item do estado
let numOfStatesUnlocked_CentroOeste = states_CentroOeste.filter { $0.numberOfItemsUnlocked > 0 }.count

// Criando instância de RegionModel com os estados
let region_CentroOeste = RegionModel(regionName: "Centro-Oeste",
                                      numOfStates: states_CentroOeste.count,
                                      numOfStatesUnlocked: numOfStatesUnlocked_CentroOeste,
                                      states: states_CentroOeste)

// REGIÃO SUDESTE ====================================================================================
var state1_SP = StateModel(stateName: "São Paulo", numberOfItemsUnlocked: 0)
var state2_RJ = StateModel(stateName: "Rio de Janeiro", numberOfItemsUnlocked: 0)
var state3_ES = StateModel(stateName: "Espírito Santo", numberOfItemsUnlocked: 0)
var state4_MG = StateModel(stateName: "Minas Gerais", numberOfItemsUnlocked: 0)

// Array - estados da região SUDESTE
let states_Sudeste = [state1_SP, state2_RJ, state3_ES, state4_MG]

// Número de estados desbloqueados = se já desbloqueou algum item do estado
let numOfStatesUnlocked_Sudeste = states_Sudeste.filter { $0.numberOfItemsUnlocked > 0 }.count

// Criando instância de RegionModel com os estados
let region_Sudeste = RegionModel(regionName: "Sudeste",
                                  numOfStates: states_Sudeste.count,
                                  numOfStatesUnlocked: numOfStatesUnlocked_Sudeste,
                                  states: states_Sudeste)

// REGIÃO SUL ====================================================================================
var state1_RS = StateModel(stateName: "Rio Grande do Sul", numberOfItemsUnlocked: 0)
var state2_SC = StateModel(stateName: "Santa Catarina", numberOfItemsUnlocked: 0)
var state3_PR = StateModel(stateName: "Paraná", numberOfItemsUnlocked: 3)

// Array - estados da região SUL
let states_Sul = [state1_RS, state2_SC, state3_PR]

// Número de estados desbloqueados = se já desbloqueou algum item do estado
let numOfStatesUnlocked_Sul = states_Sul.filter { $0.numberOfItemsUnlocked > 0 }.count

// Criando instância de RegionModel com os estados
let region_Sul = RegionModel(regionName: "Sul",
                            numOfStates: states_Sul.count,
                            numOfStatesUnlocked: numOfStatesUnlocked_Sul,
                            states: states_Sul)

let regions_BR = [region_Norte,
                  region_Nordeste,
                  region_CentroOeste,
                  region_Sudeste,
                  region_Sul]

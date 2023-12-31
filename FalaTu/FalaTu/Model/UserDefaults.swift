//
//  UserDefaults.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 02/10/23.
//

import Foundation
import UIKit


//MARK: Adiciona novas funções a UserDefaults
extension UserDefaults{
    
    //MARK: Enum que define um case do tipo String
    private enum UserDefaultsKeys: String{
        case imageProfile
        case regionNorte
        case regionSul
        case regionSudeste
        case regionCentroOeste
        case regionNordeste
        case isDarMode
        case firstExecute
        case isVibrate
    }
    
    
    //MARK: Varivel computada que no get retorna o valor da variavel, ja definida como userDefaults e o set define. Como estou estendendo a UserDefaults nao e nescessario colocar UserDefaults.standart
    var imageProfile: UIImage{
        get{
            //retornando o valor da varivel imageProfile. No forKey estou passando um case do Enum, assim previne duplicidade de String.
            
            if let imageData = UserDefaults.standard.value(forKey: UserDefaultsKeys.imageProfile.rawValue) as? Data,
               
               let image = UIImage(data: imageData) {
                print("Imagem recuperada dos dados do UserDefaults")
                return image
            } else {
                print("Imagem inválida ou não encontrada, usando imagem padrão")
                return UIImage(named: "arara") ?? UIImage()
            }
        }
        
        
        set {
            //retornando o valor da varivel imageProfile. No forKey estou passando um case do Enum, assim previne duplicidade de String.
            if let image = newValue.pngData(){
                setValue(image, forKey: UserDefaultsKeys.imageProfile.rawValue)
                print("setvalue from userdefaults")
            }
            
        }
    }
    
    
    var regionNorte: (value: Int, isGreaterThanOrEqualTo5: Bool) {
            get {
                let storedValue = integer(forKey: UserDefaultsKeys.regionNorte.rawValue)
                let isGreaterThanOrEqualTo5 = storedValue >= 5
                return (storedValue, isGreaterThanOrEqualTo5)
            }
        }
        
    
    var regionSul: (value: Int, isGreaterThanOrEqualTo5: Bool) {
            get {
                let storedValue = integer(forKey: UserDefaultsKeys.regionSul.rawValue)
                let isGreaterThanOrEqualTo5 = storedValue >= 5
                return (storedValue, isGreaterThanOrEqualTo5)
            }
        }
        
    
    var regionSudeste: (value: Int, isGreaterThanOrEqualTo5: Bool) {
            get {
                let storedValue = integer(forKey: UserDefaultsKeys.regionSudeste.rawValue)
                let isGreaterThanOrEqualTo5 = storedValue >= 5
                return (storedValue, isGreaterThanOrEqualTo5)
            }
        }
        
    
    var regionCentroOeste: (value: Int, isGreaterThanOrEqualTo5: Bool) {
            get {
                let storedValue = integer(forKey: UserDefaultsKeys.regionCentroOeste.rawValue)
                let isGreaterThanOrEqualTo5 = storedValue >= 5
                return (storedValue, isGreaterThanOrEqualTo5)
            }
        }
        
    var regionNordeste: (value: Int, isGreaterThanOrEqualTo5: Bool) {
            get {
                let storedValue = integer(forKey: UserDefaultsKeys.regionNordeste.rawValue)
                let isGreaterThanOrEqualTo5 = storedValue >= 5
                return (storedValue, isGreaterThanOrEqualTo5)
            }
        }
    
    
    var isDarMode: (firstExecute: Bool, isDarMode: Bool){
        get{
            let firstExecute = value(forKey: UserDefaultsKeys.firstExecute.rawValue) as? Bool ?? true
            let isDarMode = value(forKey: UserDefaultsKeys.isDarMode.rawValue) as? Bool ?? false
            return (firstExecute, isDarMode)
        }
        set{
            setValue(newValue.isDarMode, forKey: UserDefaultsKeys.isDarMode.rawValue)
            setValue(newValue.firstExecute, forKey: UserDefaultsKeys.firstExecute.rawValue)
        }
    }
    
    
    var isVibrate: Bool? {
        get{
            let value = value(forKey: UserDefaultsKeys.isVibrate.rawValue) as? Bool ?? true
            return (value)
        }
        set{
            setValue(newValue, forKey: UserDefaultsKeys.isVibrate.rawValue)
        }
    }
    
    
    func addPointToRegion(region: String) {
        
        let regiaoUpCase: String = region.uppercased()
        var regionKey: String = ""
                
        switch regiaoUpCase {
        case "NORTE":
            regionKey = UserDefaultsKeys.regionNorte.rawValue
            
        case "SUL":
            regionKey = UserDefaultsKeys.regionSul.rawValue
            
        case "SUDESTE":
            regionKey = UserDefaultsKeys.regionSudeste.rawValue
            
        case "CENTRO-OESTE":
            regionKey = UserDefaultsKeys.regionCentroOeste.rawValue
            
        case "Nordeste":
            regionKey = UserDefaultsKeys.regionNordeste.rawValue
            
        default:
//            fatalError("erro: regiao e \(region)")
            print("brasil")
        }
            
        let currentValue = integer(forKey: regionKey)
        
        setValue(currentValue + 1, forKey: regionKey)
        
    }
}

//
//  CoreDataManeger.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 29/09/23.
//

import Foundation
import CoreData


class CoreDataManager {
    // MARK: - Core Data stack

    let context = CoreDataManager.persistentContainer.viewContext
    
    static let coreDataManager = CoreDataManager()
    
    static var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Model")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    
    init(){
        print("Inicializei o core data")
        initialPerfil()
    }
    
    func fetchPerfil() -> Perfil{
        do{
            let fetchValue = try self.context.fetch(Perfil.fetchRequest())
            
            if let person = fetchValue.first{
                return person
            }else{
                let perfil = Perfil(context: self.context)
                CoreDataManager.saveContext()
                return perfil
            }
        }catch {
            fatalError("Error in fetch CoreDataManager in func fetchPerson: \(error)")
        }
    }

    private func initialPerfil(){
        let newPerson = Perfil(context: self.context)
        
        newPerson.nome = "Carros 2"
        newPerson.regiao = "RegiÃ£o: Norte"
        
        CoreDataManager.saveContext()
    }
    
    func updateNamePerfil(name: String){
        let perfil = fetchPerfil()
        perfil.nome = name
        CoreDataManager.saveContext()
    }
    
    func updateRegionPerfil(region: String){
        let perfil = fetchPerfil()
        perfil.regiao = region
        CoreDataManager.saveContext()
    }
    
    // MARK: - Core Data Saving support

     static func saveContext () {
        let context = persistentContainer.viewContext
         
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}

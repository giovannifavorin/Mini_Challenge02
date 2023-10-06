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
                saveContext()
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
        
        saveContext()
    }
    
    func updateNamePerfil(name: String){
        let perfil = fetchPerfil()
        perfil.nome = name
        saveContext()
    }
    
    func updateRegionPerfil(region: String){
        let perfil = fetchPerfil()
        perfil.regiao = region
        saveContext()
    }
    
    // MARK: - Core Data Saving support

    func saveContext () {
        let context = CoreDataManager.persistentContainer.viewContext
         
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    func perfil(nome: String, regiao: String, palavras: Int64, ofensiva: Int64, jogostotais: Int64, id: UUID) -> Perfil{
        let perfil = Perfil(context: CoreDataManager.persistentContainer.viewContext)
        perfil.nome = nome
        perfil.regiao = regiao
        perfil.palavras = palavras
        perfil.ofensiva = ofensiva
        perfil.jogostotais = jogostotais
        perfil.id = id
        return perfil
    }
    
    func dicionario(titulo: String, regiao: String, descricao: String, id: UUID) -> Dicionario{
        let dicionario = Dicionario(context: CoreDataManager.persistentContainer.viewContext)
        dicionario.titulo = titulo
        dicionario.regiao = regiao
        dicionario.descricao = descricao
        return dicionario
    }
    
    func perfis() -> [Perfil]{
        let request: NSFetchRequest<Perfil> = Perfil.fetchRequest()
        var fetchedPerfis: [Perfil] = []
        
        do{
            fetchedPerfis = try
            CoreDataManager.persistentContainer.viewContext.fetch(request)
        } catch let error {
            print("Error fetching profiles \(error)")
        }
        
        return fetchedPerfis
    }
    
    func dicionarios(perfil: Perfil) -> [Dicionario]{
        let request: NSFetchRequest<Dicionario> = Dicionario.fetchRequest()
        request.predicate = NSPredicate(format: "perfil = %@", perfil)
        request.sortDescriptors = [NSSortDescriptor(key: "regiao",  ascending: false)]
        var fetchedDicionarios: [Dicionario] = []
        
        do{
            fetchedDicionarios = try CoreDataManager.persistentContainer.viewContext.fetch(request)
        } catch let error{
            print("Error fetching \(error)")
        }
        
        return fetchedDicionarios
    }
    
    func deleteDicio(dicionario: Dicionario){
        let context = CoreDataManager.persistentContainer.viewContext
        context.delete(dicionario)
        saveContext()
    }
    
    func deletePerfil(perfil: Perfil){
        let context = CoreDataManager.persistentContainer.viewContext
        context.delete(perfil)
        saveContext()
    }

}

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
    
    static let shared = CoreDataManager()

    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Model")
        
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support

      func saveContext () {
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
    
    func perfil(nome: String, regiao: String, palavras: Int64, ofensiva: Int64, jogostotais: Int64, id: UUID) -> Perfil{
        let perfil = Perfil(context: persistentContainer.viewContext)
        perfil.nome = nome
        perfil.regiao = regiao
        perfil.palavras = palavras
        perfil.ofensiva = ofensiva
        perfil.jogostotais = jogostotais
        perfil.id = id
        return perfil
    }
    
    func dicionario(titulo: String, regiao: String, descricao: String, id: UUID) -> Dicionario{
        let dicionario = Dicionario(context: persistentContainer.viewContext)
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
            persistentContainer.viewContext.fetch(request)
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
            fetchedDicionarios = try persistentContainer.viewContext.fetch(request)
        } catch let error{
            print("Error fetching \(error)")
        }
        
        return fetchedDicionarios
    }
}

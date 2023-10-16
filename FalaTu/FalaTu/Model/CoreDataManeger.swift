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
    
    private var incrementer = IncrementeValueUpdateSchedule()
    
    static let coreDataManager = CoreDataManager()
    
    private let namesDefaults: [String] = ["Fulano", "Ciclano", "Sasi", "Boitatá", "CurupiraYE"]
    
    private var randomName: String?
    
    var ofensiveUpdateTimer: Timer?
    
    
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
        randomName = namesDefaults.randomElement()
        
        initialPerfil()
        setupOfensiveUpdateTimer()
        
        
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
        
        newPerson.nome = "\(String(describing: randomName!))"
        
        saveContext()
    }
    
    func updateNamePerfil(name: String){
        let perfil = fetchPerfil()
        perfil.nome = name
        saveContext()
    }
    
    func updateTotalDeJogos(){
        let perfil = fetchPerfil()
        perfil.jogostotais = perfil.jogostotais + 1
        saveContext()
    }
    
    func updatePalavrasAcertadas(){
        let perfil = fetchPerfil()
        perfil.palavras = perfil.palavras + 1
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
    
    
    //MARK: - Verfica valor
    
    private func setupOfensiveUpdateTimer() {
        ofensiveUpdateTimer = Timer.scheduledTimer(timeInterval: 24 * 60 * 60, target: self, selector: #selector(updateOfensive), userInfo: nil, repeats: true)
    }

    @objc 
    func updateOfensive() {
        let perfil = fetchPerfil()
        perfil.ofensiva = perfil.ofensiva + 1
        perfil.lastUpdateOfensive = Date()
        saveContext()
    }

    func applicationDidBecomeActive() {
        checkAndUpdateOfensiveIf24HoursPassed()
    }

    func checkAndUpdateOfensiveIf24HoursPassed() {
        let perfil = fetchPerfil()

        if let lastUpdateDate = perfil.lastUpdateOfensive {
            let calendar = Calendar.current
            if let twentyFourHoursAgo = calendar.date(byAdding: .hour, value: -24, to: Date()) {
                if lastUpdateDate <= twentyFourHoursAgo {
                    
                    updateOfensive()
                }
            }
        }
    }
}

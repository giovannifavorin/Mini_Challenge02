//
//  PerfilViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 26/09/23.
//

import UIKit

class PerfilViewController: UIViewController {
    
    let context = CoreDataManager.shared.persistentContainer.viewContext

    var preferencesPerfil: [Perfil]?
    
    private lazy var perfilView: PerfilMainView = {
        let view = PerfilMainView()
        return view
    }()
        
    override func loadView() {
        self.view = perfilView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViewControllerModel()
        self.perfilView.userInformationView.delegateUserPreferences = self
        
        fetchPerfil()
        self.perfilView.userInformationView.cofigure(with: "teste")
    }
}


extension PerfilViewController: ViewControllerModel{
    func addSubviews() {
    }
    
    func addStyle() {
    }
    
    func addConstraints() {

    }
    
    func saveInCoreData(region: String){
        
        let IdPerfil = UUID()
        
        let newProfile = Perfil(context: self.context)
        
        newProfile.id = IdPerfil
        newProfile.regiao = region
        
        do{
            try self.context.save()
            print("salvei")
        }catch{
            print("error in save region name")
        }
        
//        self.fetchPerfil(region: region)
    }
    
    func fetchPerfil(){
        
//        let fetchRequest = Perfil(context: self.context)
        
//        let fetch = try self.context.fetch(fetchRequest)
        
    }
    
    
//    func fetchPerfil(region: String){
//
//        let idPerfil = UUID()
//        
//        let fetchRequest = Perfil.fetchRequest()
////        fetchRequest.predicate = NSPredicate(format: "id == %@", idPerfil as CVarArg)
//
//        do {
//            print(idPerfil)
//            let preferencesPerfil = try self.context.fetch(fetchRequest)
//            
//            print(preferencesPerfil)
//            
//            if let existingProfile = preferencesPerfil.first {
//                // O perfil já existe, você pode acessá-lo e atualizá-lo
//                existingProfile.regiao = region
//                // Outras atualizações conforme necessário
//                print("Perfil já existe e foi atualizado.")
//            } else {
//                // O perfil não existe, você cria um novo
//                let newProfile = Perfil(context: self.context)
//                newProfile.id = idPerfil
//                newProfile.regiao = region
//                // Outros atributos do novo perfil
//                print("Novo perfil criado.")
//            }
//            
//            try self.context.save()
//            print("Dados salvos com sucesso.")
//        } catch {
//            print("Erro ao buscar ou salvar dados do Core Data: \(error)")
//        }
//        
//    }
}

extension PerfilViewController: DelegateUserPreferences{
    func configureRegionLabel(region: String) {
        print("regiao e \(region)")
        saveInCoreData(region: region)
//        fetchPerfil(region: region)
    }
}

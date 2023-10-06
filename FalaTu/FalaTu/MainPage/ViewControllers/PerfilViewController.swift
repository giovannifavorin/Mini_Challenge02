//
//  PerfilViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 26/09/23.
//

import UIKit

class PerfilViewController: UIViewController {
    
    private let coreDataSingleton = CoreDataManager.coreDataManager
    private var listSelectAvatar: [AvatarModelData]? = []
    let defaults = UserDefaults.standard
    weak var delegateUpdateButtonPerfil: DelegateUpdateInButtonPerfil?
    
    private lazy var perfilView: PerfilMainView = {
        let view = PerfilMainView()
        return view
    }()

    
    @objc
    private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    private lazy var popUpViewController: PopUpViewController = {
       let view = PopUpViewController()
       view.modalPresentationStyle = .overFullScreen
       return view
    }()

    override func loadView() {
        self.view = perfilView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        addDelegates()
        configureSubViewWithData()
        navigationItem.titleView = perfilView.labelPerfil
    }
    
    private func addDelegates(){
        self.perfilView.userInformationView.delegateUserPreferences = self
        self.perfilView.collectionView.delegatePopUp = self
        self.popUpViewController.delegado = self
    }
    
    private func configureSubViewWithData(){
        let perilfPreference = coreDataSingleton.fetchPerfil()

        let image = defaults.imageProfile
        
        print("estou dsando print no valo image description:: \(image)")
        
        self.perfilView.userInformationView.cofigure(name: "\(perilfPreference.nome ?? "Carros 2")",
                                                     image: image)
        
        
        self.perfilView.userInformationView.viewOffensive.configure(labelText: "Ofensiva",
                                                                    labelNumber: "10",
                                                                    image: UIImage(named: "ConfigButton")!)
        
        self.perfilView.userInformationView.viewTotalGames.configure(labelText: "Total de Jogos",
                                                                     labelNumber: "1",
                                                                     image: UIImage(named: "ConfigButton")!)
        
        self.perfilView.userInformationView.viewWords.configure(labelText: "Palavras",
                                                                labelNumber: "110",
                                                                image: UIImage(named: "ConfigButton")!)
        
       
        listSelectAvatar?.append(AvatarModelData(name: "Gustavo",
                                                 region: "Brasília",
                                                 image: UIImage(named: "1")
                                                 ?? UIImage(named: "asset")!))
        
        listSelectAvatar?.append(AvatarModelData(name: "Laura",
                                                 region: "Amazonas",
                                                 image: UIImage(named: "2")
                                                 ?? UIImage(named: "asset")!))
        
        listSelectAvatar?.append(AvatarModelData(name: "João",
                                                 region: "Bahia",
                                                 image: UIImage(named: "3")
                                                 ?? UIImage(named: "asset")!))
        
        listSelectAvatar?.append(AvatarModelData(name: "Valentina",
                                                 region: "Rio Grande do Sul",
                                                 image: UIImage(named: "4")
                                                 ?? UIImage(named: "asset")!))
        
        listSelectAvatar?.append(AvatarModelData(name: "Tuco",
                                                 region: "Rio de Janeiro",
                                                 image: UIImage(named: "5")
                                                 ?? UIImage(named: "asset")!))
        
        listSelectAvatar?.append(AvatarModelData(name: "Carla",
                                                 region: "Minas Gerais",
                                                 image: UIImage(named: "6")
                                                 ?? UIImage(named: "asset")!))
        
    
        
        self.perfilView.collectionView.configure(data: listSelectAvatar!)
    }
}


extension PerfilViewController: DelegateUserPreferences{
    func changeImage() {
        perfilView.userInformationView.imageView.image = defaults.imageProfile
        self.delegateUpdateButtonPerfil?.updateImage()
    }

    func presentPopUP(index: IndexPath) {
        present(popUpViewController, animated: false)
        
        
        guard let image = listSelectAvatar?[index.row].image,
              let state = listSelectAvatar?[index.row].region,
              let name = listSelectAvatar?[index.row].name
        else {
            print("value nill in image from: 'PerfilViewController -> presentPopUP' ")
            return
        }
        
       
        switch index.row {
        case 0:
             let isBlocked = true
             let numberOfHits = 5
             configurePopUpInRunTime(isBlocked: isBlocked,
                                     numberOfHits: numberOfHits,
                                     state: state,
                                     image: image,
                                     indentifier: index.row,
                                     name: name)
        case 1:
            let result = defaults.regionNorte
            let isBlocked = result.isGreaterThanOrEqualTo5
            let numberOfHits = result.value
            configurePopUpInRunTime(isBlocked: isBlocked,
                                    numberOfHits: numberOfHits,
                                    state: state,
                                    image: image,
                                    indentifier: index.row,
                                    name: name)
            
        case 2:
            let result = defaults.regionNordeste
            let isBlocked = result.isGreaterThanOrEqualTo5
            let numberOfHits = result.value
            configurePopUpInRunTime(isBlocked: isBlocked,
                                    numberOfHits: numberOfHits,
                                    state: state,
                                    image: image,
                                    indentifier: index.row,
                                    name: name)
            
        case 3:
            let result = defaults.regionSul
            let isBlocked = result.isGreaterThanOrEqualTo5
            let numberOfHits = result.value
            configurePopUpInRunTime(isBlocked: isBlocked,
                                    numberOfHits: numberOfHits,
                                    state: state,
                                    image: image,
                                    indentifier: index.row,
                                    name: name)
            
        case 4:
            let result = defaults.regionSudeste
            let isBlocked = result.isGreaterThanOrEqualTo5
            let numberOfHits = result.value
            configurePopUpInRunTime(isBlocked: isBlocked,
                                    numberOfHits: numberOfHits,
                                    state: state,
                                    image: image,
                                    indentifier: index.row,
                                    name: name)
            
        case 5:
            let result = defaults.regionCentroOeste
            let isBlocked = result.isGreaterThanOrEqualTo5
            let numberOfHits = result.value
            configurePopUpInRunTime(isBlocked: isBlocked,
                                    numberOfHits: numberOfHits,
                                    state: state,
                                    image: image,
                                    indentifier: index.row,
                                    name: name)
            
        default:
            break
        }
    }
    
    func configurePopUpInRunTime(isBlocked: Bool, numberOfHits: Int, state: String, image: UIImage, indentifier: Int, name: String){
        
        popUpViewController.popUpView.configureButton(isBlocked: isBlocked)
        
        popUpViewController.popUpView.configure(labelAvatarBlocked: isBlocked ? "\(name)" : "Avatar\nBloqueado!",
                                                labelWordHits: "\(numberOfHits) / 5 palavras",
                                                labelState: "Estado: \(state)",
                                                imageAvatarView: image,
                                                tag: (indentifier))
    }
     
    func configureNamePerfil(name: String) {
        self.delegateUpdateButtonPerfil?.updateName(name: name)
        coreDataSingleton.updateNamePerfil(name: name)
    }
}



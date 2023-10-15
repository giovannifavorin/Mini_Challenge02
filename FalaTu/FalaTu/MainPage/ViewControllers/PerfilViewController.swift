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
    
    private lazy var buttonBack: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "buttonBackPerfil"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    
    @objc
    private func backButtonTapped(_ sender: UIButton!) {
        navigationController?.popViewController(animated: true)
        self.addHapticFeedbackFromViewController(type: .error)
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
        setupUI()
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
                                                                    image: UIImage(named: "ofensiva")!)
        
        self.perfilView.userInformationView.viewTotalGames.configure(labelText: "Total de Jogos",
                                                                     labelNumber: "1",
                                                                     image: UIImage(named: "totalDeJogos")!)
        
        self.perfilView.userInformationView.viewWords.configure(labelText: "Palavras",
                                                                labelNumber: "110",
                                                                image: UIImage(named: "palavras")!)
        
       
        listSelectAvatar?.append(AvatarModelData(name: "Arara",
                                                 region: "Brasília",
                                                 image: UIImage(named: "arara")
                                                 ?? UIImage(named: "asset")!))
        
        listSelectAvatar?.append(AvatarModelData(name: "Onca",
                                                 region: "Amazonas",
                                                 image: UIImage(named: "onca")
                                                 ?? UIImage(named: "asset")!))
        
        listSelectAvatar?.append(AvatarModelData(name: "Preguica",
                                                 region: "São Paulo",
                                                 image: UIImage(named: "preguica")
                                                 ?? UIImage(named: "asset")!))
        
        listSelectAvatar?.append(AvatarModelData(name: "Pavao",
                                                 region: "Rio Grande do Sul",
                                                 image: UIImage(named: "pavao")
                                                 ?? UIImage(named: "asset")!))
//        
//        listSelectAvatar?.append(AvatarModelData(name: "Tuco",
//                                                 region: "Rio de Janeiro",
//                                                 image: UIImage(named: "5")
//                                                 ?? UIImage(named: "asset")!))
//        
//        listSelectAvatar?.append(AvatarModelData(name: "Carla",
//                                                 region: "Minas Gerais",
//                                                 image: UIImage(named: "6")
//                                                 ?? UIImage(named: "asset")!))
//        
    
        
        self.perfilView.collectionView.configure(data: listSelectAvatar!)
    }
    
    
    func setupUI(){
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.addSubview(buttonBack)

        NSLayoutConstraint.activate([
            buttonBack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            buttonBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
        ])
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
//            let result = defaults.regionNorte
//            let isBlocked = result.isGreaterThanOrEqualTo5
            let isBlocked = true
            let numberOfHits = 5
//            let numberOfHits = result.value
            configurePopUpInRunTime(isBlocked: isBlocked,
                                    numberOfHits: numberOfHits,
                                    state: state,
                                    image: image,
                                    indentifier: index.row,
                                    name: name)
            
        case 2:
//            let result = defaults.regionNordeste
//            let isBlocked = result.isGreaterThanOrEqualTo5
//            let numberOfHits = result.value
            let isBlocked = true
            let numberOfHits = 5
            configurePopUpInRunTime(isBlocked: isBlocked,
                                    numberOfHits: numberOfHits,
                                    state: state,
                                    image: image,
                                    indentifier: index.row,
                                    name: name)
            
        case 3:
//            let result = defaults.regionSul
//            let isBlocked = result.isGreaterThanOrEqualTo5
//            let numberOfHits = result.value
            let isBlocked = true
            let numberOfHits = 5
            configurePopUpInRunTime(isBlocked: isBlocked,
                                    numberOfHits: numberOfHits,
                                    state: state,
                                    image: image,
                                    indentifier: index.row,
                                    name: name)
            
//        case 4:
//            let result = defaults.regionSudeste
//            let isBlocked = result.isGreaterThanOrEqualTo5
//            let numberOfHits = result.value
//            configurePopUpInRunTime(isBlocked: isBlocked,
//                                    numberOfHits: numberOfHits,
//                                    state: state,
//                                    image: image,
//                                    indentifier: index.row,
//                                    name: name)
//            
//        case 5:
//            let result = defaults.regionCentroOeste
//            let isBlocked = result.isGreaterThanOrEqualTo5
//            let numberOfHits = result.value
//            configurePopUpInRunTime(isBlocked: isBlocked,
//                                    numberOfHits: numberOfHits,
//                                    state: state,
//                                    image: image,
//                                    indentifier: index.row,
//                                    name: name)
            
        default:
            break
        }
    }
    
    func configurePopUpInRunTime(isBlocked: Bool, numberOfHits: Int, state: String, image: UIImage, indentifier: Int, name: String){
                
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



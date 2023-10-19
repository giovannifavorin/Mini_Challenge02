//
//  PerfilViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 26/09/23.
//

import UIKit

class PerfilViewController: UIViewController {
    
    weak var delegateUpdateButtonPerfil: DelegateUpdateInButtonPerfil?
    private let coreDataSingleton = CoreDataManager.coreDataManager
    private var listSelectAvatar: [AvatarModelData]? = []
    let defaults = UserDefaults.standard
    
    
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

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureSubViewWithData()
    }
    
    
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
        setupUI()
    }
    
    private func addDelegates(){
        self.perfilView.userInformationView.delegateUserPreferences = self
        self.perfilView.collectionView.delegatePopUp = self
        self.popUpViewController.delegado = self
    }
    
    
    private func configureSubViewWithData() {
        configureProfileData()
        configureAvatarCollection()
    }
    

    private func configureProfileData() {
        let profilePreferences = coreDataSingleton.fetchPerfil()
        let image = defaults.imageProfile
        
        self.perfilView.userInformationView.cofigure(name: profilePreferences.nome ?? "Carros 2", image: image)

        self.perfilView.userInformationView.viewOffensive.configure(labelText: "Ofensiva",
                                                                  labelNumber: "\(profilePreferences.ofensiva)",
                                                                  image: UIImage(named: "ofensiva")!)

        self.perfilView.userInformationView.viewTotalGames.configure(labelText: "Total de Jogos",
                                                                   labelNumber: "\(profilePreferences.jogostotais)",
                                                                   image: UIImage(named: "totalDeJogos")!)

        self.perfilView.userInformationView.viewWords.configure(labelText: "Palavras",
                                                              labelNumber: "\(profilePreferences.palavras)",
                                                              image: UIImage(named: "palavras")!)
    }
    
    
    private func configureAvatarCollection() {
        listSelectAvatar = [
            AvatarModelData(name: "Arara", region: "Brasília", image: UIImage(named: "arara") ?? UIImage(named: "asset")!),
            AvatarModelData(name: "Onça", region: "Amazonas", image: UIImage(named: "onca") ?? UIImage(named: "asset")!),
            AvatarModelData(name: "Preguiça", region: "São Paulo", image: UIImage(named: "preguica") ?? UIImage(named: "asset")!),
            AvatarModelData(name: "Pavão", region: "Rio Grande do Sul", image: UIImage(named: "pavao") ?? UIImage(named: "asset")!)
        ]

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
        guard let avatarData = listSelectAvatar?[index.row] else {
            print("value nil in image from: 'PerfilViewController -> presentPopUP'")
            return
        }

        
        let configurations: [(isBlocked: Bool, numberOfHits: Int)] = [
            (isBlocked: true, numberOfHits: 5),  // Caso 0
            (isBlocked: defaults.regionNorte.isGreaterThanOrEqualTo5, numberOfHits: defaults.regionNorte.value),  // Caso 1
            (isBlocked: defaults.regionNordeste.isGreaterThanOrEqualTo5, numberOfHits: defaults.regionNordeste.value),  // Caso 2
            (isBlocked: defaults.regionSul.isGreaterThanOrEqualTo5, numberOfHits: defaults.regionSul.value)  // Caso 3
        ]

        
        if index.row < configurations.count {
            let (isBlocked, numberOfHits) = configurations[index.row]

            configurePopUpInRunTime(isBlocked: isBlocked,
                                    numberOfHits: numberOfHits,
                                    state: avatarData.region,
                                    image: avatarData.image,
                                    indentifier: index.row,
                                    name: avatarData.name)

            present(popUpViewController, animated: false)
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



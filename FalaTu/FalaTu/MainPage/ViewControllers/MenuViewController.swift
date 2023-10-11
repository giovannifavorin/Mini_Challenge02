//
//  ViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 18/09/23.
//

import UIKit

// Main viewController
class MenuViewController: UIViewController {
    
    let defults = UserDefaults.standard
    let coreData = CoreDataManager.coreDataManager
    
    //Proportions for buttons
    let buttonsWidthPercentage: CGFloat = 0.15
    let buttonsHeightPercentage: CGFloat = 0.06
    
    //Proportions for logo
    let logoWidthPercentage: CGFloat = 0.6
    let logoHeightPercentage: CGFloat = 0.058
    
    
    private lazy var custonButtonPerfil: CustonButton = {
        let button = CustonButton()
        button.buttonText = "\(String(describing: coreData.fetchPerfil().nome ?? "Carlos"))"
        button.imageViewLeft = defults.imageProfile
        button.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.tag = 4
        return button
    }()
    
    ///Imagem da logo
    private lazy var logoView: UIImageView = {
        let logoImage = UIImage(named: "game_logo")
        let logoView = UIImageView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.contentMode = .scaleAspectFill
        logoView.image = logoImage
        return logoView
    }()
    
    private lazy var frameTop: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "MolduraTop")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var frameBotton: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "MolduraBotton")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    ///Configuração do botao de inventário
    private lazy var inventoryButton: UIButton = {
        let inventoryButton = UIButton(type: .custom)
        inventoryButton.translatesAutoresizingMaskIntoConstraints = false
        let inventoryButtonImage = UIImage(named: "button_library")
        inventoryButton.setImage(inventoryButtonImage, for: .normal)
        inventoryButton.contentMode = .scaleAspectFill
        inventoryButton.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        inventoryButton.tag = 1
        return inventoryButton
    }()
    
    ///Configuração do botão de dicionário
    private lazy var dictionaryButton: UIButton = {
        let dictionaryButton = UIButton(type: .custom)
        dictionaryButton.translatesAutoresizingMaskIntoConstraints = false
        let dictionaryImage = UIImage(named: "button_dictionary")
        dictionaryButton.setImage(dictionaryImage, for: .normal)
        dictionaryButton.contentMode = .scaleAspectFill
        dictionaryButton.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        dictionaryButton.tag = 2
        return dictionaryButton
    }()
    
    ///Configuração do botão de configuration
    private lazy var configurationButton: UIButton = {
        let configurationButton = UIButton(type: .custom)
        configurationButton.translatesAutoresizingMaskIntoConstraints = false
        let configurationImage = UIImage(named: "button_settings")
        configurationButton.setImage(configurationImage, for: .normal)
        configurationButton.contentMode = .scaleAspectFill
        configurationButton.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        configurationButton.tag = 3
        return configurationButton
    }()
    
    private lazy var imagebackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "pattern")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    /// View que o Gustavo fez, a carrossel
    private lazy var carouselMenuComponent: CarouselMenuComponent = {
        let view = CarouselMenuComponent()
        view.view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// View de perfis
    private lazy var perfilViewController: PerfilViewController = {
        return PerfilViewController()
    }()
    
    /// View de configurações
    private lazy var configViewController: ConfigurationViewController = {
        let configurationViewController = ConfigurationViewController()
        configurationViewController.modalPresentationStyle = .overFullScreen
        return configurationViewController
    }()
    
    /// View de seleção de região do inventário
    private lazy var regionSelectionViewController: RegionSelectionViewController = {
        return RegionSelectionViewController()
    }()
    
    /// View do dicionário
    private lazy var dictionaryViewController: DictionaryViewController = {
        return DictionaryViewController()
    }()
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllerModel()
        navigationItem.hidesBackButton = true
        
        self.perfilViewController.delegateUpdateButtonPerfil = self
    }
    
    /// Configuração das açoes dos botões
    @objc private func didButton(_ sender: UIButton!) {
        switch sender.tag {
        case 1:
            navigationController?.pushViewController(regionSelectionViewController, animated: true)
        case 2:
            navigationController?.pushViewController(dictionaryViewController, animated: true)
        case 3:
            present(configViewController, animated: false)
        case 4:
            navigationController?.pushViewController(perfilViewController, animated: true)
        default:
            return
        }
    }
}

extension MenuViewController: ViewControllerModel {
    func addSubviews() {
        //Adicionando a viewController
        addChild(carouselMenuComponent)
        //Adicionando as views
        view.addSubview(imagebackground)
        view.addSubview(frameTop)
        view.addSubview(frameBotton)
        view.addSubview(carouselMenuComponent.view)
        view.addSubview(logoView)
        view.addSubview(inventoryButton)
        //        view.addSubview(dictionaryButton)
        view.addSubview(configurationButton)
        //        view.sendSubviewToBack(imagebackground)
        view.addSubview(custonButtonPerfil)
    }
    
    func addStyle() {
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    func addConstraints() {
        if UIDevice.current.userInterfaceIdiom == .pad{
            contrainsiPad()
        }else if UIDevice.current.userInterfaceIdiom == .phone{
            contrainsiPhone()
        }
        
    }
}


extension MenuViewController: DelegateUpdateInButtonPerfil{
    func updateName(name: String) {
        self.custonButtonPerfil.buttonText = name
    }
    
    func updateImage() {
        self.custonButtonPerfil.imageViewLeft = defults.imageProfile
    }
}


//constraints iphones e ipad
extension MenuViewController{
    private func contrainsiPhone(){
        
        NSLayoutConstraint.activate([
            
            //background image
            imagebackground.topAnchor.constraint(equalTo: view.topAnchor),
            imagebackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imagebackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imagebackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            //frame image top
            frameTop.topAnchor.constraint(equalTo: view.topAnchor),
            frameTop.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frameTop.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            frameTop.heightAnchor.constraint(equalToConstant: view.frame.height/5.5),
            
            //frame image Botton
            frameBotton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            frameBotton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            frameBotton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            frameBotton.heightAnchor.constraint(equalToConstant: view.frame.height/5.5),
            
            //LOGO
            logoView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.20),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: logoWidthPercentage),
            logoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: logoHeightPercentage),
            
            //CAROUSEL
            carouselMenuComponent.view.topAnchor.constraint(equalTo: view.topAnchor),
            carouselMenuComponent.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            carouselMenuComponent.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carouselMenuComponent.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            //INVENTORY
            inventoryButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.78),
            //            inventoryButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height * 0.2),
            //            inventoryButton.leadingAnchor.constraint(equalTo: logoView.leadingAnchor),
            inventoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            inventoryButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: buttonsWidthPercentage),
            inventoryButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: buttonsWidthPercentage),
            
            //            //DICTIONARY
            //            dictionaryButton.trailingAnchor.constraint(equalTo: inventoryButton.leadingAnchor, constant: -33),
            //            dictionaryButton.centerYAnchor.constraint(equalTo: inventoryButton.centerYAnchor),
            //            dictionaryButton.widthAnchor.constraint(equalTo: inventoryButton.widthAnchor),
            //            dictionaryButton.heightAnchor.constraint(equalTo: inventoryButton.heightAnchor),
            //
            //            //CONFIGURATION
            configurationButton.bottomAnchor.constraint(equalTo: inventoryButton.bottomAnchor),
            configurationButton.leadingAnchor.constraint(equalTo: inventoryButton.trailingAnchor, constant: 33),
            configurationButton.widthAnchor.constraint(equalTo: inventoryButton.widthAnchor),
            configurationButton.heightAnchor.constraint(equalTo: inventoryButton.heightAnchor),
            
            custonButtonPerfil.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 30),
            custonButtonPerfil.centerXAnchor.constraint(equalTo: logoView.centerXAnchor),
            custonButtonPerfil.heightAnchor.constraint(equalToConstant: 40),
            custonButtonPerfil.widthAnchor.constraint(equalToConstant: 142),
            
            
        ])
    }
    
    
    private func contrainsiPad(){
            NSLayoutConstraint.activate([
                
                //background image
                imagebackground.topAnchor.constraint(equalTo: view.topAnchor),
                imagebackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                imagebackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                imagebackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                //frame image top
                frameTop.topAnchor.constraint(equalTo: view.topAnchor),
                frameTop.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                frameTop.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                frameTop.heightAnchor.constraint(equalToConstant: view.frame.height/5.5),
                
                //frame image Botton
                frameBotton.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                frameBotton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                frameBotton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                frameBotton.heightAnchor.constraint(equalToConstant: view.frame.height/5.5),
                
                //LOGO
                logoView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.20),
                logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                logoView.widthAnchor.constraint(equalToConstant: view.frame.width * 0.40),
                logoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: logoHeightPercentage),
                
                //CAROUSEL
                carouselMenuComponent.view.topAnchor.constraint(equalTo: view.topAnchor),
                carouselMenuComponent.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
                carouselMenuComponent.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                carouselMenuComponent.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                
                //INVENTORY
                inventoryButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.78),
                //            inventoryButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height * 0.2),
                //            inventoryButton.leadingAnchor.constraint(equalTo: logoView.leadingAnchor),
                inventoryButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                inventoryButton.widthAnchor.constraint(equalToConstant: 100),
                inventoryButton.heightAnchor.constraint(equalToConstant: 100),
                
                //            //DICTIONARY
                //            dictionaryButton.trailingAnchor.constraint(equalTo: inventoryButton.leadingAnchor, constant: -33),
                //            dictionaryButton.centerYAnchor.constraint(equalTo: inventoryButton.centerYAnchor),
                //            dictionaryButton.widthAnchor.constraint(equalTo: inventoryButton.widthAnchor),
                //            dictionaryButton.heightAnchor.constraint(equalTo: inventoryButton.heightAnchor),
                //
                //            //CONFIGURATION
                //            configurationButton.bottomAnchor.constraint(equalTo: inventoryButton.bottomAnchor),
                //            configurationButton.leadingAnchor.constraint(equalTo: inventoryButton.trailingAnchor, constant: 33),
                //            configurationButton.widthAnchor.constraint(equalTo: inventoryButton.widthAnchor),
                //            configurationButton.heightAnchor.constraint(equalTo: inventoryButton.heightAnchor),
                
                custonButtonPerfil.topAnchor.constraint(equalTo: logoView.bottomAnchor, constant: 30),
                custonButtonPerfil.centerXAnchor.constraint(equalTo: logoView.centerXAnchor),
                custonButtonPerfil.heightAnchor.constraint(equalToConstant: 50),
                custonButtonPerfil.widthAnchor.constraint(equalToConstant: view.frame.width*0.20),
            ])
    }
}

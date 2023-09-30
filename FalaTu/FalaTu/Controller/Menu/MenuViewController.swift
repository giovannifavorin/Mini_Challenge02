//
//  ViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 18/09/23.
//

import UIKit

// Main viewController
class MenuViewController: UIViewController {
    //Proportions for buttons
    let buttonsWidthPercentage: CGFloat = 0.15
    let buttonsHeightPercentage: CGFloat = 0.06
    //Proportions for logo
    let logoWidthPercentage: CGFloat = 0.48
    let logoHeightPercentage: CGFloat = 0.058
    
    private lazy var logoView: UIImageView = {
        let logoImage = UIImage(named: "game_logo")
        
        let logoView = UIImageView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.contentMode = .scaleAspectFit
        logoView.image = logoImage
        
        return logoView
    }()
    
    private lazy var inventoryButton: UIButton = {
        let inventoryButton = UIButton(type: .custom)
        inventoryButton.translatesAutoresizingMaskIntoConstraints = false
        let inventoryButtonImage = UIImage(named: "button_library")
        inventoryButton.setImage(inventoryButtonImage, for: .normal)
        inventoryButton.contentMode = .scaleAspectFit
        inventoryButton.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        inventoryButton.tag = 1
        return inventoryButton
    }()
    
    private lazy var dictionaryButton: UIButton = {
        let dictionaryButton = UIButton(type: .custom)
        dictionaryButton.translatesAutoresizingMaskIntoConstraints = false
        let dictionaryImage = UIImage(named: "button_dictionary")
        dictionaryButton.setImage(dictionaryImage, for: .normal)
        dictionaryButton.contentMode = .scaleAspectFit
        dictionaryButton.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        dictionaryButton.tag = 2
        return dictionaryButton
    }()
    
    private lazy var configurationButton: UIButton = {
        let configurationButton = UIButton(type: .custom)
        configurationButton.translatesAutoresizingMaskIntoConstraints = false
        let configurationImage = UIImage(named: "button_settings")
        configurationButton.setImage(configurationImage, for: .normal)
        configurationButton.contentMode = .scaleAspectFit
        configurationButton.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        configurationButton.tag = 3
        return configurationButton
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
    
    private lazy var configViewController: ConfigViewController = {
        return ConfigViewController()
    }()
    
    private lazy var regionSelectionViewController: RegionSelectionViewController = {
        return RegionSelectionViewController()
    }()
    
    private lazy var dictionaryViewController: DictionaryViewController = {
        return DictionaryViewController()
    }()
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        super.viewWillDisappear(animated)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllerModel()
    }
    
    @objc
    private func didButton(_ sender: UIButton!) {
        switch sender.tag {
        case 1:
            navigationController?.pushViewController(regionSelectionViewController, animated: true)
        case 2:
            navigationController?.pushViewController(dictionaryViewController, animated: true)
        case 3:
            navigationController?.pushViewController(configViewController, animated: true)
        default:
            return
        }
    }
}

extension MenuViewController: ViewControllerModel {
    func addSubviews() {
        view.backgroundColor = .purple
        addChild(carouselMenuComponent)
        
        view.addSubview(carouselMenuComponent.view)
        view.addSubview(logoView)
        view.addSubview(inventoryButton)
        view.addSubview(dictionaryButton)
        view.addSubview(configurationButton)
    }
    
    func addStyle() {
        // Adicione qualquer estilo necessário aqui
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.16),
            logoView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height * 0.74),
            logoView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            logoView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: logoWidthPercentage),
            logoView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: logoHeightPercentage),
            
            //INVENTORY
            inventoryButton.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.78),
            inventoryButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height * 0.14),
            inventoryButton.leadingAnchor.constraint(equalTo: logoView.leadingAnchor),
            
            inventoryButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: buttonsWidthPercentage),
            inventoryButton.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: buttonsHeightPercentage),
            
            //DICTIONARY
            dictionaryButton.topAnchor.constraint(equalTo:  inventoryButton.topAnchor),
            dictionaryButton.bottomAnchor.constraint(equalTo: inventoryButton.bottomAnchor),
            dictionaryButton.leadingAnchor.constraint(equalTo: inventoryButton.trailingAnchor, constant: 5),
            
            dictionaryButton.widthAnchor.constraint(equalTo: inventoryButton.widthAnchor),
            dictionaryButton.heightAnchor.constraint(equalTo: inventoryButton.heightAnchor),
            
            //CONFIGURATION
            configurationButton.topAnchor.constraint(equalTo:  inventoryButton.topAnchor),
            configurationButton.bottomAnchor.constraint(equalTo: inventoryButton.bottomAnchor),
            configurationButton.trailingAnchor.constraint(equalTo: logoView.trailingAnchor),
            
            configurationButton.widthAnchor.constraint(equalTo: inventoryButton.widthAnchor),
            configurationButton.heightAnchor.constraint(equalTo: inventoryButton.heightAnchor),
            
            carouselMenuComponent.view.topAnchor.constraint(equalTo: view.topAnchor),
            carouselMenuComponent.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            carouselMenuComponent.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            carouselMenuComponent.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
}

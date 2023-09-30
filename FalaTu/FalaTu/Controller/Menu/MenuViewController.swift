//
//  ViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 18/09/23.
//

import UIKit

// Main viewController
class MenuViewController: UIViewController {
    
    /// Essa é a view que eu fiz
//    private lazy var homePage: HomePageButtons = {
//        return HomePageButtons()
//    }()
    
    private lazy var homeButton: UIButton = {
        let inventoryButton = UIButton(type: .custom)
        inventoryButton.translatesAutoresizingMaskIntoConstraints = false
        let inventoryButtonImage = UIImage(named: "button_library")
        inventoryButton.setImage(inventoryButtonImage, for: .normal)
        inventoryButton.contentMode = .scaleAspectFit
        inventoryButton.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        inventoryButton.tag = 1
        return inventoryButton
    }()
    
    /// View que o Gustavo fez, a carrossel
    private lazy var carouselMenuComponent: CarouselMenuComponent = {
        let view = CarouselMenuComponent()
        view.view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    /// Button que leva para a view de perfis
    private lazy var myButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        return button
    }()
    
    /// View de perfis
    private lazy var perfilViewController: PerfilViewController = {
        return PerfilViewController()
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
        navigationController?.pushViewController(perfilViewController, animated: true)
        switch sender.tag {
        case 1:
            navigationController?.pushViewController(perfilViewController, animated: true)
        default:
            return
        }
    }
}

extension MenuViewController: ViewControllerModel {
    func addSubviews() {
//        addChild(homePage)
        addChild(carouselMenuComponent)
        
        view.addSubview(homeButton)
        view.addSubview(myButton)
        view.addSubview(carouselMenuComponent.view)
//        view.addSubview(homePage.view) // Adicione a homePage.view por último
        
        // Defina a interação para a carouselMenuComponent como verdadeira
        carouselMenuComponent.view.isUserInteractionEnabled = true
    }
    
    func addStyle() {
        // Adicione qualquer estilo necessário aqui
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            // homeButton
            homeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            
            // homePage.view
//            homePage.view.topAnchor.constraint(equalTo: view.topAnchor),
//            homePage.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
//            homePage.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            homePage.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // myButton
            myButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
    }
}

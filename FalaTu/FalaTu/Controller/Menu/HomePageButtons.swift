//
//  HomePage.swift
//  FalaTu
//
//  Created by Giovanni Favorin de Melo on 28/09/23.
//

import Foundation
import UIKit

class HomePageButtons: UIViewController {
    
    @objc func inventoryButtonTapped(_ sender: UIButton!) {
        // Navegue para a visualização de inventário
        print("Clicou")
    }

    @objc func dictionaryButtonTapped(_ sender: UIButton!) {
        // Navegue para a visualização de dicionário
        print("Clicou")
    }

    @objc func configurationButtonTapped(_ sender: UIButton!) {
        // Navegue para a visualização de configurações
        print("Clicou")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        
        // Size Screen
//        let screenWidth = UIScreen.main.bounds.width
//        let screenHeight = UIScreen.main.bounds.height
        
        // =========  USER BUTTON =========
        let userButtonImage = UIImage(named: "button_profile")
        
        let userButtonView = UIImageView()
        userButtonView.translatesAutoresizingMaskIntoConstraints = false
        userButtonView.contentMode = .scaleAspectFit
        userButtonView.image = userButtonImage
        
        //Proportions
        
        
        // =========  LOGO =========
        let logoImage = UIImage(named: "game_logo")
        
        let logoView = UIImageView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.contentMode = .scaleAspectFit
        logoView.image = logoImage
        
        //Proportions
        let logoWidthPercentage: CGFloat = 0.48
        let logoHeightPercentage: CGFloat = 0.058
        
        // ========= INVENTORY BUTTON =========
        let inventoryButton = UIButton()
        inventoryButton.translatesAutoresizingMaskIntoConstraints = false
        let inventoryButtonImage = UIImage(named: "button_library")
        inventoryButton.setImage(inventoryButtonImage, for: .normal)
        inventoryButton.contentMode = .scaleAspectFit
        inventoryButton.addTarget(self, action: #selector(inventoryButtonTapped), for: .touchUpInside)

        //Proportions
        let buttonsWidthPercentage: CGFloat = 0.15
        let buttonsHeightPercentage: CGFloat = 0.06

        // ========= DICTIONARY BUTTON =========
        let dictionaryButton = UIButton()
        dictionaryButton.translatesAutoresizingMaskIntoConstraints = false
        let dictionaryButtonImage = UIImage(named: "button_dictionary")
        dictionaryButton.setImage(dictionaryButtonImage, for: .normal)
        dictionaryButton.contentMode = .scaleAspectFit
        dictionaryButton.addTarget(self, action: #selector(dictionaryButtonTapped), for: .touchUpInside)

        // ========= CONFIGURATION BUTTON =========
        let configurationButton = UIButton()
        configurationButton.translatesAutoresizingMaskIntoConstraints = false
        let configurationButtonImage = UIImage(named: "button_settings")
        configurationButton.setImage(configurationButtonImage, for: .normal)
        configurationButton.contentMode = .scaleAspectFit
        configurationButton.addTarget(self, action: #selector(configurationButtonTapped), for: .touchUpInside)
        
        // ========= ADDING VIEW =========
        view.addSubview(logoView)
        view.addSubview(inventoryButton)
        view.addSubview(dictionaryButton)
        view.addSubview(configurationButton)
        
        // ========= CONSTRAINTS =========
        NSLayoutConstraint.activate([
            //LOGO
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
        ])
    }
}

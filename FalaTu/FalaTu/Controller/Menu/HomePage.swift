//
//  HomePage.swift
//  FalaTu
//
//  Created by Giovanni Favorin de Melo on 28/09/23.
//

import Foundation
import UIKit

class HomePage: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        
        // ========= STACK =========
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        // ========= HORIZONTAL STACK =========
        let horizontalStack = UIStackView()
        horizontalStack.axis = .horizontal
        horizontalStack.alignment = .center
        horizontalStack.spacing = 27
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        
        // Size Screen
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        // =========  USER BUTTON =========
        let userButtonImage = UIImage(named: "button_profile")
        
        let userButtonView = UIImageView()
        userButtonView.translatesAutoresizingMaskIntoConstraints = false
        userButtonView.contentMode = .scaleAspectFit
        userButtonView.image = userButtonImage
        
        //Proportions
        
        
        // =========  LOGO =========
        let logoView = UIImage(named: "game_logo")
        
        let logoImageView = UIImageView()
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.contentMode = .scaleAspectFit
        logoImageView.image = logoView
        
        //Proportions
        let logoWidthPercentage: CGFloat = 0.48
        let logoHeightPercentage: CGFloat = 0.058
        
        // ========= CARROSSEL =========
        let carouselView = UIImage(named: "Banner_palavradodia")
        
        let carouselImageView = UIImageView()
        carouselImageView.translatesAutoresizingMaskIntoConstraints = false
        
        carouselImageView.image = carouselView
        carouselImageView.contentMode = .scaleAspectFit
        
        let carouselwidthPercentage: CGFloat = 0.59
        let carouselHeightPercentage: CGFloat = 0.27
        
        // ========= BUTTON PLAY =========
        let buttonPlayImage = UIImage(named: "button_play")
        
        let buttonPlayImageView = UIImageView()
        buttonPlayImageView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonPlayImageView.image = buttonPlayImage
        buttonPlayImageView.contentMode = .scaleAspectFit
        
        //Proportions
        let buttonPlayWidthPercentage: CGFloat = 0.59
        let buttonPlayHeightPercentage: CGFloat = 0.06
        
        // ========= DIVIDER =========
        
        let dividerView = UIView()
        dividerView.backgroundColor = .black
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Define o raio do canto para criar o retângulo arredondado
        dividerView.layer.cornerRadius = 2.5
        dividerView.contentMode = .scaleAspectFit
        
        //Proportions
        let dividerWidthPercentage: CGFloat = 0.59
        let dividerHeightPercentage: CGFloat = 0.007
        
        // ========= INVENTORY BUTTON =========
        let inventoryButtonImage = UIImage(named: "button_library")
        
        let inventoryButtonView = UIImageView()
        inventoryButtonView.translatesAutoresizingMaskIntoConstraints = false
        
        inventoryButtonView.image = inventoryButtonImage
        inventoryButtonView.contentMode = .scaleAspectFit
        
        //Proportions
        let inventoryWidthPercentage: CGFloat = 0.15
        let inventoryHeightPercentage: CGFloat = 0.07
        
        // ========= DICTIONARY BUTTON =========
        let dictionaryButtonImage = UIImage(named: "button_dictionary")
        
        let dictionaryButtonView = UIImageView()
        dictionaryButtonView.translatesAutoresizingMaskIntoConstraints = false
        
        dictionaryButtonView.image = dictionaryButtonImage
        dictionaryButtonView.contentMode = .scaleAspectFit
        
        // ========= CONFIGURATION BUTTON =========
        let configurationButtonImage = UIImage(named: "button_settings")
        
        let configurationButtonView = UIImageView()
        configurationButtonView.translatesAutoresizingMaskIntoConstraints = false
        
        configurationButtonView.image = configurationButtonImage
        configurationButtonView.contentMode = .scaleAspectFit
        
        horizontalStack.addArrangedSubview(inventoryButtonView)
        horizontalStack.addArrangedSubview(dictionaryButtonView)
        horizontalStack.addArrangedSubview(configurationButtonView)
        
        stackView.addArrangedSubview(logoImageView)
        stackView.addArrangedSubview(carouselImageView)
        stackView.addArrangedSubview(buttonPlayImageView)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(horizontalStack)
        
        stackView.setCustomSpacing(36, after: logoImageView)
        stackView.setCustomSpacing(25, after: carouselImageView)
        stackView.setCustomSpacing(66, after: buttonPlayImageView)
        stackView.setCustomSpacing(27, after: dividerView)
        
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: screenHeight * 0.17),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Proporçoes da logo
            logoImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: logoWidthPercentage),
            logoImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: logoHeightPercentage),
            
            // Proporçoes do carrossel
            carouselImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: carouselwidthPercentage),
            carouselImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: carouselHeightPercentage),
            
            // Proporcoes do botao de play
            buttonPlayImageView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: carouselwidthPercentage),
            buttonPlayImageView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: buttonPlayHeightPercentage),
            
            // Proporçoes da divider
            dividerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: carouselwidthPercentage),
            dividerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: dividerHeightPercentage),
            
            // Proporçoes dos buttons
            inventoryButtonView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: inventoryWidthPercentage),
            inventoryButtonView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: inventoryHeightPercentage),
            
            dictionaryButtonView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: inventoryWidthPercentage),
            dictionaryButtonView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: inventoryHeightPercentage),
            
            configurationButtonView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: inventoryWidthPercentage),
            configurationButtonView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: inventoryHeightPercentage),
        ])
    }
}

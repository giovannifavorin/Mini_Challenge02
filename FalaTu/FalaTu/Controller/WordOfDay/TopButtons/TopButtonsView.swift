//
//  TopButtonsViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 28/09/23.
//

import Foundation
import UIKit

class TopButtonsViewController: UIViewController {
    
    // Exit Button
    let exitButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray2
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        button.layer.cornerRadius = 20 // Metade da largura (ou altura) para torná-lo circular
        // Adicione ação conforme necessário
        // button.addTarget(self, action: #selector(exitButtonTapped), for: .touchUpInside)
        return button
    }()

    // Tutorial Button
    let tutorialButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        button.layer.cornerRadius = 20 // Metade da largura (ou altura) para torná-lo circular
        // Adicione ação conforme necessário
        // button.addTarget(self, action: #selector(tutorialButtonTapped), for: .touchUpInside)
        return button
    }()

    // Config Button
    let configButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemGray2
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalTo: button.widthAnchor).isActive = true
        button.layer.cornerRadius = 20 // Metade da largura (ou altura) para torná-lo circular
        // Adicione ação conforme necessário
        // button.addTarget(self, action: #selector(configButtonTapped), for: .touchUpInside)
        return button
    }()

        

    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllerModel()
    }
}

extension TopButtonsViewController: ViewControllerModel{
    
    func addSubviews() {
        view.addSubview(exitButton)
        //view.addSubview(tutorialButton)
        //view.addSubview(configButton)
    }
    
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            
            exitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            
            //tutorialButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 20),
            
            //configButton.leadingAnchor.constraint(equalTo: tutorialButton.trailingAnchor, constant: 8),
            
            
        ])
    }

    
    func addStyle() {
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
}

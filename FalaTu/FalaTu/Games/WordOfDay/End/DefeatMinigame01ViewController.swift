//
//  DefeatMinigame01ViewController.swift
//  FalaTu
//
//  Created by Giovanni Favorin de Melo on 04/10/23.
//

import UIKit

class DefeatMinigame01ViewController: UIViewController {

    private lazy var background: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "pattern")
        background.translatesAutoresizingMaskIntoConstraints = false
        background.contentMode = .scaleToFill // Configurar contentMode
        return background
    }()
    
    private lazy var scoreBoardBackground: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "DefeatScoreboard")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "button_share"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "button_backmenu"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        button.tag = 2
        return button
    }()
    
    // Crie uma stack view horizontal
    private lazy var buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 20 // Espaçamento entre os botões
        return buttonStackView
    }()
    
    
    @objc private func didButton(_ sender: UIButton!) {
        switch sender.tag {
        case 1:
            print("clico 1")
        case 2:
            print("clico 2")
        default:
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundColor")

        // Adicione os botões à stack view
        buttonStackView.addArrangedSubview(shareButton)
        buttonStackView.addArrangedSubview(backButton)
        
        // Adicione a UIImageView à hierarquia de visualização
        view.addSubview(background)
        view.addSubview(scoreBoardBackground)
        view.addSubview(buttonStackView)
        // Configure as restrições para preencher a tela inteira
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            scoreBoardBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.height * 0.1),
            scoreBoardBackground.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -view.frame.height * 0.1),
        ])
    }

}

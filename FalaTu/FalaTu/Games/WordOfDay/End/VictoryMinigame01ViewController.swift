//
//  VictoryMinigame01ViewController.swift
//  FalaTu
//
//  Created by Giovanni Favorin de Melo on 04/10/23.
//

import UIKit

class VictoryMinigame01ViewController: UIViewController {

    private lazy var background: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "pattern")
        background.translatesAutoresizingMaskIntoConstraints = false
        background.contentMode = .scaleToFill // Configurar contentMode
        return background
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        // Adicione a UIImageView à hierarquia de visualização
        view.addSubview(background)
        
        // Configure as restrições para preencher a tela inteira
        NSLayoutConstraint.activate([
            background.topAnchor.constraint(equalTo: view.topAnchor),
            background.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            background.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            background.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

}

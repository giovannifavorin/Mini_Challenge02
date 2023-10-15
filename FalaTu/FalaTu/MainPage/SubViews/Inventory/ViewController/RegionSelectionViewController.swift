//
//  RegionSelectionViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 26/09/23.
//

import UIKit

class RegionSelectionViewController: UIViewController {
    
    // BG
    private lazy var imagebackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bg_home")
        image.alpha = 0.1
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // Inventário label -> título
    lazy var labelInventario: UILabel = {
        let label = UILabel()
        label.text = "Inventário"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 28, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Regiões brasileiras -> subtítulo
    lazy var labelRegioesBrasileiras: UILabel = {
        let label = UILabel()
        label.text = "Regiões brasileiras"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Botões representando as regiões =====================================================
    let button1: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Norte", for: .normal)
        let fontSize = UIFont.preferredFont(forTextStyle: .title3).pointSize
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        button.tintColor = .white
        button.tag = 0
        
        button.isHidden = true
        return button
    }()

    
    let button2: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Nordeste", for: .normal)
        let fontSize = UIFont.preferredFont(forTextStyle: .title3).pointSize
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        button.tintColor = .white
        button.tag = 1
        
        button.isHidden = true
        return button
    }()
    
    let button3: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Centro-Oeste", for: .normal)
        let fontSize = UIFont.preferredFont(forTextStyle: .title3).pointSize
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        button.tintColor = .white
        button.tag = 2
        
        button.isHidden = true
        return button
    }()
    
    let button4: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sudeste", for: .normal)
        let fontSize = UIFont.preferredFont(forTextStyle: .title3).pointSize
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        button.tintColor = .white
        button.tag = 3
        
        button.isHidden = true
        return button
    }()
    
    let button5: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sul", for: .normal)
        let fontSize = UIFont.preferredFont(forTextStyle: .title3).pointSize
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: fontSize)
        button.tintColor = .white
        button.tag = 4
        
        button.isHidden = true
        return button
    }()
    
    @objc func buttonTapped(_ sender: UIButton) {
        sender.isEnabled = false
        if let assetName = assetMapping[sender.tag] {
            planetImage.image = UIImage(named: assetName)
        }
        
        UIImpactFeedbackGenerator.feedback(for: .medium)

        // Atrasa a chamada à InventoryViewController por 1 segundo
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let inventoryViewController = InventoryViewController()
            inventoryViewController.selectedRegion = regions_BR[sender.tag]
            self.navigationController?.pushViewController(inventoryViewController, animated: true)
            
            sender.isEnabled = true
            self.planetImage.image = UIImage(named: "planet")
            self.button1.isHidden = true
            self.button2.isHidden = true
            self.button3.isHidden = true
            self.button4.isHidden = true
            self.button5.isHidden = true
        }
    }
    // Botões representando as regiões =====================================================

    // Dicionário que mapeia tags de botões para nomes de assets
        let assetMapping: [Int: String] = [
            0: "brazilMapNORTE2",
            1: "brazilMapNORDESTE2",
            2: "brazilMapCENTROOESTE2",
            3: "brazilMapSUDESTE2",
            4: "brazilMapSUL2"
        ]
    
    private lazy var planetImage: UIImageView = {
        let brazilImage = UIImageView()
        brazilImage.translatesAutoresizingMaskIntoConstraints = false
        brazilImage.contentMode = .scaleAspectFit
        brazilImage.image = UIImage(named: "planet")
        return brazilImage
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
        navigationController?.popToRootViewController(animated: true)
        self.addHapticFeedbackFromViewController(type: .error)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllerModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Troca o asset de fundo após 0.5s
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            UIView.transition(with: self.planetImage,
                              duration: 0.5,
                              options: .transitionCrossDissolve,
                              animations: { self.planetImage.image = UIImage(named: "brazilMap2") },
                              completion: { _ in
                                  // Após a troca da imagem, mostra os botões com animação de flip
                                  UIView.transition(with: self.view,
                                                    duration: 0.5,
                                                    options: .transitionCrossDissolve,
                                                    animations: {
                                                        self.button1.isHidden = false
                                                        self.button2.isHidden = false
                                                        self.button3.isHidden = false
                                                        self.button4.isHidden = false
                                                        self.button5.isHidden = false }, completion: nil)
                              })
            
        }
        
    }


}

extension RegionSelectionViewController: ViewControllerModel {
    
    func addConstraints() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            constrains_iPad()
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            constrains_iPhone()
        }
    }
    
    func addSubviews() {
        view.addSubview(imagebackground) // BG
        view.addSubview(planetImage) // Imagem planeta
        view.addSubview(buttonBack) // Botão de back
        view.addSubview(labelInventario) // Título
        view.addSubview(labelRegioesBrasileiras) // Subtítulo
        
        view.addSubview(button1)
        button1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)

        view.addSubview(button2)
        button2.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        view.addSubview(button3)
        button3.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        view.addSubview(button4)
        button4.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        view.addSubview(button5)
        button5.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
    }
    
    func addStyle() {
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
}

extension RegionSelectionViewController {
    
    private func constrains_iPad() {
        print("Constrains_iPad")
        
        NSLayoutConstraint.activate([
            // Background
            imagebackground.topAnchor.constraint(equalTo: view.topAnchor),
            imagebackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imagebackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imagebackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Planeta
            planetImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            planetImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            planetImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Botão 1 - Norte
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -70),
            button1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -110),
            
            // Botão 2 - Nordeste
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 160),
            button2.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -50),
            
            // Botão 3 - Centro-Oeste
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 20),
            button3.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 40),
            
            // Botão 4 - Sudeste
            button4.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 120),
            button4.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 90),
            
            // Botão 5 - Sul
            button5.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 30),
            button5.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 180),
            
            // TÍTULO
            labelInventario.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            labelInventario.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // SUBTÍTULO
            labelRegioesBrasileiras.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelRegioesBrasileiras.topAnchor.constraint(equalTo: labelInventario.bottomAnchor, constant: 10), // Espaçamento entre título e subtítulo
            
            // Botão de sair
            buttonBack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            buttonBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
    
    private func constrains_iPhone() {
        print("Constrains_iPhone")
        NSLayoutConstraint.activate([
            // Background
            imagebackground.topAnchor.constraint(equalTo: view.topAnchor),
            imagebackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imagebackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imagebackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Planeta
            planetImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            planetImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            planetImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            // Botão 1 - Norte
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -50),
            button1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -80),
            
            // Botão 2 - Nordeste
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 115),
            button2.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -35),
            
            // Botão 3 - Centro-Oeste
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 5),
            button3.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 20),

            // Botão 4 - Sudeste
            button4.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 70),
            button4.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 65),
            
            // Botão 5 - Sul
            button5.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 10),
            button5.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 130),
            
            // TÍTULO
            labelInventario.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            labelInventario.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            // SUBTÍTULO
            labelRegioesBrasileiras.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelRegioesBrasileiras.topAnchor.constraint(equalTo: labelInventario.bottomAnchor), // Espaçamento entre título e subtítulo
        ])
        
        // Botão de sair
        NSLayoutConstraint.activate([
            buttonBack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            buttonBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
}

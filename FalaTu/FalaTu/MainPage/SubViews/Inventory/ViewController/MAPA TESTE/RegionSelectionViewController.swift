//
//  RegionSelectionViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 26/09/23.
//

import UIKit

class RegionSelectionViewController: UIViewController {
    
    // Botões representando as regiões =====================================================
    let button1: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Norte", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.tintColor = .white
        button.tag = 0
        return button
    }()
    
    let button2: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Nordeste", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.tintColor = .white
        button.tag = 1
        return button
    }()
    
    let button3: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Centro-Oeste", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 14)
        button.tintColor = .white
        button.tag = 2
        return button
    }()
    
    let button4: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sudeste", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.tintColor = .white
        button.tag = 3
        return button
    }()
    
    let button5: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Sul", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.tintColor = .white
        button.tag = 4
        return button
    }()
    
    @objc func buttonTapped(_ sender: UIButton) {
        if let assetName = assetMapping[sender.tag] {
            brazilImage.image = UIImage(named: assetName)
        }
        
        // Atrasa a chamada à InventoryViewController por 1 segundo
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let inventoryViewController = InventoryViewController()
            inventoryViewController.selectedRegion = regions_BR[sender.tag]
            self.navigationController?.pushViewController(inventoryViewController, animated: true)
        }
    }
    // Botões representando as regiões =====================================================

    // Dicionário que mapeia tags de botões para nomes de assets
        let assetMapping: [Int: String] = [
            0: "brazilMapNORTE",
            1: "brazilMapNORDESTE",
            2: "brazilMapCENTROOESTE",
            3: "brazilMapSUDESTE",
            4: "brazilMapSUL"
        ]
    
    private lazy var brazilImage: UIImageView = {
        let brazilImage = UIImageView()
        brazilImage.image = UIImage(named: "brazilMap")
        brazilImage.translatesAutoresizingMaskIntoConstraints = false
        brazilImage.contentMode = .scaleAspectFit
        return brazilImage
    }()
    
    private lazy var planetImage: UIImageView = {
        let brazilImage = UIImageView()
        brazilImage.image = UIImage(named: "planet")
        brazilImage.translatesAutoresizingMaskIntoConstraints = false
        brazilImage.contentMode = .scaleAspectFit
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
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllerModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Restaurando a imagem do Brasil
        brazilImage.image = UIImage(named: "brazilMap")
    }
}

extension RegionSelectionViewController: ViewControllerModel {
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            // Mapa do Brasil
            brazilImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            brazilImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            brazilImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            // Planeta
            planetImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            planetImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            planetImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            // Botão 1 - Norte
            button1.topAnchor.constraint(equalTo: brazilImage.topAnchor, constant: 60),
            button1.leadingAnchor.constraint(equalTo: brazilImage.leadingAnchor, constant: 100),
            
            // Botão 2 - Nordeste
            button2.topAnchor.constraint(equalTo: brazilImage.topAnchor, constant: 100),
            button2.leadingAnchor.constraint(equalTo: brazilImage.leadingAnchor, constant: 230),
            
            // Botão 3 - Centro-Oeste
            button3.topAnchor.constraint(equalTo: brazilImage.topAnchor, constant: 170),
            button3.leadingAnchor.constraint(equalTo: brazilImage.leadingAnchor, constant: 130),
            
            // Botão 4 - Sudeste
            button4.topAnchor.constraint(equalTo: brazilImage.topAnchor, constant: 200),
            button4.leadingAnchor.constraint(equalTo: brazilImage.leadingAnchor, constant: 200),
            
            // Botão 5 - Sul
            button5.topAnchor.constraint(equalTo: brazilImage.topAnchor, constant: 270),
            button5.leadingAnchor.constraint(equalTo: brazilImage.leadingAnchor, constant: 160)
        ])
        
        // Botão de sair
        NSLayoutConstraint.activate([
            buttonBack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            buttonBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        ])
    }
    
    func addSubviews() {
        view.addSubview(planetImage)
        view.addSubview(brazilImage)
        view.addSubview(buttonBack)

        
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

//
//  RegionSelectionViewControllerTeste.swift
//  FalaTu
//
//  Created by Leonardo Mota on 10/10/23.
//

import UIKit

class RegionSelectionViewControllerTeste: UIViewController {
    
    // Botões representando as regiões
    let button1: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Norte", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    let button2: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Nordeste", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    let button3: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Centro-Oeste", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.tag = 2
        return button
    }()
    
    let button4: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sudeste", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.tag = 3
        return button
    }()
    
    let button5: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sul", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button.tag = 4
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllerModel()
    }
    
    
    @objc func buttonTapped(_ sender: UIButton) {
        let inventoryViewController = InventoryViewController()
        inventoryViewController.selectedRegion = regions_BR[sender.tag]
        navigationController?.pushViewController(inventoryViewController, animated: true)
    }
}

extension RegionSelectionViewControllerTeste: ViewControllerModel {
    func addSubviews() {
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(button4)
        view.addSubview(button5)
    }
    
    func addStyle() {
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    func addConstraints() {
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        button4.translatesAutoresizingMaskIntoConstraints = false
        button5.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 50),
            
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 50),
            
            button4.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button4.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 50),
            
            button5.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button5.topAnchor.constraint(equalTo: button4.bottomAnchor, constant: 50)
        ])
    }
}


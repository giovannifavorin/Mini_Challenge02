//
//  ConfigViewController.swift
//  FalaTu
//
//  Created by Victor Assis on 25/09/23.
//

import UIKit

class ConfigViewController: UIViewController {

    var titles: String = "Como Jogar?"
    let toggleSwitch1 = UISwitch()
    let toggleSwitch2 = UISwitch()
    let toggleSwitch3 = UISwitch()
    let toggleSwitch4 = UISwitch()
    let buttonCR = UIButton()
    let dividerView = UIView() // Adicione a view da barra
    let stackView = UIStackView() // Adicione o stack view

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = titles
        navigationController?.navigationBar.prefersLargeTitles = true

        // Configurar os UISwitches e o botão
        configureToggle(toggleSwitch1, title: "Toggle 1", initialStatus: false, selector: #selector(switch1ValueChanged(_:)))
        configureToggle(toggleSwitch2, title: "Toggle 2", initialStatus: false, selector: #selector(switch2ValueChanged(_:)))
        configureToggle(toggleSwitch3, title: "Toggle 3", initialStatus: false, selector: #selector(switch3ValueChanged(_:)))
        configureToggle(toggleSwitch4, title: "Toggle 4", initialStatus: false, selector: #selector(switch4ValueChanged(_:)))
        setupButton() // Adicione o botão à vista

        // Adicione a barra divisora
        configureDivider()
        
        // Posicionar os UISwitches, as barras e o título no stack view
        configureStackView()
    }

    func configureToggle(_ toggle: UISwitch, title: String, initialStatus: Bool, selector: Selector) {
        toggle.isOn = initialStatus
        toggle.addTarget(self, action: selector, for: .valueChanged)
    }

    @objc func switch1ValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("Toggle 1 ativado")
        } else {
            print("Toggle 1 desativado")
        }
    }

    @objc func switch2ValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("Toggle 2 ativado")
        } else {
            print("Toggle 2 desativado")
        }
    }

    @objc func switch3ValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("Toggle 3 ativado")
        } else {
            print("Toggle 3 desativado")
        }
    }
    
    @objc func switch4ValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            print("Toggle 4 ativado")
        } else {
            print("Toggle 4 desativado")
        }
    }
    
    func setupButton() {
        view.addSubview(buttonCR)
        
        buttonCR.setTitle("Créditos", for: .normal)
        buttonCR.backgroundColor = .systemBlue
        buttonCR.layer.cornerRadius = 8
        buttonCR.addTarget(self, action: #selector(showCredits), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            buttonCR.widthAnchor.constraint(equalToConstant: 200),
            buttonCR.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureDivider() {
        dividerView.backgroundColor = .gray // Cor da barra divisora
    }
    
    func configureStackView() {
        stackView.axis = .vertical
        stackView.spacing = 20
        stackView.alignment = .center
        stackView.distribution = .fill
        
        // Adicione os elementos ao stack view
        stackView.addArrangedSubview(toggleSwitch1)
        stackView.addArrangedSubview(toggleSwitch2)
        stackView.addArrangedSubview(dividerView)
        stackView.addArrangedSubview(toggleSwitch3)
        stackView.addArrangedSubview(toggleSwitch4)
        stackView.addArrangedSubview(buttonCR)
        
        // Adicione o stack view à vista
        view.addSubview(stackView)
        
        // Configure as restrições do stack view
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Crie as barras arredondadas
        createRoundedBars()
    }
    
    func createRoundedBars() {
        let bar1 = createRoundedBar()
        let bar2 = createRoundedBar()
        
        stackView.addArrangedSubview(bar1)
        stackView.addArrangedSubview(bar2)
    }
    
    func createRoundedBar() -> UIView {
        let roundedBar = UIView()
        roundedBar.backgroundColor = .black
        roundedBar.translatesAutoresizingMaskIntoConstraints = false
        roundedBar.heightAnchor.constraint(equalToConstant: 5).isActive = true
        roundedBar.widthAnchor.constraint(equalToConstant: 200).isActive = true
        roundedBar.layer.cornerRadius = 2.5
        
        return roundedBar
    }
    
    @objc func showCredits() {
        // Implemente a lógica para mostrar os créditos quando o botão for tocado
        print("Botão Créditos tocado")
    }
}


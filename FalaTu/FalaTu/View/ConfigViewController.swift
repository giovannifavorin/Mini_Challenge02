//
//  ConfigViewController.swift
//  FalaTu
//
//  Created by Victor Assis on 22/09/23.
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
    let roundedView = UIView()

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
        
        // Posicionar os UISwitches e a barra na vista
        positionTogglesAndDivider()
        makeDivider()
    }

    func configureToggle(_ toggle: UISwitch, title: String, initialStatus: Bool, selector: Selector) {
        toggle.isOn = initialStatus
        toggle.addTarget(self, action: selector, for: .valueChanged)
        view.addSubview(toggle)
    }

    func positionTogglesAndDivider() {
        let toggleWidth: CGFloat = 100
        let toggleHeight: CGFloat = 30
        let spacing: CGFloat = 20
        let startY: CGFloat = 200

        // Posicione os UISwitches na vista
        toggleSwitch1.frame = CGRect(x: (view.frame.width - toggleWidth) / 2, y: startY, width: toggleWidth, height: toggleHeight)
        toggleSwitch2.frame = CGRect(x: (view.frame.width - toggleWidth) / 2, y: startY + toggleHeight + spacing, width: toggleWidth, height: toggleHeight)
        toggleSwitch3.frame = CGRect(x: (view.frame.width - toggleWidth) / 2, y: startY + 2 * (toggleHeight + spacing), width: toggleWidth, height: toggleHeight)
        toggleSwitch4.frame = CGRect(x: (view.frame.width - toggleWidth) / 2, y: startY + 3 * (toggleHeight + spacing), width: toggleWidth, height: toggleHeight)

        // Posicione a barra divisora
        //dividerView.frame = CGRect(x: 0, y: startY + 2 * (toggleHeight + spacing), width: view.frame.width, height: 2)
        /*NSLayoutConstraint.activate([
            dividerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            dividerView.widthAnchor.constraint(equalToConstant: 100)
        ])*/
        roundedView.frame = CGRect(x: 48, y: Int(startY) + 90, width: 270, height: 3)
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
        
        buttonCR.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            buttonCR.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonCR.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            buttonCR.widthAnchor.constraint(equalToConstant: 200),
            buttonCR.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureDivider() {
        dividerView.backgroundColor = .gray // Cor da barra divisora
        view.addSubview(dividerView)
    }
    
    func makeDivider(){
        roundedView.backgroundColor = .black
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        
        // Define o raio do canto para criar o retângulo arredondado
        roundedView.layer.cornerRadius = 2.5
        view.addSubview(roundedView)
    }
    
    @objc func showCredits() {
        // Implemente a lógica para mostrar os créditos quando o botão for tocado
        print("Botão Créditos tocado")
    }
}



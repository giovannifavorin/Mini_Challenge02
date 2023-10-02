//
//  ConfigViewController.swift
//  FalaTu
//
//  Created by Victor Assis on 25/09/23.
//

import UIKit

class ConfigViewController: UIViewController {

    var titles: String = "Como Jogar?"
    let soundToggle = UISwitch()
    let vibrationToggle = UISwitch()
    let darkModeToggle = UISwitch()
    let colorBlindModeToggle = UISwitch()
    let creditsButton = UIButton()
    let dividerView = UIView() // Adicione a view da barra
    let creditView: CreditView = CreditView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = titles
        navigationController?.navigationBar.prefersLargeTitles = true

        // Configurar os UISwitches e o botão
        configureToggle(soundToggle, title: "Toggle 1", initialStatus: false, selector: #selector(switch1ValueChanged(_:)))
        configureToggle(vibrationToggle, title: "Toggle 2", initialStatus: false, selector: #selector(switch2ValueChanged(_:)))
        configureToggle(darkModeToggle, title: "Toggle 3", initialStatus: false, selector: #selector(switch3ValueChanged(_:)))
        configureToggle(colorBlindModeToggle, title: "Toggle 4", initialStatus: false, selector: #selector(switch4ValueChanged(_:)))
        setupButton() // Adicione o botão à vista

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
        view.addSubview(creditsButton)
        
        creditsButton.setTitle("Créditos", for: .normal)
        creditsButton.backgroundColor = .systemBlue
        creditsButton.layer.cornerRadius = 8
        creditsButton.addTarget(self, action: #selector(showCredits), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            creditsButton.widthAnchor.constraint(equalToConstant: 200),
            creditsButton.heightAnchor.constraint(equalToConstant: 50)
        ])
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
        navigationController?.pushViewController(creditView, animated: true)
    }
}


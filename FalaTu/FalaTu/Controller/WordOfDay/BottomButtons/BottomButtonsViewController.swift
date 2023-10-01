//
//  BottomButtonsViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 29/09/23.
//

import Foundation
import UIKit

class BottomButtonsViewController: UIViewController {
    


    // Crie uma stack horizontal para os botões
    let buttonStackView : UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .center
        buttonStackView.distribution = .equalSpacing
        buttonStackView.spacing = 16 // Espaçamento entre os botões na stack
        return buttonStackView
    }()
            

        // Crie e adicione os botões à stack
    let tipButton: UIButton = {
        let button1 = UIButton()
        button1.setImage(UIImage(named: "TipButton"), for: .normal)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.widthAnchor.constraint(equalToConstant: 52).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 52).isActive = true
        return button1
    }()
       

    let sendButton: UIButton = {
        let button2 = UIButton()
        button2.setImage(UIImage(named: "SendButton"), for: .normal)
        button2.translatesAutoresizingMaskIntoConstraints = false
        return button2
    }()
        
    
    let giveLetterButton: UIButton = {
        let button3 = UIButton()
        button3.setImage(UIImage(named: "GiveLetterButton"), for: .normal)
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.widthAnchor.constraint(equalToConstant: 52).isActive = true
        button3.heightAnchor.constraint(equalToConstant: 52).isActive = true
        return button3
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllerModel()
    }
}

extension BottomButtonsViewController: ViewControllerModel{
    
    func addSubviews() {
        view.addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(tipButton)
        buttonStackView.addArrangedSubview(sendButton)
        buttonStackView.addArrangedSubview(giveLetterButton)
    }
    
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            
            buttonStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            view.topAnchor.constraint(equalTo: tipButton.topAnchor),
        ])
    }

    
    func addStyle() {
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
}

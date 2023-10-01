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
        let button1 = UIButton(type: .custom)
        button1.setImage(UIImage(named: "ExitButton"), for: .normal)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button1
    }()

    // Tutorial Button
    let tutorialButton: UIButton = {
        let button2 = UIButton(type: .custom)
        button2.setImage(UIImage(named: "TutorialButton"), for: .normal)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button2
    }()

    // Config Button
    let configButton: UIButton = {
        let button3 = UIButton(type: .custom)
        button3.setImage(UIImage(named: "ConfigButton"), for: .normal)
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button3
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllerModel()
    }
}

extension TopButtonsViewController: ViewControllerModel{
    
    func addSubviews() {
        view.addSubview(exitButton)
        view.addSubview(tutorialButton)
        view.addSubview(configButton)
    }
    
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            
            exitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            tutorialButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            configButton.trailingAnchor.constraint(equalTo: tutorialButton.leadingAnchor, constant: -20),
            
            
        ])
    }

    
    func addStyle() {
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
}

//
//  TopButtonsViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 28/09/23.
//

import UIKit

class TopButtonsView: UIView {
    
    // Exit Button
    lazy var exitButton: UIButton = {
        let button1 = UIButton(type: .custom)
        button1.setImage(UIImage(named: "ExitButton"), for: .normal)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button1
    }()

    // Tutorial Button
    lazy var tutorialButton: UIButton = {
        let button2 = UIButton(type: .custom)
        button2.setImage(UIImage(named: "TutorialButton"), for: .normal)
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button2.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button2
    }()

    // Config Button
    lazy var configButton: UIButton = {
        let button3 = UIButton(type: .custom)
        button3.setImage(UIImage(named: "ConfigButton"), for: .normal)
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button3.heightAnchor.constraint(equalToConstant: 40).isActive = true
        return button3
    }()
    
    // Initializer
    init(){
        super.init(frame: .zero)
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension TopButtonsView: ViewModel {
    func addViews() {
        addSubview(exitButton)
        addSubview(tutorialButton)
        addSubview(configButton)
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            exitButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            tutorialButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            configButton.trailingAnchor.constraint(equalTo: tutorialButton.leadingAnchor, constant: -20),
        ])
    }
    
    func setupStyle() {
        backgroundColor = .clear
    }
}

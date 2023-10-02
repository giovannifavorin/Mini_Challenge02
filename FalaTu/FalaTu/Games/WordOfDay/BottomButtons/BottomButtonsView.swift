//
//  BottomButtonsView.swift
//  FalaTu
//
//  Created by Leonardo Mota on 02/10/23.
//

import UIKit

class BottomButtonsView: UIView {
    
    // Stack horizontal para os botões
    lazy var buttonStackView : UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        buttonStackView.axis = .horizontal
        buttonStackView.alignment = .center
        buttonStackView.distribution = .equalSpacing
        buttonStackView.spacing = 16 // Espaçamento entre os botões na stack
        return buttonStackView
    }()
            
    lazy var tipButton: UIButton = {
        let button1 = UIButton()
        button1.setImage(UIImage(named: "TipButton"), for: .normal)
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.widthAnchor.constraint(equalToConstant: 52).isActive = true
        button1.heightAnchor.constraint(equalToConstant: 52).isActive = true
        return button1
    }()
       
    lazy var sendButton: UIButton = {
        let button2 = UIButton()
        button2.setImage(UIImage(named: "SendButton"), for: .normal)
        button2.translatesAutoresizingMaskIntoConstraints = false
        return button2
    }()
          
    lazy var giveLetterButton: UIButton = {
        let button3 = UIButton()
        button3.setImage(UIImage(named: "GiveLetterButton"), for: .normal)
        button3.translatesAutoresizingMaskIntoConstraints = false
        button3.widthAnchor.constraint(equalToConstant: 52).isActive = true
        button3.heightAnchor.constraint(equalToConstant: 52).isActive = true
        return button3
    }()
    
    init() {
        super.init(frame: .zero)
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension BottomButtonsView: ViewModel {
    func addViews() {
        addSubview(buttonStackView)
        buttonStackView.addArrangedSubview(tipButton)
        buttonStackView.addArrangedSubview(sendButton)
        buttonStackView.addArrangedSubview(giveLetterButton)

    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            buttonStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            buttonStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
    }
    
    func setupStyle() {
    }
}

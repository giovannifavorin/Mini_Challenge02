//
//  BottomButtonsViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 29/09/23.
//

import UIKit

protocol GiveLetterDelegate: AnyObject {
    func giveLetterButtonPressed()
}

protocol BottomButtonsDelegate: AnyObject {
    func sendButtonPressed()
    func tipButtonPressed()
    
}

class BottomButtonsViewController: UIViewController {
    
    private let bottomButtonsView = BottomButtonsView()
    private let boardVC = BoardViewController()
    
    weak var delegate: BottomButtonsDelegate?
    weak var delegateLetter: GiveLetterDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllerModel()
    }
    
    @objc private func tipButtonAction(sender: UIButton) {
        delegate?.tipButtonPressed()
    }

    @objc private func sendButtonAction(sender: UIButton) {
        delegate?.sendButtonPressed()
    }


    @objc private func giveLetterButtonAction(sender: UIButton) {
        delegateLetter?.giveLetterButtonPressed()
    }
}

extension BottomButtonsViewController: ViewControllerModel {
    func addSubviews() {
        view.addSubview(bottomButtonsView)
        bottomButtonsView.translatesAutoresizingMaskIntoConstraints = false

        bottomButtonsView.tipButton.addTarget(self, action: #selector(tipButtonAction), for: .touchUpInside)
        bottomButtonsView.sendButton.addTarget(self, action: #selector(sendButtonAction), for: .touchUpInside)
        bottomButtonsView.giveLetterButton.addTarget(self, action: #selector(giveLetterButtonAction), for: .touchUpInside)
    }
    
    func addStyle() {
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            bottomButtonsView.topAnchor.constraint(equalTo: view.topAnchor),
            bottomButtonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomButtonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomButtonsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            bottomButtonsView.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}


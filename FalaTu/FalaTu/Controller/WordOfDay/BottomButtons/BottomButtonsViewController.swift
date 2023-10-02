//
//  BottomButtonsViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 29/09/23.
//

import UIKit

class BottomButtonsViewController: UIViewController {
    
    private let bottomButtonsView = BottomButtonsView()
    let minigameVC = MinigameWordDayViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllerModel()
    }
    
    @objc private func tipButtonAction(sender: UIButton) {
        print("dica POP-UP")
    }

    @objc private func sendButtonAction(sender: UIButton) {
        print("enviar")
    }

    @objc private func giveLetterButtonAction(sender: UIButton) {
        print("dar letra")
        //print(minigameVC.answer)
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


//
//  TopButtonsViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 01/10/23.
//

import UIKit



class TopButtonsViewController: UIViewController {
    
    let screenWidth = UIScreen.main.bounds.size.width

    private let topButtonsView = TopButtonsView()

     lazy var configurationViewController: ConfigurationViewController = {
          let configurationViewController = ConfigurationViewController()
          configurationViewController.modalPresentationStyle = .overFullScreen
          return configurationViewController
      }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllerModel()
    }

    @objc private func exitButtonAction(sender: UIButton) {
        print("Sair")
        navigationController?.popViewController(animated: true)
        self.addHapticFeedbackFromViewController(type: .success)

    }

    @objc private func tutorialButtonAction(sender: UIButton) {
        let vc = ModalViewController()
//        vc.modalPresentationStyle = .custom
        present(vc, animated: true)
        self.addHapticFeedbackFromViewController(type: .warning)
    }

    @objc 
    private func configButtonAction(sender: UIButton) {
       print("Configuração")
       present(configurationViewController, animated: false)
       self.addHapticFeedbackFromViewController(type: .warning)
    }
}

extension TopButtonsViewController: ViewControllerModel {
    func addSubviews() {
        view.addSubview(topButtonsView)
        topButtonsView.translatesAutoresizingMaskIntoConstraints = false
        
        topButtonsView.exitButton.addTarget(self, action: #selector(exitButtonAction), for: .touchUpInside)
        topButtonsView.tutorialButton.addTarget(self, action: #selector(tutorialButtonAction), for: .touchUpInside)
        topButtonsView.configButton.addTarget(self, action: #selector(configButtonAction), for: .touchUpInside)
    }
    
    func addStyle() {
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            topButtonsView.topAnchor.constraint(equalTo: view.topAnchor),
            topButtonsView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topButtonsView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            topButtonsView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            topButtonsView.heightAnchor.constraint(equalToConstant: screenWidth / 10)
        ])
    }
}


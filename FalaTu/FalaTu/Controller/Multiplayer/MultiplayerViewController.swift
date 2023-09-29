//
//  MultiplayerViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 24/09/23.
//

import UIKit

class MultiplayerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        setupViewControllerModel()

    }
}

extension MultiplayerViewController: ViewControllerModel{
    func addSubviews() {
        
    }
    
    func addStyle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Multiplayer"
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        
    }
    
    func addConstraints() {
        
    }
    
    
}


//
//  MinigameWordDayViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 24/09/23.
//

import UIKit

class MinigameWordDayViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        

    }
}

extension MinigameWordDayViewController: ViewControllerModel{
    func addSubviews() {
        
    }
    
    func addStyle() {
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Palavra do dia"
        view.backgroundColor = UIColor(named: "backgroundColor")

    }
    
    func addConstraints() {
        
    }
    
    
}

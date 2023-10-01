//
//  ButtonsViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 28/09/23.
//

import Foundation
import UIKit

class ButtonsViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllerModel()
    }
}

extension ButtonsViewController: ViewControllerModel{
    
    func addSubviews() {
  
    }
    
    func addStyle() {
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    
    func addConstraints() {
        NSLayoutConstraint.activate([
       
        ])
    }
}


//
//  PerfilViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 26/09/23.
//

import UIKit

class PerfilViewController: UIViewController {
    
    private lazy var perfilView: PerfilMainView = {
        return PerfilMainView()
    }()
    
    
    override func loadView() {
        self.view = perfilView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViewControllerModel()
    }

    
}


extension PerfilViewController: ViewControllerModel{
    func addSubviews() {
    }
    
    func addStyle() {
    }
    
    func addConstraints() {

    }
}

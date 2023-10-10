//
//  ConfigurationViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 09/10/23.
//

import UIKit

class ConfigurationViewController: UIViewController {

    private lazy var configPopUpView: ConfigPopUpView = {
        let view = ConfigPopUpView()
        return view
    }()
    
    override func loadView() {
        super.loadView()
        self.view = configPopUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

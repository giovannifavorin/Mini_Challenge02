//
//  PerfilViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 26/09/23.
//

import UIKit

class PerfilViewController: UIViewController {
    
    private lazy var perfilView: PerfilMainView = {
        let view = PerfilMainView()
        return view
    }()
    
    private var userRegionSelect: String?
    
    override func loadView() {
        self.view = perfilView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setupViewControllerModel()
        self.perfilView.delegateUserPreferences = self
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

extension PerfilViewController: DelegateUserPreferences{
    func configureRegionLabel(region: String) {
        print("regiao e \(region)")
    }
    
    var regionSelect: String? {
        get {
            print("valor select: \(String(describing: userRegionSelect))")
            return userRegionSelect
        }
        set {
            print("valor select: \(String(describing: userRegionSelect))")
            userRegionSelect = newValue
        }
    }
}

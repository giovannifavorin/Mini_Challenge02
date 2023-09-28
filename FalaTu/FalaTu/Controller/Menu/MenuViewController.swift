//
//  ViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 18/09/23.
//

import UIKit


//Main viewController
class MenuViewController: UIViewController {

    private lazy var colletionViewController: MenuCollectionViewController = {
        let view = MenuCollectionViewController()
        view.view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var myButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.configuration?.title = "Fulano"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        return button
    }()
    
    
    private lazy var perfilViewController: PerfilViewController = {
        return PerfilViewController()
    }()
    
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(false, animated: animated);
        super.viewWillDisappear(animated)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupViewControllerModel()
    }
    
    
    @objc
    private func didButton(_ sender: UIButton!){
        navigationController?.pushViewController(perfilViewController, animated: true)
    }
    
}


extension MenuViewController: ViewControllerModel{
    func addSubviews() {
        
        addChild(colletionViewController)
        view.addSubview(colletionViewController.view)
        colletionViewController.didMove(toParent: self)
        
        view.addSubview(myButton)
    }
    
    func addStyle() {
        
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            colletionViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            colletionViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            colletionViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            colletionViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
        NSLayoutConstraint.activate([
            myButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
        ])
    }
}



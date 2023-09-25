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
    
}


extension MenuViewController: ViewControllerModel{
    func addSubviews() {
        addChild(colletionViewController)
        view.addSubview(colletionViewController.view)
        colletionViewController.didMove(toParent: self)
    }
    
    func addStyle() {
        view.backgroundColor = UIColor(named: "backgroundColor")
//        navigationController?.isNavigationBarHidden = true
//        navigationController?.navigationBar.backIndicatorImage = UIImage(named: "button_back")
//        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(named: "button_back")
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            colletionViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            colletionViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            colletionViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            colletionViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}


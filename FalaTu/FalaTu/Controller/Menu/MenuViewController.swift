//
//  ViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 18/09/23.
//

import UIKit

//Main viewController
class MenuViewController: UIViewController {
    
    private lazy var homePage: HomePage = {
        return HomePage()
    }()
    
    private lazy var homeButton: UIButton = {
        let button = UIButton(configuration: .filled())
        button.configuration?.title = "Fulano"
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
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
        
        let dividerView = UIView()
        dividerView.backgroundColor = .black
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        
        // Define o raio do canto para criar o retângulo arredondado
        dividerView.layer.cornerRadius = 2.5
        dividerView.contentMode = .scaleAspectFit
        
        //Proportions
        let dividerWidthPercentage: CGFloat = 0.59
        let dividerHeightPercentage: CGFloat = 0.007
        
        view.addSubview(dividerView)
        
        NSLayoutConstraint.activate([
            dividerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            dividerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            dividerView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: dividerWidthPercentage),
            dividerView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: dividerHeightPercentage),
        ])
    }
    
    @objc
    private func didButton(_ sender: UIButton!){
        navigationController?.pushViewController(perfilViewController, animated: true)
        if(sender.tag == 1) {
            navigationController?.pushViewController(homePage, animated: true)
        }
    }
    
}


extension MenuViewController: ViewControllerModel{
    func addSubviews() {
        
        addChild(colletionViewController)
        view.addSubview(colletionViewController.view)
        colletionViewController.didMove(toParent: self)
        
        
        view.addSubview(homeButton)
        view.addSubview(myButton)
    }
    
    func addStyle() {
        
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            colletionViewController.view.topAnchor.constraint(equalTo: view.topAnchor),
            colletionViewController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            colletionViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            colletionViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            homeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            homeButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120),
            
            myButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            
            
        ])
    }
}



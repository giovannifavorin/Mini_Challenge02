//
//  ViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 18/09/23.
//

import UIKit

class MenuViewController: UIViewController {

    private var menuModel = [MenuDataModel]()
    
    private lazy var menuColletion: MenuColletionView = {
        return MenuColletionView()
    }()
    
    override func loadView() {
        self.view = menuColletion
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
//        view.addSubview(menuColletion)
        
        menuModel.append(.init(image: UIImage(named: "ThePedra")!, text: "jogo 1"))
        menuModel.append(.init(image: UIImage(named: "iconeMinhaFeria")!, text: "Jogo 2"))
        menuModel.append(.init(image: UIImage(named: "ThePedra")!, text: "jogo 3"))
    
        menuColletion.configureMenuCollection(with: menuModel)
        
        
      
    }
    
    
}


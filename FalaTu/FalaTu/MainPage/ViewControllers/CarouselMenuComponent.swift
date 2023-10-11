//
//  MenuCollectionViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 24/09/23.
//

import UIKit

class CarouselMenuComponent: UICollectionViewController {
    
    private var menuModel = [MenuDataModel]()
    
    // Create an instance of MenuColletionView and set its delegate
    private lazy var menuColletion: MenuColletionView = {
        let view = MenuColletionView()
        view.delegate = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func loadView() {
        // Set the view of this view controller to 'menuColletion'
        self.view = menuColletion
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call the setup method to configure the view controller
        setupViewControllerModel()
    }
}

// Extend the MenuCollectionViewController to conform to the ViewControllerModel protocol
extension CarouselMenuComponent: ViewControllerModel {
    
    // Add subviews to the 'menuColletion' view and populate 'menuModel'
    func addSubviews() {
        
        // Append data to 'menuModel' to populate the collection view
        menuModel.append(.init(image: (UIImage(named: "MinigameIcon") ?? UIImage(named: "asset"))!))
//        menuModel.append(.init(image: UIImage(named: "asset")!))

        
        // Configure the 'menuColletion' view with 'menuModel' data
        menuColletion.configureMenuCollection(with: menuModel)
    }
    
    func addStyle() {
        view.backgroundColor = .clear
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            menuColletion.topAnchor.constraint(equalTo: view.topAnchor),
            menuColletion.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            menuColletion.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            menuColletion.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}

// Extend the MenuCollectionViewController to conform to the DelegateViewModel protocol
extension CarouselMenuComponent: DelegatebuttonColletionViewModel {
    
    // Handle button taps with different 'tag' values
    func didButton(tag: Int) {
        switch tag {
            case 0:
                // Navigate to 'MinigameWordDayViewController' when tag is 0
                let minigameWordDay = MinigameWordDayViewController()
                navigationController?.pushViewController(minigameWordDay, animated: true)
            
            case 1:
                // Navigate to 'MultiplayerViewController' when tag is 1
                let multplayer = MultiplayerViewController()
                navigationController?.pushViewController(multplayer, animated: true)
            
            default:
                // Print a message for an invalid 'tag'
                print("Tag informed when creating the invalid cell, It has to be 0 -> 'Word of the Day'. 1 -> 'Multiplayer' ")
        }
    }
}


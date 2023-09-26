//
//  MenuColletionView.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 22/09/23.
//

import UIKit

class MenuColletionView: UIView {

    // Get the width and height of the screen
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.width
    
    // Delegate to handle button taps
    weak var delegate: DelegatebuttonColletionViewModel?
    
    // Data source for the collection view
    private var menuDataModel = [MenuDataModel]()
    
    // Collection view for displaying menu items
    private lazy var collectionView: UICollectionView = {
        
        // Configure collection view layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: width, height: (height/2) + 125)
        layout.minimumInteritemSpacing = 0
        
        // Create the collection view
        let colletion = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletion.register(MenuCollectioViewCell.self, forCellWithReuseIdentifier: MenuCollectioViewCell.identifier)
        colletion.backgroundColor = UIColor(named: "backgroundColor")
        colletion.delegate = self
        colletion.dataSource = self
        colletion.translatesAutoresizingMaskIntoConstraints = false
        colletion.isPagingEnabled = true
        return colletion
    }()
    
    // Initializer
    init(){
        super.init(frame: .zero)
        print("Entered init")
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// Extension conforming to the ViewModel protocol
extension MenuColletionView: ViewModel {
    
    // Add the collection view as a subview
    func addViews() {
        addSubviewsEx(collectionView)
    }
    
    // Define constraints for the collection view
    func addContrains() {
        print("Collection width: \(width)")
        print("Collection height: \(height)")
        NSLayoutConstraint.activate([
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.centerYAnchor.constraint(equalTo: centerYAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: (height/2) + 135)
        ])
    }
    
    // Configure the view's style
    func setupStyle() {
        // Set background color or other styling if needed
    }
    
    // Configure the collection view with data
    public func configureMenuCollection(with data: [MenuDataModel]){
        self.menuDataModel = data
        collectionView.reloadData()
    }
}

// Extension conforming to UICollectionViewDelegate and UICollectionViewDataSource
extension MenuColletionView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    // Number of items in the collection view
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menuDataModel.count
    }
    
    // Number of sections in the collection view
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    // Configure and return a cell for the collection view
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectioViewCell.identifier, for: indexPath) as? MenuCollectioViewCell else {
            fatalError("Error in MenuColletionView")
        }
        
        // Retrieve data for the cell
        let image = menuDataModel[indexPath.row].image
        let text = menuDataModel[indexPath.row].text
        let tag = indexPath.row
        
        // Set the delegate and configure the cell
        cell.delegateButton = self.delegate
        cell.configure(with: image, and: text, and: tag)
        
        return cell
    }
}


//
//  MenuColletionView.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 22/09/23.
//

import UIKit

class MenuColletionView: UIView {

    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.width
    
    weak var delegate: DelegatebuttonColletionViewModel?

    private var menuDataModel = [MenuDataModel]()
    
    // Collection view for displaying menu items
    private lazy var collectionView: UICollectionView = {
        
        // Configure collection view layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: width*0.60, height: width*0.63)
//        layout.minimumLineSpacing = 21
        layout.sectionInset = UIEdgeInsets(top: 10, left: width/5, bottom: 0, right: width/5)
      
        
        // Create the collection view
        let colletion = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletion.register(MenuCollectioViewCell.self, forCellWithReuseIdentifier: MenuCollectioViewCell.identifier)
        colletion.backgroundColor = .clear
        colletion.delegate = self
        colletion.dataSource = self
        colletion.translatesAutoresizingMaskIntoConstraints = false
        colletion.isPagingEnabled = true
        colletion.showsHorizontalScrollIndicator = false
        return colletion
    }()
    
    private lazy var pageControl: UIPageControl = {
        let page = UIPageControl()
        page.numberOfPages = 2
        page.currentPageIndicatorTintColor = UIColor(named: "PageControlColor")
        page.pageIndicatorTintColor = UIColor(named: "PageControlColor")
        page.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        page.translatesAutoresizingMaskIntoConstraints = false
        return page
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

        NSLayoutConstraint.activate([
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.centerYAnchor.constraint(equalTo: centerYAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: width*0.6),
            
//            pageControl.centerXAnchor.constraint(equalTo: centerXAnchor),
//            pageControl.topAnchor.constraint(equalTo: collectionView.bottomAnchor)
        ])
    }
    

    func setupStyle() {

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
        
        let image = menuDataModel[indexPath.row].image

        cell.configure(with: image)
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.delegate?.didButton(tag: indexPath.row)
    }
}

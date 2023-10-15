//
//  MenuColletionView.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 22/09/23.
//

import UIKit


class MenuColletionView: UIView {

    let size = UIScreen.main.bounds.size
    
    weak var delegate: DelegatebuttonColletionViewModel?

    private var menuDataModel = [MenuDataModel]()
    
    private lazy var collectionView: UICollectionView = {
        
        // Configure collection view layout
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = .init(width: size.width*0.60, height: size.width*0.63)
        layout.sectionInset = UIEdgeInsets(top: 10, left: size.width/5, bottom: 0, right: size.width/5)
      
        
        // Create the collection view
        let colletion = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletion.register(MenuCollectioViewCell.self, forCellWithReuseIdentifier: MenuCollectioViewCell.identifier)
        colletion.backgroundColor = .clear
        colletion.delegate = self
        colletion.dataSource = self
        colletion.translatesAutoresizingMaskIntoConstraints = false
        colletion.isPagingEnabled = true
        colletion.showsHorizontalScrollIndicator = false
//        colletion.backgroundColor = .red
        return colletion
    }()

    init(){
        super.init(frame: .zero)
        print("Entered init")
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension MenuColletionView: ViewModel {
    
    func addViews() {
        addSubviewsEx(collectionView)
    }
    
    func addContrains() {
        if UIDevice.current.userInterfaceIdiom == .pad{
            contrainsiPad()
        }else if UIDevice.current.userInterfaceIdiom == .phone{
            contrainsiPhone()
        }
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
        self.addHapticFeedback(type: .success)
        self.delegate?.didButton(tag: indexPath.row)
    }
}

extension MenuColletionView{
    private func contrainsiPhone(){
        
        NSLayoutConstraint.activate([
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.centerYAnchor.constraint(equalTo: centerYAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: size.width*0.6)
        ])
    }
    
    
    private func contrainsiPad(){
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: size.width*0.40, height: size.width*0.40)
        layout.sectionInset = .init(top: 0, left: size.width*0.2, bottom: 0, right: size.width*0.2)
        collectionView.collectionViewLayout = layout
        
        NSLayoutConstraint.activate([
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.centerYAnchor.constraint(equalTo: centerYAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: size.width*0.42)
        ])
    }
}

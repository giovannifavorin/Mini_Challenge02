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
    
    private var menuDataModel = [MenuDataModel]()
    
    private lazy var collectionView: UICollectionView = {
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = .init(width: width, height: (height/2) + 100)
        layout.collectionView?.backgroundColor = .blue
        
        let colletion = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colletion.delegate = self
        colletion.dataSource = self
        colletion.register(MenuCollectioViewCell.self, forCellWithReuseIdentifier: MenuCollectioViewCell.identifier)
        colletion.translatesAutoresizingMaskIntoConstraints = false
        colletion.backgroundColor = .red
        colletion.isPagingEnabled = true
        return colletion
    }()
    
    init(){
        super.init(frame: .zero)
        print("entrei")
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension MenuColletionView: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.menuDataModel.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MenuCollectioViewCell.identifier, for: indexPath) as? MenuCollectioViewCell else
        {
            fatalError("Error in MenuColletionView")
        }
        
        let image = menuDataModel[indexPath.row].image
        let tex = menuDataModel[indexPath.row].text
        
        cell.configure(with: image, and: tex)
        
        return cell
    }
}


extension MenuColletionView: ViewModel {
    func addViews() {
        addSubviewsEx(collectionView)
    }
    
    func addContrains() {
        print("Tamanho width na colletion: \(width)")
        print("Tamanho height na colletion: \(height)")
        NSLayoutConstraint.activate([
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.centerYAnchor.constraint(equalTo: centerYAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: (height/2) + 100)
        ])
    }
    
    func setupStyle() {
        backgroundColor = .darkGray
    }
    
    public func configureMenuCollection(with data: [MenuDataModel]){
        self.menuDataModel = data
        
        collectionView.reloadData()
    }
}

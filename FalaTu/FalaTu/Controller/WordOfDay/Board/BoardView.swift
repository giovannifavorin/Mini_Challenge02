//
//  BoardView.swift
//  FalaTu
//
//  Created by Leonardo Mota on 28/09/23.
//

import Foundation
import UIKit

class BoardView: UIView {
    
    // CollectionView para o quadro para inserir palavras
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 4
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(KeyCell.self, forCellWithReuseIdentifier: KeyCell.identifier)
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewModel()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension BoardView: ViewModel {
    func addViews() {
        addSubview(collectionView)
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80)
        ])
    }
    
    func setupStyle() {
        collectionView.backgroundColor = .clear
        collectionView.layer.frame.size = CGSize(width: collectionView.frame.size.width + 10, height: collectionView.frame.size.height + 20)
    }
}

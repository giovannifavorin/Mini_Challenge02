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
    
    // Borda para o quadro
    lazy var borderedView: UIView = {
        let borderedView = UIView()
        borderedView.translatesAutoresizingMaskIntoConstraints = false
        return borderedView
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
        addSubview(borderedView)
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 80),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -80),
            
            borderedView.leadingAnchor.constraint(equalTo: collectionView.leadingAnchor, constant: -30),
            borderedView.trailingAnchor.constraint(equalTo: collectionView.trailingAnchor, constant: 30),
            borderedView.topAnchor.constraint(equalTo: collectionView.topAnchor, constant: -30),
            borderedView.bottomAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 30)
        ])
    }
    
    func setupStyle() {
        collectionView.backgroundColor = .systemGray5
        
        borderedView.layer.cornerRadius = 10
        borderedView.layer.borderColor = UIColor.systemGray6.cgColor // cor da borda ao redor do quadro
        borderedView.layer.borderWidth = 2
        borderedView.backgroundColor = .clear
    }
}

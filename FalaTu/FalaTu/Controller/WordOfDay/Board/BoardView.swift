//
//  BoardView.swift
//  FalaTu
//
//  Created by Leonardo Mota on 28/09/23.
//

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
            
            
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            collectionView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            borderedView.leadingAnchor.constraint(equalTo: leadingAnchor),
            borderedView.trailingAnchor.constraint(equalTo: trailingAnchor),
            borderedView.topAnchor.constraint(equalTo: topAnchor),
            borderedView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func setupStyle() {
        //collectionView.backgroundColor = .systemGray5 // cor de fundo de todos quadrados
        
        collectionView.backgroundColor = .clear
        
        borderedView.layer.cornerRadius = 10
        borderedView.layer.borderColor = UIColor.systemGray6.cgColor // cor da borda ao redor do quadro
        borderedView.layer.borderWidth = 2
        borderedView.backgroundColor = .clear
    }
}

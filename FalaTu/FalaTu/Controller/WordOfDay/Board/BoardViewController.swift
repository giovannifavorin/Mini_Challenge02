//
//  BoardViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 20/09/23.
//

import UIKit

// PROTOCOLO PARA VER NUMERO DE TENTATIVAS E VERIFICAR QUAL COR DEVE INSERIR
protocol BoardViewControllerDatasource: AnyObject {
    var currentGuesses: [[Character?]] { get }
    
    // Verificar qual a cor
    func boxColor(at indexPath: IndexPath) -> UIColor?
}

class BoardViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    weak var datasource: BoardViewControllerDatasource?
    
    // VIEW
    private var boardView: BoardView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        boardView = BoardView()
        boardView.translatesAutoresizingMaskIntoConstraints = false

        setupViewControllerModel()
        
        boardView.collectionView.delegate = self
        boardView.collectionView.dataSource = self
    }
    
    // Recarregar os dados para cada vez que uma tecla for clicada
    public func reloadData() {
        boardView.collectionView.reloadData()
    }
 }

extension BoardViewController: ViewControllerModel {
    func addSubviews() {
        view.addSubview(boardView)
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            boardView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            boardView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            boardView.topAnchor.constraint(equalTo: view.topAnchor),
            boardView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    func addStyle() {
    }
}


extension BoardViewController {
    // Número de fileiras (6)
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return datasource?.currentGuesses.count ?? 0
    }
    
    // Número de colunas (5)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let guesses = datasource?.currentGuesses ?? []
        return guesses[section].count
    }
    
    // Configurar cada quadrado
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyCell.identifier, for: indexPath) as? KeyCell else {
            fatalError()
        }
        
        cell.layer.cornerRadius = 4
        cell.backgroundColor = datasource?.boxColor(at: indexPath) // cor de fundo do quadrado
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.systemGray2.cgColor // cor da borda do quadrado
        
        let guesses = datasource?.currentGuesses ?? []
        // Se temos uma letra
        if let letter = guesses[indexPath.section][indexPath.row] {
            cell.configure(with: letter)
        }
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let margin: CGFloat = 20
        let size: CGFloat = (collectionView.frame.size.width-margin)/5
        
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 2,
                            left: 2,
                            bottom: 2,
                            right: 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
  
    }
}

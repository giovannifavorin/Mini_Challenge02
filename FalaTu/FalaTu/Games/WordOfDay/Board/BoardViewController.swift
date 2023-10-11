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
    var sendButtonPressed = false
    var currentRow: Int = 0
    var selectedRow: Int?
    
    // VIEW
    var boardView: BoardView!
    
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
            boardView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
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
        cell.layer.borderWidth = 2.5
        cell.layer.borderColor = UIColor.systemGray.cgColor // cor da borda do quadrado
        cell.backgroundColor = UIColor(named: "backgroundColor")
        
        let guesses = datasource?.currentGuesses ?? []
        // Se temos uma letra
        if let letter = guesses[indexPath.section][indexPath.row] {
            let defaultBoxColor = UIColor(named: "backgroundColor") // cor dos quadrados enquanto digita antes de confirmar
            cell.configure(with: letter)
            cell.backgroundColor = datasource?.boxColor(at: indexPath) ?? defaultBoxColor // cor de fundo do quadrado
            cell.label.textColor = UIColor(named: "colorLetters")
            
        }
        return cell
    }
    
    // Tamanho dos quadrados
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let margin: CGFloat = 20
        let screenWidth = collectionView.frame.size.width
       
        var squareWidth = (screenWidth - margin) / 5  
        
        return CGSize(width: squareWidth, height: squareWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {

        
        return UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
    }

    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
 
    }


}

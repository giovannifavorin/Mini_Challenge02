//
//  KeyboardViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 28/09/23.
//

import UIKit

// PROTOCOLO PARA LIGAR TECLADO AO BOARD
protocol KeyboardViewControllerDelegate: AnyObject {
    func keyboardViewControllerDelegate(_ vc: KeyboardViewController, didTapKey letter: Character)
}

class KeyboardViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    
    weak var delegate: KeyboardViewControllerDelegate?

    // LETRAS DO TECLADO
    let letters = ["qwertyuiop", "asdfghjklç", "zxcvbnm"]
    // TECLAS DO TECLADO
    private var keys: [[Character]] = []
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear // COR DE FUNDO DO TECLADO TODO
        collectionView.register(KeyCell.self, forCellWithReuseIdentifier: KeyCell.identifier)
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.delegate = self
        collectionView.dataSource = self
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Preencher o teclado
        for row in letters {
            let characters = Array(row)
            keys.append(characters)
        }
    }
 }


extension KeyboardViewController {
    
    // Número de sections para o teclado (3) -> fileiras
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return keys.count
    }
    
    // Número de itens em cada fileira (10, 10, 7) (sem o delete)
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keys[section].count
    }
    
    // Configurar o que fica no teclado
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyCell.identifier, for: indexPath) as? KeyCell else {
            fatalError()
        }
        let letter = keys[indexPath.section][indexPath.row]
        cell.configure(with: letter) // QUAL LETRA
        cell.configureStyle(cornerRadius: 8) // CORNER RADIUS TECLAS
        return cell
    }
    
    // Tamanho de cada tecla do teclado
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let margin: CGFloat = 20
        let size: CGFloat = (collectionView.frame.size.width-margin)/10
        
        return CGSize(width: size, height: size*1.5)
    }
    
    // Função para alinhar o teclado
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        var left: CGFloat = 1
        var right: CGFloat = 1
        
        let margin: CGFloat = 20
        let size: CGFloat = (collectionView.frame.size.width-margin)/10
        
        let count: CGFloat = CGFloat(collectionView.numberOfItems(inSection: section))
        
        let inset: CGFloat = (collectionView.frame.size.width - (size * count) - (2 * count)) / 2
        
        left = inset
        right = inset
        
        return UIEdgeInsets(top: 2,
                            left: left,
                            bottom: 2,
                            right: right)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        collectionView.deselectItem(at: indexPath, animated: false)
        // CAPTURANDO QUAL LETRA FOI CLICADA
        let letter = keys[indexPath.section][indexPath.row]
        delegate?.keyboardViewControllerDelegate(self, didTapKey: letter)
    }
}

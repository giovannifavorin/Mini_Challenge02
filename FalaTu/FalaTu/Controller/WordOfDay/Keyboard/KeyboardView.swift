//
//  KeyboardView.swift
//  FalaTu
//
//  Created by Leonardo Mota on 01/10/23.
//

import UIKit

protocol KeyboardViewDelegate: AnyObject {
    func keyTapped(_ letter: Character)
}

class KeyboardView: UIView, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    weak var delegate: KeyboardViewDelegate?
    
    private let letters = ["qwertyuiop", "asdfghjklç", "zxcvbnm"]
    private var keys: [[Character]] = []

    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(KeyCell.self, forCellWithReuseIdentifier: KeyCell.identifier)
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        // Configurar o teclado
        setupKeyboard()
        
        // Configurar a View
        setupViewModel()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupKeyboard()
    }

    private func setupKeyboard() {
        collectionView.delegate = self
        collectionView.dataSource = self

        // percorre por todas as letras e as adiciona às teclas construídas
        for row in letters {
            let characters = Array(row)
            keys.append(characters)
        }
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return keys.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return keys[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: KeyCell.identifier, for: indexPath) as? KeyCell else {
            fatalError()
        }
        let letter = keys[indexPath.section][indexPath.row]
        cell.configure(with: letter)
        cell.configureStyle(cornerRadius: 8)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let margin: CGFloat = 20
        let size: CGFloat = (collectionView.frame.size.width - margin) / 10
        return CGSize(width: size, height: size * 1.2)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        var left: CGFloat = 1
        var right: CGFloat = 1

        let margin: CGFloat = 20
        let size: CGFloat = (collectionView.frame.size.width - margin) / 10
        let count: CGFloat = CGFloat(collectionView.numberOfItems(inSection: section))
        let inset: CGFloat = (collectionView.frame.size.width - (size * count) - (2 * count)) / 2

        left = inset
        right = inset

        return UIEdgeInsets(top: 2, left: left, bottom: 2, right: right)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: false)
        let letter = keys[indexPath.section][indexPath.row]
        delegate?.keyTapped(letter)
    }
}

extension KeyboardView: ViewModel {
    func addViews() {
        addSubview(collectionView)
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 30)
        ])
    }
    
    func setupStyle() {
        collectionView.backgroundColor = .clear
    }
}

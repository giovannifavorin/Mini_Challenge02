//
//  KeyCell.swift
//  FalaTu
//
//  Created by Leonardo Mota on 28/09/23.
//

import UIKit

class KeyCell: UICollectionViewCell {
    static let identifier = "KeyCell"
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .medium)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        label.text = nil
    }
    
    func configure(with letter: Character) {
        if letter == "⌫" {
            // BOTÃO DE APAGAR
            label.font = .systemFont(ofSize: 24, weight: .medium)
            label.textColor = .white
            self.backgroundColor = .blue
            label.text = String(letter)
            
            // OUTROS BOTÕES
        } else {
            label.font = .systemFont(ofSize: 16, weight: .medium)
            label.textColor = .black
            label.text = String(letter).uppercased()
            self.backgroundColor = .white 
        }
    }

    
    func configureColorCell(with color: UIColor) {
        self.backgroundColor = color
    }
    
    func configureStyle(cornerRadius: Int) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.masksToBounds = true
        
        // Adicionar sombra
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowRadius = 1.0
        self.layer.masksToBounds = false
    }
}

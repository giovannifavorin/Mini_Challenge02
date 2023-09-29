//
//  KeyCell.swift
//  FalaTu
//
//  Created by Leonardo Mota on 28/09/23.
//

import UIKit

// LETRAS (TECLADO E BOARD)
class KeyCell: UICollectionViewCell {
    static let identifier = "KeyCell"
    
    let label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white // COR DE TODAS AS LETRAS
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 10, weight: .medium)
        
        return label
    } ()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemGray5
        
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
    
    // Configurar a letra para o que for preciso que apareça
    func configure(with letter: Character) {
        label.text = String(letter).uppercased()
    }
    
    func configureColorCell(with color: UIColor) {
        self.backgroundColor = color
    }
    
    func configureStyle(cornerRadius: Int) {
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.layer.masksToBounds = true
        
        // Adicionar sombra
        self.layer.shadowColor = UIColor.black.cgColor // Cor da sombra
        self.layer.shadowOffset = CGSize(width: 0, height: 2) // Deslocamento da sombra (0 para horizontal, 2 para vertical)
        self.layer.shadowOpacity = 0.5 // Opacidade da sombra (0 a 1)
        self.layer.shadowRadius = 1.0 // Raio da sombra
        self.layer.masksToBounds = false // Permitir que a sombra se estenda além dos limites da célula
    }
}

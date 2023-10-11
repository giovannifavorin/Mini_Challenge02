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
        
        contentView.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
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
            let boldFont = UIFont.boldSystemFont(ofSize: UIFont.preferredFont(forTextStyle: .title1).pointSize)
            let boldFontDescriptor = boldFont.fontDescriptor.withSymbolicTraits(.traitBold)
            label.font = UIFont(descriptor: boldFontDescriptor!, size: boldFont.pointSize)
            
            label.adjustsFontForContentSizeCategory = true
            label.textColor = .white
            self.backgroundColor = .blue
            label.text = String(letter)
        } else {
            // OUTROS BOTÕES
            let boldFont = UIFont.boldSystemFont(ofSize: UIFont.preferredFont(forTextStyle: .title2).pointSize)
            let boldFontDescriptor = boldFont.fontDescriptor.withSymbolicTraits(.traitBold)
            label.font = UIFont(descriptor: boldFontDescriptor!, size: boldFont.pointSize)
            
            label.adjustsFontForContentSizeCategory = true
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
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 2)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0
        self.layer.masksToBounds = false
    }
}

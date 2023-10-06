//
//  CustonButton.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 05/10/23.
//

import UIKit

class CustonButton: UIButton {

    private var customImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor(named: "Border_button_Select")?.cgColor
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 20
        imageView.backgroundColor = .white
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private var customTitleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var imageViewLeft: UIImage? {
        didSet {
            customImageView.image = imageViewLeft
        }
    }

    var buttonText: String? {
        didSet {
            customTitleLabel.text = buttonText
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }
    
    private func setupViews() {
        addSubview(customImageView)
        addSubview(customTitleLabel)
        
        // Aplicar restrições à customImageView
        NSLayoutConstraint.activate([
            customImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            customImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            customImageView.widthAnchor.constraint(equalToConstant: 40),
            customImageView.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        // Aplicar restrições ao customTitleLabel
        NSLayoutConstraint.activate([
            customTitleLabel.leadingAnchor.constraint(equalTo: customImageView.trailingAnchor, constant: 5),
            customTitleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            customTitleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -5)
        ])
        
        backgroundColor = UIColor(named: "bg_PopUpPerfil")
        layer.borderColor = UIColor(named: "bg_PopUpPerfil_Corner")?.cgColor
        layer.borderWidth = 3
        layer.cornerRadius = 20
    }
}

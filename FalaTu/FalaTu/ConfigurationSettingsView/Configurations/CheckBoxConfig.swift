//
//  CheckboxConfig.swift
//  CheckBox
//
//  Created by Gustavo Horestee Santos Barros on 09/10/23.
//

import UIKit

class CheckboxConfig: UIView {
        
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Hore", size: 18)
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .black
        label.text = "default palavra"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageSimbol: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "asset")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var checkbutton: ConfigChecBoxButtonCuston = {
        let button = ConfigChecBoxButtonCuston()
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    init(text: String, image: UIImage){
        super.init(frame: .zero)
    
        if #available(iOS 15, *) {
            creatNewCheck(text: String(localized: "\(text)"), image: image)
        } else {
            // Fallback on earlier versions
        }
        setupViewModel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func creatNewCheck(text: String, image: UIImage){
        self.label.text = text
        self.imageSimbol.image = image
    }
}


extension CheckboxConfig: ViewModel{
    func addViews() {
        addSubview(label)
        addSubview(imageSimbol)
        addSubview(checkbutton)
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            imageSimbol.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageSimbol.heightAnchor.constraint(equalToConstant: 30),
            imageSimbol.widthAnchor.constraint(equalToConstant: 30),
            
            label.leadingAnchor.constraint(equalTo: imageSimbol.trailingAnchor, constant: 11),
            label.centerYAnchor.constraint(equalTo: imageSimbol.centerYAnchor),
            
            checkbutton.trailingAnchor.constraint(equalTo: trailingAnchor),
            checkbutton.centerYAnchor.constraint(equalTo: imageSimbol.centerYAnchor),
            checkbutton.heightAnchor.constraint(equalToConstant: 30),
            checkbutton.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    func setupStyle() {
        backgroundColor = .clear
    }
    
}


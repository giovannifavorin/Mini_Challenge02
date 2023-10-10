//
//  CheckboxConfig.swift
//  CheckBox
//
//  Created by Gustavo Horestee Santos Barros on 09/10/23.
//

import UIKit

class CheckboxConfig: UIView {

    var isChecked: Bool = false
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Hore-Regular", size: 18)
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
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var checkImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "box-closed")
                      ?? UIImage(named: "asset")!
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    

    
    init(text: String){
        super.init(frame: .zero)
    
        creatNewCheck(text: text)
        setupViewModel()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func creatNewCheck(text: String){
        self.label.text = text
    }
    
    public func toggle() {
        self.isChecked = !isChecked
        print("entrei no togle entao senti o toque")
        if !isChecked {
            checkImage.image = UIImage(named: "box-closed") ?? UIImage(named: "asset")!
        } else {
            checkImage.image = UIImage(named: "box-select") ?? UIImage(named: "asset")!
        }
    }
}


extension CheckboxConfig: ViewModel{
    func addViews() {
        addSubview(label)
        addSubview(imageSimbol)
        addSubview(checkImage)
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            imageSimbol.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageSimbol.heightAnchor.constraint(equalToConstant: 30),
            imageSimbol.widthAnchor.constraint(equalToConstant: 30),
            
            label.leadingAnchor.constraint(equalTo: imageSimbol.trailingAnchor, constant: 11),
            
            checkImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            checkImage.centerYAnchor.constraint(equalTo: imageSimbol.centerYAnchor),
            checkImage.heightAnchor.constraint(equalToConstant: 30),
            checkImage.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
    
    func setupStyle() {
        
    }
    
}


//
//  CheckboxConfig.swift
//  CheckBox
//
//  Created by Gustavo Horestee Santos Barros on 09/10/23.
//

import UIKit

class CheckboxConfig: UIView {
    
    weak var delegateConfigView: DelegateConfigView?
    
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
    
    private lazy var checkbutton: ConfigChecBoxButtonCuston = {
        let image = ConfigChecBoxButtonCuston()
        image.addTarget(self, action: #selector(didButtonConfig), for: .touchUpInside)
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
    
    
    @objc
    private func didButtonConfig(_ sender: UIButton!){
        self.delegateConfigView?.didCheckButtonChangeThema()
        checkbutton.togleAsset()
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


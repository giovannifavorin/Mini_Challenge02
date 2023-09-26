//
//  userInformation.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 26/09/23.
//

import UIKit

class UserInformation: UIView {

    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ThePedra")
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 40
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var textField: UITextField = {
        let field = UITextField()
        field.borderStyle = .none
        field.keyboardType = .default
        field.placeholder = "Digite seu nome"
        field.delegate = self
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    init(){
        super.init(frame: .zero)
        
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension UserInformation: ViewModel{
    func addViews() {
        addSubviewsEx(imageView, textField)
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            
            textField.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 13),
            textField.topAnchor.constraint(equalTo: topAnchor, constant: 31),
            textField.heightAnchor.constraint(equalToConstant: 35),
            textField.widthAnchor.constraint(equalToConstant: 120),

            
        ])
    }
    
    func setupStyle() {
        backgroundColor = .white
    }
}


extension UserInformation: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        let palavra = textField.text
        
        print(palavra!)
        return true
    }
}

//
//  userInformation.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 26/09/23.
//

import UIKit

class UserInformationView: UIView {

    private let size = UIScreen.main.bounds.size
//    private let regions: [String] = ["Norte", "Sul", "Centro Oeste", "Nordeste", "Sudeste"]
    private let namesDefaults: [String] = ["Fulano", "Ciclano", "Sasi", "Boitatá", "CurupiraYE"]
    private var randomName: String?
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "ThePedra")
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 40
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private lazy var myTextField: UITextField = {
        let field = UITextField()
        field.borderStyle = .none
        field.keyboardType = .default
        field.placeholder = "Digite seu nome"
        field.text = "\(randomName ?? "Carlos")"
        field.font = UIFont.boldSystemFont(ofSize: 20)
        field.delegate = self
        field.returnKeyType = .done
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    
    private lazy var viewOffensive: ModeRagingView = {
        let view = ModeRagingView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var viewWords: ModeRagingView = {
        let view = ModeRagingView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var viewTotalGames: ModeRagingView = {
        let view = ModeRagingView()
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelRegion: UILabel = {
        let label = UILabel()
        label.text = "Região: "
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var myActionForMenu: [UIAction] {
        return [
            UIAction(title: "Norte", handler: { (_) in}),
            UIAction(title: "Sul", handler: { (_) in}),
            UIAction(title: "Nordeste", handler: { (_) in}),
            UIAction(title: "Centro-Oeste", handler: { (_) in}),
            UIAction(title: "Sudeste", handler: { (_) in}),
        ]
    }
    
    private var menuRegions: UIMenu {
        return UIMenu(title: "Minha região", children: myActionForMenu)
    }
    
    private lazy var buttonChangeRegion: UIButton = {
        let button = UIButton(configuration: .gray())
//        button.layer.cornerRadius = 20
        button.menu = menuRegions
        button.showsMenuAsPrimaryAction = true
        button.configuration?.image = UIImage(systemName: "return")
        button.configuration?.buttonSize = .mini
        return button
    }()
    
    init(){
        super.init(frame: .zero)
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension UserInformationView: ViewModel{
    func addViews() {
        addSubviewsEx(imageView, myTextField, viewOffensive, viewTotalGames, viewWords, labelRegion, buttonChangeRegion)
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalToConstant: 80),
            imageView.heightAnchor.constraint(equalToConstant: 80),
            imageView.leftAnchor.constraint(equalTo: leftAnchor, constant: 20),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            
            myTextField.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 13),
            myTextField.topAnchor.constraint(equalTo: topAnchor, constant: 31),
            myTextField.heightAnchor.constraint(equalToConstant: 35),
            myTextField.widthAnchor.constraint(equalToConstant: 120),
            
            labelRegion.topAnchor.constraint(equalTo: myTextField.bottomAnchor),
            labelRegion.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 13),
            
            
//    
        ])
        
        
        NSLayoutConstraint.activate([
            
            viewOffensive.leftAnchor.constraint(equalTo: leftAnchor, constant: 21.5),
            viewOffensive.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -26),
            viewOffensive.heightAnchor.constraint(equalToConstant: 60),
            viewOffensive.widthAnchor.constraint(equalToConstant: 80),

            viewTotalGames.leftAnchor.constraint(equalTo: viewOffensive.rightAnchor, constant: 17),
            viewTotalGames.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -26),
            viewTotalGames.heightAnchor.constraint(equalToConstant: 60),
            viewTotalGames.widthAnchor.constraint(equalToConstant: 110),

            viewWords.leftAnchor.constraint(equalTo: viewTotalGames.rightAnchor, constant: 17),
            viewWords.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -26),
            viewWords.heightAnchor.constraint(equalToConstant: 60),
            viewWords.widthAnchor.constraint(equalToConstant: 80),
            
            
        ])
    }
    
    func setupStyle() {
        backgroundColor = .white
        randomName = namesDefaults.randomElement()
        myTextField.text = randomName
    }
}


extension UserInformationView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let word = textField.text, !word.isEmpty{
            myTextField.text = word

        } else {
            print("Name invaled informed in UserInformationView")
        }
        
        print(myTextField.text!)
        myTextField.resignFirstResponder()
        return true
    }
}


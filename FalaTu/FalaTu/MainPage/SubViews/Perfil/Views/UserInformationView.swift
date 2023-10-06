//
//  userInformation.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 26/09/23.
//

import UIKit
import QuartzCore

class UserInformationView: UIView {

    private let size = UIScreen.main.bounds.size
    private let namesDefaults: [String] = ["Fulano", "Ciclano", "Sasi", "Boitatá", "CurupiraYE"]
    private var randomName: String?
    weak var delegateUserPreferences: DelegateUserPreferences?
    
    
    private lazy var viewBackgroundUserPreferences: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "bg_Userprofile")
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        
        // Configurar sombreamento
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowOpacity = 0.05
        view.layer.shadowOffset = CGSize(width: 0, height: 4)
        view.layer.shadowRadius = 4.0

        return view
    }()
    
   lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "asset")
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 40
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private lazy var myTextField: UITextField = {
        let image = UIImageView()
        image.image = UIImage(named: "Edit")
        
        let field = UITextField()
        field.borderStyle = .none
        field.keyboardType = .default
        field.placeholder = "Digite seu nome"
        field.text = "\(randomName ?? "Carlos")"
//        field.font = UIFont(name: "Hore", size: 20)
        field.font = .systemFont(ofSize: 20, weight: .heavy)
        field.delegate = self
        field.returnKeyType = .done
        field.translatesAutoresizingMaskIntoConstraints = false
        field.rightViewMode = .always
        field.rightView = image
        return field
    }()
    
    
     lazy var viewOffensive: ModeRagingView = {
        let view = ModeRagingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var viewWords: ModeRagingView = {
        let view = ModeRagingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    lazy var viewTotalGames: ModeRagingView = {
        let view = ModeRagingView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    let dividerLeft: UIView = {
        let divider = UIView()
        divider.layer.cornerRadius = 2
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor(named: "dividerForImage")
        return divider
    }()
    
    let dividerRight: UIView = {
        let divider = UIView()
        divider.backgroundColor = .clear
        divider.layer.cornerRadius = 4
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor(named: "dividerForImage")
        return divider
    }()
    
    let dividerName: UIView = {
        let divider = UIView()
        divider.backgroundColor = .clear
        divider.layer.cornerRadius = 2
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor(named: "dividerColor ")
        return divider
    }()
    
    private lazy var backgroundImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Profile_BG")
        image.contentMode = .scaleAspectFit
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
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
        addSubviewsEx(backgroundImage,imageView,viewBackgroundUserPreferences, myTextField, viewOffensive, viewTotalGames, viewWords, dividerName, dividerRight, dividerLeft)
        

    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            
            backgroundImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: viewBackgroundUserPreferences.topAnchor, constant: 20),
            
            imageView.widthAnchor.constraint(equalToConstant: 140),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 127),
            
            viewBackgroundUserPreferences.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: -10),
            viewBackgroundUserPreferences.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewBackgroundUserPreferences.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewBackgroundUserPreferences.heightAnchor.constraint(equalToConstant: size.width*0.45),
            
            myTextField.topAnchor.constraint(equalTo: viewBackgroundUserPreferences.topAnchor, constant: 30),
            myTextField.leadingAnchor.constraint(equalTo: viewBackgroundUserPreferences.leadingAnchor, constant: 45.5),
            myTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -45.5),
            myTextField.heightAnchor.constraint(equalToConstant: 35),
//            myTextField.widthAnchor.constraint(equalTo: widthAnchor, constant: 45.5),
        ])
        
        NSLayoutConstraint.activate([
            
            dividerName.topAnchor.constraint(equalTo: myTextField.bottomAnchor, constant: 5),
            dividerName.leadingAnchor.constraint(equalTo: viewBackgroundUserPreferences.leadingAnchor, constant: 45.5),
            dividerName.heightAnchor.constraint(equalToConstant: 2),
            dividerName.widthAnchor.constraint(equalToConstant: 304),
            
            viewTotalGames.centerXAnchor.constraint(equalTo: viewBackgroundUserPreferences.centerXAnchor),
            viewTotalGames.topAnchor.constraint(equalTo: dividerName.bottomAnchor, constant: 30),
            viewTotalGames.widthAnchor.constraint(equalToConstant: 104),
            viewTotalGames.heightAnchor.constraint(equalToConstant: 60),
            
            dividerLeft.trailingAnchor.constraint(equalTo: viewTotalGames.leadingAnchor, constant: -22.5),
            dividerLeft.centerYAnchor.constraint(equalTo: viewTotalGames.centerYAnchor),
            dividerLeft.heightAnchor.constraint(equalToConstant: 80),
            dividerLeft.widthAnchor.constraint(equalToConstant: 2),
            
            dividerRight.leadingAnchor.constraint(equalTo: viewTotalGames.trailingAnchor, constant: 22.5),
            dividerRight.centerYAnchor.constraint(equalTo: viewTotalGames.centerYAnchor),
            dividerRight.heightAnchor.constraint(equalToConstant: 80),
            dividerRight.widthAnchor.constraint(equalToConstant: 2),
            
            viewOffensive.leadingAnchor.constraint(equalTo: viewBackgroundUserPreferences.leadingAnchor, constant: 45.5),
            viewOffensive.centerYAnchor.constraint(equalTo: dividerLeft.centerYAnchor),
            viewOffensive.widthAnchor.constraint(equalToConstant: 60),
            viewOffensive.heightAnchor.constraint(equalToConstant: 60),

            viewWords.trailingAnchor.constraint(equalTo: viewBackgroundUserPreferences.trailingAnchor, constant: -45.5),
            viewWords.centerYAnchor.constraint(equalTo: dividerRight.centerYAnchor),
            viewWords.widthAnchor.constraint(equalToConstant: 60),
            viewWords.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    func setupStyle() {
        backgroundColor = UIColor(named: "backgroundColor")
//        backgroundColor = .red
        randomName = namesDefaults.randomElement()
        myTextField.text = randomName

    }
}


extension UserInformationView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let word = textField.text, !word.isEmpty{
            myTextField.text = word
            self.delegateUserPreferences?.configureNamePerfil(name: "\(word)")
            
        } else {
            print("Name invaled informed in UserInformationView")
        }
        
        myTextField.resignFirstResponder()
        return true
    }
}


extension UserInformationView{
    public func cofigure(name: String, image: UIImage){
        myTextField.text = name
        self.imageView.image = image
    }
}


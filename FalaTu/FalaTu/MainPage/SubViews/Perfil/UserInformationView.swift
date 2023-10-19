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
        image.image = UIImage(named: "arara")
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

        field.font = UIFont(name: "Hore", size: 24)
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
    
    let dividerName: UIView = {
        let divider = UIView()
        divider.backgroundColor = .clear
        divider.layer.cornerRadius = 2
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor(named: "dividerColor")
//        divider.backgroundColor = .white
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
        addSubviewsEx(backgroundImage,imageView,viewBackgroundUserPreferences, myTextField, viewOffensive, viewTotalGames, viewWords, dividerName)
        

    }
    
    func addContrains() {
        if UIDevice.current.userInterfaceIdiom == .pad{
            print("Contrins para iPads ativas")
            contrainsiPad()
            configureItensForiPads()
            
        }else if UIDevice.current.userInterfaceIdiom == .phone{
            contrainsiPhone()
        }
    }
    
    func setupStyle() {
        backgroundColor = UIColor(named: "backgroundColor")
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
    
    public func cofigure(name: String, image: UIImage){
        myTextField.text = name
        self.imageView.image = image
    }
}


extension UserInformationView{

    private func contrainsiPhone(){
        
        NSLayoutConstraint.activate([
            backgroundImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            backgroundImage.topAnchor.constraint(equalTo: topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: viewBackgroundUserPreferences.topAnchor, constant: 25),
                
            imageView.widthAnchor.constraint(equalToConstant: 200),
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
            
            viewOffensive.leadingAnchor.constraint(equalTo: viewBackgroundUserPreferences.leadingAnchor, constant: 45.5),
            viewOffensive.centerYAnchor.constraint(equalTo: viewTotalGames.centerYAnchor),
            viewOffensive.widthAnchor.constraint(equalToConstant: 60),
            viewOffensive.heightAnchor.constraint(equalToConstant: 60),

            viewWords.trailingAnchor.constraint(equalTo: viewBackgroundUserPreferences.trailingAnchor, constant: -45.5),
            viewWords.centerYAnchor.constraint(equalTo: viewTotalGames.centerYAnchor),
            viewWords.widthAnchor.constraint(equalToConstant: 60),
            viewWords.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    
    private func contrainsiPad(){
        
        NSLayoutConstraint.activate([
            backgroundImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 290),
            backgroundImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundImage.topAnchor.constraint(equalTo: topAnchor, constant: -3),
            backgroundImage.heightAnchor.constraint(equalToConstant: size.height/2),
            
            imageView.widthAnchor.constraint(equalToConstant: 200),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: viewBackgroundUserPreferences.topAnchor, constant: 10),

            viewBackgroundUserPreferences.topAnchor.constraint(equalTo: topAnchor, constant: 380),
            viewBackgroundUserPreferences.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 147.11),
            viewBackgroundUserPreferences.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -147.11),
            viewBackgroundUserPreferences.heightAnchor.constraint(equalToConstant: size.width*0.3),
            
            myTextField.topAnchor.constraint(equalTo: viewBackgroundUserPreferences.topAnchor, constant: 50),
            myTextField.leadingAnchor.constraint(equalTo: viewBackgroundUserPreferences.leadingAnchor, constant: size.width/9),
            myTextField.trailingAnchor.constraint(equalTo: dividerName.trailingAnchor),
            myTextField.heightAnchor.constraint(equalToConstant: 35),
        ])
        
        NSLayoutConstraint.activate([
            
            dividerName.topAnchor.constraint(equalTo: myTextField.bottomAnchor, constant: 5),
            dividerName.leadingAnchor.constraint(equalTo: viewBackgroundUserPreferences.leadingAnchor, constant: size.width/9),
            dividerName.trailingAnchor.constraint(equalTo: viewBackgroundUserPreferences.trailingAnchor, constant: -size.width/9),
            dividerName.heightAnchor.constraint(equalToConstant: 2),
            
            viewTotalGames.centerXAnchor.constraint(equalTo: viewBackgroundUserPreferences.centerXAnchor),
            viewTotalGames.topAnchor.constraint(equalTo: dividerName.bottomAnchor, constant: 60),
            viewTotalGames.widthAnchor.constraint(equalToConstant: 104),
            viewTotalGames.heightAnchor.constraint(equalToConstant: 60),
            
            viewOffensive.leadingAnchor.constraint(equalTo: viewBackgroundUserPreferences.leadingAnchor, constant: size.width/9),
            viewOffensive.centerYAnchor.constraint(equalTo: viewTotalGames.centerYAnchor),
            viewOffensive.widthAnchor.constraint(equalToConstant: 60),
            viewOffensive.heightAnchor.constraint(equalToConstant: 60),

            viewWords.trailingAnchor.constraint(equalTo: viewBackgroundUserPreferences.trailingAnchor, constant: -size.width/9),
            viewWords.centerYAnchor.constraint(equalTo: viewTotalGames.centerYAnchor),
            viewWords.widthAnchor.constraint(equalToConstant: 60),
            viewWords.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    private func configureItensForiPads(){
        myTextField.font = .systemFont(ofSize: 30, weight: .heavy)
        backgroundImage.contentMode = .scaleAspectFill
    }
}





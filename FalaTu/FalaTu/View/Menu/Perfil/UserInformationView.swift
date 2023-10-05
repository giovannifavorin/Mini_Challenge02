//
//  userInformation.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 26/09/23.
//

import UIKit

class UserInformationView: UIView {

    private let size = UIScreen.main.bounds.size
    
    private let namesDefaults: [String] = ["Fulano", "Ciclano", "Sasi", "Boitatá", "CurupiraYE"]
    
    private var randomName: String?
    
    weak var delegateUserPreferences: DelegateUserPreferences?
    
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
        var dicioShow = CoreDataManager()
        var offensiveShow = dicioShow.perfis()
        offensiveShow.first?.ofensiva
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var viewWords: ModeRagingView = {
        let view = ModeRagingView()
        var dicioShow = CoreDataManager()
        var palavrasShow = dicioShow.perfis()
        palavrasShow.first?.palavras
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var viewTotalGames: ModeRagingView = {
        let view = ModeRagingView()
        var dicioShow = CoreDataManager()
        var totalGameShow = dicioShow.perfis()
        totalGameShow.first?.jogostotais
        view.layer.cornerRadius = 8
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelRegion: UILabel = {
        let label = UILabel()
        label.text = "Região: Norte"
        label.font = .systemFont(ofSize: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private var myActionForMenu: [UIAction] {
        return [
            UIAction(title: "Norte", handler: { (action) in
                self.configureRegionLabel(region: "Norte")
            }),
            UIAction(title: "Sul", handler: { [self] (action) in
                self.configureRegionLabel(region: "Sul")
            }),
            UIAction(title: "Nordeste", handler: { (action) in
                self.configureRegionLabel(region: "Nordeste")
            }),
            UIAction(title: "Centro-Oeste", handler: { (action) in
                self.configureRegionLabel(region: "Centro-Oeste")
            }),
            UIAction(title: "Sudeste", handler: { (action) in
                self.configureRegionLabel(region: "Sudeste")
            }),
        ]
    }
    
    private var menuRegions: UIMenu {
        return UIMenu(title: "Minha região", children: myActionForMenu)
    }
    
    lazy var buttonChangeRegion: UIButton = {
        let button = UIButton(configuration: .gray())
        button.menu = menuRegions
        button.showsMenuAsPrimaryAction = true
        button.configuration?.image = UIImage(systemName: "return")
        button.configuration?.buttonSize = .mini
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(){
        super.init(frame: .zero)
        setupViewModel()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureRegionLabel(region: String){
        self.labelRegion.text = "Regiao: \(region)"
        self.delegateUserPreferences?.configureRegionLabel(region: "\(region)")
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
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 17),
            
            myTextField.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 13),
            myTextField.topAnchor.constraint(equalTo: topAnchor, constant: 31),
            myTextField.heightAnchor.constraint(equalToConstant: 35),
            myTextField.widthAnchor.constraint(equalToConstant: 120),
            
            labelRegion.topAnchor.constraint(equalTo: myTextField.bottomAnchor),
            labelRegion.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 13),
            
            buttonChangeRegion.leadingAnchor.constraint(equalTo: labelRegion.trailingAnchor, constant: 20),
            buttonChangeRegion.centerYAnchor.constraint(equalTo: labelRegion.centerYAnchor)

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
        
        myTextField.resignFirstResponder()
        return true
    }
}


extension UserInformationView{
    public func cofigure(with regionUser: String){
        self.labelRegion.text = "Região: \(regionUser)"
    }
}


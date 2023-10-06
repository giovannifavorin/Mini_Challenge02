//
//  PerfilMainView.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 26/09/23.
//

import UIKit

class PerfilMainView: UIView {

    private var size = UIScreen.main.bounds.size
        
    lazy var labelPerfil: UILabel = {
        let label = UILabel()
        label.text = "Perfil"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textColor = .black
        return label
    }()
    
    lazy var userInformationView: UserInformationView = {
        let view = UserInformationView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var collectionView: AvatarColletionView = {
        let colletion = AvatarColletionView()
        colletion.backgroundColor = UIColor(named: "backgroundColor")
        colletion.translatesAutoresizingMaskIntoConstraints = false
        return colletion
    }()
    
    private lazy var labelSelectAvatar: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .semibold)
//        label.font = UIFont(name: "Hero.ttf", size: 30)
        label.text = "Selecione seu avatar"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupViewModel()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension PerfilMainView: ViewModel {
    func addViews() {
        addSubviewsEx(userInformationView, labelSelectAvatar, collectionView, labelPerfil)
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            // Restrições para userInformationView
            userInformationView.topAnchor.constraint(equalTo: topAnchor),
            userInformationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userInformationView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            userInformationView.heightAnchor.constraint(equalToConstant: size.height*0.57)
            userInformationView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.57)
//            userInformationView.heightAnchor.
        ])

        NSLayoutConstraint.activate([
            // Restrições para labelSelectAvatar
            labelSelectAvatar.topAnchor.constraint(equalTo: userInformationView.bottomAnchor, constant: 20),
            labelSelectAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22.5),
           
            // Restrições para collectionView
            collectionView.topAnchor.constraint(equalTo: labelSelectAvatar.bottomAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22.5),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22.5),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    func setupStyle() {
        backgroundColor = UIColor(named: "backgroundColor")
    }
}



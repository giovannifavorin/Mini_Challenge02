//
//  PerfilMainView.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 26/09/23.
//

import UIKit

class PerfilMainView: UIView {

    private var size = UIScreen.main.bounds.size
        
    private lazy var labelPerfil: UILabel = {
        let label = UILabel()
        label.text = "Perfil"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
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
        label.font = UIFont(name: "Hero.ttf", size: 30)
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
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            contrainsiPad()
        }else if UIDevice.current.userInterfaceIdiom == .phone{
            contrainsiPhone()
        }
    }
    
    func setupStyle() {
        backgroundColor = UIColor(named: "backgroundColor")
    }
}

extension PerfilMainView{
    private func contrainsiPhone(){
        NSLayoutConstraint.activate([
            
            labelPerfil.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            labelPerfil.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // Restrições para userInformationView
            userInformationView.topAnchor.constraint(equalTo: topAnchor),
            userInformationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userInformationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            userInformationView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1.27)
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
    
    
    private func contrainsiPad(){
        labelSelectAvatar.font = .systemFont(ofSize: 30, weight: .semibold)
        
        NSLayoutConstraint.activate([
            
            labelPerfil.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            labelPerfil.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            // Restrições para userInformationView
            userInformationView.topAnchor.constraint(equalTo: topAnchor),
            userInformationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            userInformationView.trailingAnchor.constraint(equalTo: trailingAnchor),
            userInformationView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.7)
        ])

        NSLayoutConstraint.activate([
            // Restrições para labelSelectAvatar
            labelSelectAvatar.topAnchor.constraint(equalTo: userInformationView.bottomAnchor, constant: 65),
            labelSelectAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 147.11),
           
            // Restrições para collectionView
            collectionView.topAnchor.constraint(equalTo: labelSelectAvatar.bottomAnchor, constant: 10),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -177.11),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 177.11),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
}



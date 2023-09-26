//
//  PerfilMainView.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 26/09/23.
//

import UIKit

class PerfilMainView: UIView {

    private var size = UIScreen.main.bounds.size
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Perfil"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userInformationView: UserInformation = {
        let view = UserInformation()
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubviewsEx(label, userInformationView)
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            
            userInformationView.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 36),
            userInformationView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            userInformationView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            userInformationView.widthAnchor.constraint(equalToConstant: 348),
            userInformationView.heightAnchor.constraint(equalToConstant: 194)
        ])
    }
    
    func setupStyle() {
        backgroundColor = UIColor(named: "backgroundColor")

    }
}



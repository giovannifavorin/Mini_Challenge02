//
//  InventoryMainView.swift
//  FalaTu
//
//  Created by Leonardo Mota on 06/10.
//

import UIKit

class InventoryMainView: UIView {

    private var size = UIScreen.main.bounds.size

    override init(frame: CGRect){
        super.init(frame: frame)

        setupViewModel()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension InventoryMainView: ViewModel {
    func addViews() {
        //addSubviewsEx(userInformationView, labelSelectAvatar, collectionView, labelPerfil)
        //addSubview(labelInventario)
        //addSubview(labelRegioesBrasileiras)
    }

    func addContrains() {
        NSLayoutConstraint.activate([
            
            // Restrições para userInformationView
//            userInformationView.topAnchor.constraint(equalTo: topAnchor),
//            userInformationView.leadingAnchor.constraint(equalTo: leadingAnchor),
//            userInformationView.trailingAnchor.constraint(equalTo: trailingAnchor),
//            userInformationView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.57)
        ])

        NSLayoutConstraint.activate([
            // Restrições para labelSelectAvatar
//            labelSelectAvatar.topAnchor.constraint(equalTo: userInformationView.bottomAnchor, constant: 20),
//            labelSelectAvatar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22.5),

            // Restrições para collectionView
//            collectionView.topAnchor.constraint(equalTo: labelSelectAvatar.bottomAnchor, constant: 10),
//            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -22.5),
//            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 22.5),
//            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }

    func setupStyle() {
        backgroundColor = UIColor(named: "backgroundColor")
    }
}



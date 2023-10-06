//
//  MapaDivisoesView.swift
//  FalaTu
//
//  Created by Leonardo Mota on 05/10/23.
//

import UIKit

class MapaDivisoesView: UIView {
    
    // NORTE
    private lazy var image_Norte: UIImageView = {
        let image_Norte = UIImageView()
        image_Norte.image = UIImage(named: "map_norte")
        image_Norte.translatesAutoresizingMaskIntoConstraints = false
        image_Norte.contentMode = .scaleAspectFit
        return image_Norte
    }()
    
    // NORDESTE
    private lazy var image_Nordeste: UIImageView = {
        let image_Nordeste = UIImageView()
        image_Nordeste.image = UIImage(named: "map_nordeste")
        image_Nordeste.translatesAutoresizingMaskIntoConstraints = false
        return image_Nordeste
    }()
    
    // CENTRO-OESTE
    private lazy var image_CentroOeste: UIImageView = {
        let image_CentroOeste = UIImageView()
        image_CentroOeste.image = UIImage(named: "map_centrooeste")
        image_CentroOeste.translatesAutoresizingMaskIntoConstraints = false
        return image_CentroOeste
    }()
    
    // SUDESTE
    private lazy var image_Sudeste: UIImageView = {
        let image_Sudeste = UIImageView()
        image_Sudeste.image = UIImage(named: "map_sudeste")
        image_Sudeste.translatesAutoresizingMaskIntoConstraints = false
        return image_Sudeste
    }()
    
    // SUL
    private lazy var image_Sul: UIImageView = {
        let image_Sul = UIImageView()
        image_Sul.image = UIImage(named: "map_sul")
        image_Sul.translatesAutoresizingMaskIntoConstraints = false
        return image_Sul
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewModel()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}

extension MapaDivisoesView: ViewModel {
    func addViews() {
        addSubview(image_Norte)
//        addSubview(image_Nordeste)
//        addSubview(image_CentroOeste)
//        addSubview(image_Sudeste)
//        addSubview(image_Sul)
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            image_Norte.centerYAnchor.constraint(equalTo: centerYAnchor),
            image_Norte.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            image_Norte.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            //image_Norte.centerXAnchor.constraint(equalTo: centerXAnchor),
            //image_Norte.centerYAnchor.constraint(equalTo: centerYAnchor),
            
//            image_Nordeste.centerXAnchor.constraint(equalTo: centerXAnchor),
//            image_Nordeste.centerYAnchor.constraint(equalTo: centerYAnchor),
//            
//            image_CentroOeste.centerXAnchor.constraint(equalTo: centerXAnchor),
//            image_CentroOeste.centerYAnchor.constraint(equalTo: centerYAnchor),
//            
//            image_Sudeste.centerXAnchor.constraint(equalTo: centerXAnchor),
//            image_Sudeste.centerYAnchor.constraint(equalTo: centerYAnchor),
//            
//            image_Sul.centerXAnchor.constraint(equalTo: centerXAnchor),
//            image_Sul.centerYAnchor.constraint(equalTo: centerYAnchor),  
        ])
    }
    
    func setupStyle() {
        image_Norte.backgroundColor = .red
    }
}

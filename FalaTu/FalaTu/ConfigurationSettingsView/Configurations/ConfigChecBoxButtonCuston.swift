//
//  ConfigChecBoxButtonCuston.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 11/10/23.
//

import UIKit

class ConfigChecBoxButtonCuston: UIButton {
    
    private var checkImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "box-closed")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    init() {
        super.init(frame: .zero)
        addConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ConfigChecBoxButtonCuston{
    
    public func togleAsset(isChecked: Bool?){
        
        if isChecked!{
            checkImage.image = UIImage(named: "box-select") ?? UIImage(named: "asset")!
            
        }else{
            checkImage.image = UIImage(named: "box-closed") ?? UIImage(named: "asset")!
            
        }
    }
    
    private func addConstraint(){
        addSubview(checkImage)
        NSLayoutConstraint.activate([
            checkImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            checkImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkImage.heightAnchor.constraint(equalToConstant: 30),
            checkImage.widthAnchor.constraint(equalToConstant: 30),
        ])
    }
}

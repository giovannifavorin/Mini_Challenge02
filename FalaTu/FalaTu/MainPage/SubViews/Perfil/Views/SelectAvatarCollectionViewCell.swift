//
//  SelectAvatarCollectionViewCell.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 30/09/23.
//

import UIKit

class SelectAvatarCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SelectAvatarCollectionViewCell"
    
    private let size = UIScreen.main.bounds.size
    
    lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.layer.cornerRadius = 15
        image.backgroundColor = UIColor(named: "ColorBack_cellColletionPerfil")
        image.layer.borderColor = UIColor(named: "ColorBack_cellColletionPerfilBprder")?.cgColor
        image.layer.borderWidth = 4
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension SelectAvatarCollectionViewCell: ViewModel{
    func addViews() {
        addSubviewsEx(imageView)
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

extension SelectAvatarCollectionViewCell{
    private func contrainsiPhone(){
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 75),
            imageView.widthAnchor.constraint(equalToConstant: 75)
        ])
    }
    
    
    private func contrainsiPad(){
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}

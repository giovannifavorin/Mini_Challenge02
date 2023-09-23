//
//  MenuCollectioViewCell.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 22/09/23.
//

import UIKit

class MenuCollectioViewCell: UICollectionViewCell {
    
    
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.width
    
    static let identifier = "MenuCollectioViewCell"
    
    //minigame cell image
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "questionmark")
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 15
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Jogar", for: .normal)
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 23
//        button.addTarget(self, action: <#T##Selector#>, for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        print("entrei na viewcell menu")
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension MenuCollectioViewCell: ViewModel{
    func addViews() {
        addSubviewsEx(imageView, button)
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            imageView.widthAnchor.constraint(equalToConstant: width/2),
            imageView.heightAnchor.constraint(equalToConstant: height/2),
            
            button.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 26),
            button.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            button.widthAnchor.constraint(equalTo: imageView.widthAnchor),
            button.heightAnchor.constraint(equalToConstant: 54.77)

        ])
    }
    
    func setupStyle() {
//        backgroundColor = .cyan
    }
}


extension MenuCollectioViewCell{
    public func configure(with image: UIImage){
        self.imageView.image = image
    }
}


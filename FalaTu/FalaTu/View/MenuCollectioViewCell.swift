//
//  MenuCollectioViewCell.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 22/09/23.
//

import UIKit

class MenuCollectioViewCell: UICollectionViewCell {
    
    
    let size = UIScreen.main.bounds.size
    
    static let identifier = "MenuCollectioViewCell"
    
    //minigame cell image
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "questionmark")
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 15
        image.clipsToBounds = true
        image.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
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
    
    private lazy var mylabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.backgroundColor = .white
        label.textAlignment = .center
        label.font.withSize(24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var viewBase: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        addSubviewsEx(imageView, button, mylabel)
    }
    
    func addContrains() {
        print("Tamanho width na cell: \(size.width)")
        print("Tamanho height na cell: \(size.height)")

        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            mylabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            mylabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            mylabel.widthAnchor.constraint(equalTo: imageView.widthAnchor),
            
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
    public func configure(with image: UIImage, and text: String){
        self.imageView.image = image
        self.mylabel.text = text
    }
}


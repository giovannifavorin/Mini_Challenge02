//
//  MenuCollectioViewCell.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 22/09/23.
//

import UIKit

class MenuCollectioViewCell: UICollectionViewCell {
    
    static let identifier = "MenuCollectioViewCell"
    
    let size = UIScreen.main.bounds.size
    
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
    
    
    private lazy var mylabel: UILabel = {
        let label = UILabel()
        label.text = "Error"
        label.backgroundColor = .white
        label.textColor = .black
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.clipsToBounds = true
        label.layer.cornerRadius = 15
        label.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Jogar", for: .normal)
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor.black.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 24)
        button.backgroundColor = .darkGray
        button.layer.cornerRadius = 23
        button.tag = 0
        button.addTarget(self, action: #selector(actionBitton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    weak var delegateButton: DelegatebuttonColletionViewModel?
    
    override init(frame: CGRect){
        super.init(frame: frame)
        print("entrei na viewcell menu")
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func actionBitton(_ sender: UIButton!){
        delegateButton?.didButton(tag: sender.tag)
    }
    
}


extension MenuCollectioViewCell: ViewModel{
    func addViews() {
        addSubviewsEx(imageView, button, mylabel)
    }
    
    func addContrains() {
        print("Tamanho width na cell: \(size.width)")
        print("Tamanho height na cell: \(size.height)")
        print("Tamanho width na cellllll: \(size.height * 0.06)")

        
        NSLayoutConstraint.activate([
            imageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            imageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5),
            
            mylabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            mylabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            mylabel.widthAnchor.constraint(equalTo: imageView.widthAnchor),
            mylabel.heightAnchor.constraint(equalToConstant: (852 * 0.06) ),
            
            button.topAnchor.constraint(equalTo: mylabel.bottomAnchor, constant: 20),
            button.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            button.widthAnchor.constraint(equalTo: imageView.widthAnchor),
            button.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    func setupStyle() {
//        backgroundColor = .cyan
    }
}


extension MenuCollectioViewCell{
    public func configure(with image: UIImage, and text: String, and tag: Int){
        self.imageView.image = image
        self.mylabel.text = text
        self.button.tag = tag
    }
}


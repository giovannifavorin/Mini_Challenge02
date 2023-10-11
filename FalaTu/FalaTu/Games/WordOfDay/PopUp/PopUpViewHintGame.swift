//
//  PopUpView.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 03/10/23.
//

import UIKit

class PopUpViewHintGame: UIView {

    let size = UIScreen.main.bounds.size
    weak var delegateButton: DelegatePopUPhint?
    
    private lazy var backGround: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "PopUphit")
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor(named: "stroke_popUpHint")?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelHint: UILabel = {
        let label = UILabel()
        label.text = "Dica"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelWhichHint: UILabel = {
        let label = UILabel()
        label.text = "\"Tem em casa\""
        label.font = .systemFont(ofSize: 20, weight: .medium)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Perfil_mascote")
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFit
        image.layer.cornerRadius = 68.5
        image.backgroundColor = UIColor(named: "BackGroundProfilePopUpHint")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var buttonBack: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        button.tag = 10
        button.addTarget(self, action: #selector(actionBitton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func actionBitton(_ sender: UIButton!){
        print("sair")
        self.delegateButton?.didButton()
    }
}


extension PopUpViewHintGame: ViewModel{
    func addViews() {
        addSubviewsEx(backGround, imageView, buttonBack, labelHint, labelWhichHint)
    }
    
    func addContrains() {
        if UIDevice.current.userInterfaceIdiom == .pad{
            contrainsiPad()
        }else if UIDevice.current.userInterfaceIdiom == .phone{
            contrainsiPhone()
        }
    }
    
    func setupStyle() {
        backgroundColor = .clear.withAlphaComponent(0.6)
    }
    
    public func configure(hint: String){
        self.labelWhichHint.text = "\"\(hint)\""
    }
}


extension PopUpViewHintGame{
    private func contrainsiPhone(){
        NSLayoutConstraint.activate([
            backGround.centerXAnchor.constraint(equalTo: centerXAnchor),
            backGround.centerYAnchor.constraint(equalTo: centerYAnchor),
//            backGround.leadingAnchor.constraint(equalTo: leadingAnchor),
//            backGround.trailingAnchor.constraint(equalTo: trailingAnchor),
            backGround.heightAnchor.constraint(equalToConstant: 167),
            backGround.widthAnchor.constraint(equalToConstant: size.width),
            
            imageView.topAnchor.constraint(equalTo: backGround.topAnchor, constant: 21),
            imageView.leadingAnchor.constraint(equalTo: backGround.leadingAnchor, constant: 30),
            imageView.heightAnchor.constraint(equalToConstant: 137),
            imageView.widthAnchor.constraint(equalToConstant: 137),
            
            buttonBack.topAnchor.constraint(equalTo: backGround.topAnchor, constant: -15),
            buttonBack.trailingAnchor.constraint(equalTo: backGround.trailingAnchor),
            buttonBack.widthAnchor.constraint(equalToConstant: 40),
            buttonBack.heightAnchor.constraint(equalToConstant: 40),
            
            labelHint.topAnchor.constraint(equalTo: backGround.topAnchor, constant: 48),
            labelHint.trailingAnchor.constraint(equalTo: backGround.trailingAnchor, constant: -82),
            
            labelWhichHint.topAnchor.constraint(equalTo: labelHint.bottomAnchor, constant: 16),
            labelWhichHint.centerXAnchor.constraint(equalTo: labelHint.centerXAnchor),
            
        ])
    }
    
    
    private func contrainsiPad(){
        NSLayoutConstraint.activate([
            backGround.centerXAnchor.constraint(equalTo: centerXAnchor),
            backGround.centerYAnchor.constraint(equalTo: centerYAnchor),
//            backGround.leadingAnchor.constraint(equalTo: leadingAnchor),
//            backGround.trailingAnchor.constraint(equalTo: trailingAnchor),
            backGround.heightAnchor.constraint(equalToConstant: 167),
            backGround.widthAnchor.constraint(equalToConstant: size.width),
            
            imageView.topAnchor.constraint(equalTo: backGround.topAnchor, constant: 21),
            imageView.leadingAnchor.constraint(equalTo: backGround.leadingAnchor, constant: -17),
            imageView.heightAnchor.constraint(equalToConstant: 137),
            imageView.widthAnchor.constraint(equalToConstant: 137),
            
            buttonBack.topAnchor.constraint(equalTo: backGround.topAnchor, constant: -15),
            buttonBack.trailingAnchor.constraint(equalTo: backGround.trailingAnchor),
            buttonBack.widthAnchor.constraint(equalToConstant: 40),
            buttonBack.heightAnchor.constraint(equalToConstant: 40),
            
            labelHint.topAnchor.constraint(equalTo: backGround.topAnchor, constant: 48),
            labelHint.trailingAnchor.constraint(equalTo: backGround.trailingAnchor, constant: -116),
            
            labelWhichHint.topAnchor.constraint(equalTo: labelHint.bottomAnchor, constant: 16),
            labelWhichHint.centerXAnchor.constraint(equalTo: labelHint.centerXAnchor),
            
        ])
    }
}


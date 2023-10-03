//
//  PopUpView.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 03/10/23.
//

import UIKit

class PopUpView: UIView {

    let size = UIScreen.main.bounds.size
    weak var delegateButton: DelegatePopUPhint?
    
    
    private lazy var backGround: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "PopUphit")
        view.clipsToBounds = true
        view.layer.cornerRadius = 20
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
        image.image = UIImage(named: "CariocaHint")
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 68.5

        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var buttonBack: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.backgroundColor = UIColor(named: "CancelColor")
        button.layer.cornerRadius = 20
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


extension PopUpView: ViewModel{
    func addViews() {
        addSubviewsEx(backGround, imageView, buttonBack, labelHint, labelWhichHint)
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            backGround.bottomAnchor.constraint(equalTo: bottomAnchor),
            backGround.leadingAnchor.constraint(equalTo: leadingAnchor),
            backGround.trailingAnchor.constraint(equalTo: trailingAnchor),
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
    
    func setupStyle() {
        backgroundColor = .clear.withAlphaComponent(0.6)
    }
    
    public func configure(hint: String){
        self.labelWhichHint.text = "\"\(hint)\""
    }
}

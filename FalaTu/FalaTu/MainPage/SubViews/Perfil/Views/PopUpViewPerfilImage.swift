//
//  PopUpView.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 30/09/23.
//

import UIKit

class PopUpViewPerfilImage: UIView {
    let defaults = UserDefaults.standard
    
    weak var delegatePopUp: DelegatePopUpView?
    
    
    private lazy var cellPopUp: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "bg_PopUpPerfil")
        view.clipsToBounds = true
        view.layer.cornerRadius = 24
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor(named: "bg_PopUpPerfil_Corner")?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var labelAvatarBlocked: UILabel = {
        let label = UILabel()
//        label.font = UIFont(name: "Hore.ttf", size: 32)
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.text = "Avatar\nBloqueado!"
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var labelWordHits: UILabel = {
        let label = UILabel()
        label.text = "0 / 5 palavras"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "asset")
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 53.5
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    private lazy var labelState: UILabel = {
        let label = UILabel()
        label.text = "Estado: Amazonas"
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var buttonBack: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        button.tag = 10
        button.addTarget(self, action: #selector(actionBitton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    private lazy var buttonSelect: UIButton = {
        let button = UIButton()
        button.setTitle("Selecionar", for: .normal)
        button.layer.borderWidth = 3
        button.layer.borderColor = UIColor(named: "Border_button_Select")?.cgColor
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.backgroundColor = UIColor(named: "button_Select_Blocked")
        button.layer.cornerRadius = 25
        button.tag = 1
        button.addTarget(self, action: #selector(actionBitton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func actionBitton(_ sender: UIButton!){
        buttonBack.addHapticFeedback(type: .error)
        self.delegatePopUp?.didButon(tag: sender.tag)
    }
    
}


extension PopUpViewPerfilImage: ViewModel{
    func addViews() {
        addSubviewsEx(cellPopUp, buttonBack, labelAvatarBlocked, labelWordHits, imageView, labelState, buttonSelect)
    }
    
    func addContrains() {
        
        NSLayoutConstraint.activate([
            cellPopUp.centerXAnchor.constraint(equalTo: centerXAnchor),
            cellPopUp.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellPopUp.heightAnchor.constraint(equalToConstant: 400),
            cellPopUp.widthAnchor.constraint(equalToConstant: 300),
            
            buttonBack.centerYAnchor.constraint(equalTo: cellPopUp.topAnchor, constant: 10),
            buttonBack.centerXAnchor.constraint(equalTo: cellPopUp.trailingAnchor, constant: -3),
            buttonBack.widthAnchor.constraint(equalToConstant: 60),
            buttonBack.heightAnchor.constraint(equalToConstant: 60),
            
            labelAvatarBlocked.topAnchor.constraint(equalTo: cellPopUp.topAnchor, constant: 21),
            labelAvatarBlocked.centerXAnchor.constraint(equalTo: cellPopUp.centerXAnchor),
            
            labelWordHits.topAnchor.constraint(equalTo: labelAvatarBlocked.bottomAnchor, constant: 15),
            labelWordHits.centerXAnchor.constraint(equalTo: labelAvatarBlocked.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: labelWordHits.bottomAnchor, constant: 23),
            imageView.centerXAnchor.constraint(equalTo: labelWordHits.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.widthAnchor.constraint(equalToConstant: 100),
            
            labelState.bottomAnchor.constraint(equalTo: buttonSelect.topAnchor, constant: -13),
            labelState.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            
            buttonSelect.bottomAnchor.constraint(equalTo: cellPopUp.bottomAnchor, constant: -32),
            buttonSelect.centerXAnchor.constraint(equalTo: labelState.centerXAnchor),
            buttonSelect.heightAnchor.constraint(equalToConstant: 54.77),
            buttonSelect.widthAnchor.constraint(equalToConstant: 235.34),
            
            
        ])

    }
    
    func setupStyle() {
        backgroundColor = .black.withAlphaComponent(0.6)
    }
}


extension PopUpViewPerfilImage{
    public func configure(labelAvatarBlocked: String, labelWordHits: String, labelState: String, imageAvatarView: UIImage, tag: Int){
        self.labelAvatarBlocked.text = labelAvatarBlocked
        self.labelWordHits.text = labelWordHits
        self.labelState.text = labelState
        self.imageView.image = imageAvatarView
        self.buttonSelect.tag = tag
    }
    
    
    public func configureButton(isBlocked: Bool){
        if isBlocked{
            print("ativo")
            buttonSelect.isEnabled = true
            buttonSelect.backgroundColor = UIColor(named: "button_Select_Active")
            buttonSelect.setTitleColor(.white, for: .normal)
            UIImpactFeedbackGenerator.feedback(for: .medium)
        }else {
            
            print("Bloqueado")
            buttonSelect.backgroundColor = UIColor(named: "button_Select_Blocked")
            buttonSelect.setTitleColor(.black.withAlphaComponent(0.1), for: .normal)
            buttonSelect.layer.borderColor = UIColor(named: "button_Select_Blocked")?.cgColor
            buttonSelect.isEnabled = false
            buttonBack.addHapticFeedback(type: .error)
        }
    }
    
    public func getImageValue() -> UIImage{
        return self.imageView.image ?? (UIImage(named: "asset")!)
    }
}

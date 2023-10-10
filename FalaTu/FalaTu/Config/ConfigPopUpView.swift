//
//  ConfigPopUpView.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 09/10/23.
//

import UIKit

class ConfigPopUpView: UIView {

    private lazy var buttonBack: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.backgroundColor = UIColor(named: "CancelColor")
//        button.backgroundColor = .red
        button.layer.cornerRadius = 20
        button.tag = 11
//        button.addTarget(self, action: #selector(actionBitton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    private lazy var backGround: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 25
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var imageTopPopUp: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "imageTopPopUp")
        image.clipsToBounds = false
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var labelTopPopUp: UILabel = {
        let label = UILabel()
        label.text = "Configuração"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bottonView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "bg_PopUpPerfil")
        view.clipsToBounds = true
        view.layer.cornerRadius = 25
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var checkVibrate: CheckboxConfig = {
        let check = CheckboxConfig(text: "Vibração")
        check.translatesAutoresizingMaskIntoConstraints = false
        return check
    }()
    
    private lazy var checkModeDark: CheckboxConfig = {
        let check = CheckboxConfig(text: "Modo Escuro")
        check.translatesAutoresizingMaskIntoConstraints = false
        return check
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewModel()
        didTapCheckboxWithTitle()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func integrateTapGestures() {
        let gesture = UITapGestureRecognizer(target: self, action: #selector(didTapCheckboxWithTitle))
        checkVibrate.addGestureRecognizer(gesture)
    }
    
    @objc 
    private func didTapCheckboxWithTitle() {
        print("asdfhkjdlsnf,msnkdjskf")
        checkVibrate.toggle()
        
        if checkVibrate.isChecked == true {
            print("Unchecked")
        } else {
            print("Checked")
        }
    }
}


extension ConfigPopUpView: ViewModel{
    func addViews() {
        addSubviewsEx(backGround, buttonBack/*, imageTopPopUp*/, labelTopPopUp, bottonView, checkVibrate, checkModeDark)
    }
    
    func addContrains() {
        if UIDevice.current.userInterfaceIdiom == .pad{
            contrainsiPad()
        }else if UIDevice.current.userInterfaceIdiom == .phone{
            contrainsiPhone()
        }
    }
    
    func setupStyle() {
//        backgroundColor = .black.withAlphaComponent(0.6)
        backgroundColor = .red
    }
}


extension ConfigPopUpView{
    private func contrainsiPhone(){
        NSLayoutConstraint.activate([
            backGround.centerXAnchor.constraint(equalTo: centerXAnchor),
            backGround.centerYAnchor.constraint(equalTo: centerYAnchor),
            backGround.heightAnchor.constraint(equalToConstant: 400),
            backGround.widthAnchor.constraint(equalToConstant: 300),
            
            buttonBack.centerYAnchor.constraint(equalTo: backGround.topAnchor, constant: 10),
            buttonBack.centerXAnchor.constraint(equalTo: backGround.trailingAnchor, constant: -3),
            buttonBack.widthAnchor.constraint(equalToConstant: 50),
            buttonBack.heightAnchor.constraint(equalToConstant: 50),
            
//            imageTopPopUp.topAnchor.constraint(equalTo: backGround.topAnchor),
//            imageTopPopUp.leadingAnchor.constraint(equalTo: backGround.leadingAnchor),
//            imageTopPopUp.trailingAnchor.constraint(equalTo: backGround.trailingAnchor),
//            imageTopPopUp.heightAnchor.constraint(equalToConstant: 20),
    
            
            labelTopPopUp.topAnchor.constraint(equalTo: backGround.topAnchor, constant: 34),
            labelTopPopUp.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            bottonView.bottomAnchor.constraint(equalTo: backGround.bottomAnchor),
            bottonView.leadingAnchor.constraint(equalTo: backGround.leadingAnchor),
            bottonView.trailingAnchor.constraint(equalTo: backGround.trailingAnchor),
            bottonView.heightAnchor.constraint(equalToConstant: 125),

        ])
        
        
        NSLayoutConstraint.activate([
            checkVibrate.centerYAnchor.constraint(equalTo: backGround.centerYAnchor),
            checkVibrate.heightAnchor.constraint(equalToConstant: 100),
            checkVibrate.leadingAnchor.constraint(equalTo: backGround.leadingAnchor, constant: 43),
            checkVibrate.trailingAnchor.constraint(equalTo: backGround.trailingAnchor, constant: -43),

            checkModeDark.topAnchor.constraint(equalTo: labelTopPopUp.bottomAnchor, constant: 150),
            checkModeDark.heightAnchor.constraint(equalToConstant: 100),
            checkModeDark.leadingAnchor.constraint(equalTo: backGround.leadingAnchor, constant: 43),
            checkModeDark.trailingAnchor.constraint(equalTo: backGround.trailingAnchor, constant: -43),
        ])
    }
    
    
    private func contrainsiPad(){
        
    }
}

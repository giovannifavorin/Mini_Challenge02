//
//  ConfigPopUpView.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 09/10/23.
//

import UIKit

class ConfigPopUpView: UIView {

    weak var delegateConfigView: DelegateConfigView?
    let userDefault = UserDefaults.standard
    
    private lazy var buttonBack: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Hore", size: 27)
        button.backgroundColor = UIColor(named: "CancelColor")
        button.layer.cornerRadius = 25
        button.tag = 0
        button.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    private lazy var creditbutton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "button_credits"), for: .normal)
        button.tag = 1
        button.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    
    lazy var checkModeDark: CheckboxConfig = {
        let check = CheckboxConfig(text: "Modo Escuro",
                                   image: UIImage(named: "darkmode")
                                   ?? UIImage(named: "asset")!)
        
        check.checkbutton.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        check.checkbutton.tag = 2
        check.translatesAutoresizingMaskIntoConstraints = false
        return check
    }()
    
    
    private lazy var checkVibrate: CheckboxConfig = {
        let check = CheckboxConfig(text: "Vibração",
                                   image: UIImage(named: "vibration")
                                   ?? UIImage(named: "asset")!)
        
        check.checkbutton.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        check.checkbutton.tag = 3
        check.translatesAutoresizingMaskIntoConstraints = false
        return check
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
        label.font = UIFont(name: "Hore", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bottonImageForPopUp: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "bg_PopUpPerfil")
        view.clipsToBounds = true
        view.layer.cornerRadius = 25
        view.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
   
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewModel()
        updateIConConfig()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc
    private func didButton(_ sender: UIButton!){
        if sender.tag == 0 || sender.tag == 1{
            //delegate que sai do pop up caso for 0 e se for 1 chama creditview
            self.delegateConfigView?.didBackbutton(tag: sender.tag)
            
        } else if  sender.tag == 2{
            self.delegateConfigView?.didCheckButtonChangeThema()
            updateIConConfig()
            
        } else if sender.tag == 3{
            self.delegateConfigView?.didCheckButtonVibrate()
            updateIConConfig()
            
        } else{
            fatalError("error in didButton from ConfigPopUpView")
        }
    }
    
    func updateIConConfig(){
        self.addHapticFeedback(type: .success)
        let checkModeDarkButton = userDefault.isDarMode.isDarMode
        let checkModeVibrate = userDefault.isVibrate
        
        self.checkModeDark.checkbutton.togleAsset(isChecked: checkModeDarkButton)
        
        self.checkVibrate.checkbutton.togleAsset(isChecked: checkModeVibrate)
    }
}


extension ConfigPopUpView: ViewModel{
    func addViews() {
        addSubviewsEx(backGround, imageTopPopUp, buttonBack, labelTopPopUp, bottonImageForPopUp, checkVibrate, checkModeDark, creditbutton)
    }
    
    func addContrains() {
        if UIDevice.current.userInterfaceIdiom == .pad{
            contrainsiPad()
        }else if UIDevice.current.userInterfaceIdiom == .phone{
            contrainsiPhone()
        }
    }
    
    func setupStyle() {
        backgroundColor = .black.withAlphaComponent(0.6)
    }
}


extension ConfigPopUpView{
    private func contrainsiPhone(){
        NSLayoutConstraint.activate([
            backGround.centerXAnchor.constraint(equalTo: centerXAnchor),
            backGround.centerYAnchor.constraint(equalTo: centerYAnchor),
            backGround.heightAnchor.constraint(equalToConstant: 400),
            backGround.widthAnchor.constraint(equalToConstant: 300),
            
            buttonBack.centerYAnchor.constraint(equalTo: backGround.topAnchor, constant: -50),
            buttonBack.centerXAnchor.constraint(equalTo: backGround.trailingAnchor, constant: -3),
            buttonBack.widthAnchor.constraint(equalToConstant: 50),
            buttonBack.heightAnchor.constraint(equalToConstant: 50),
            
            imageTopPopUp.topAnchor.constraint(equalTo: backGround.topAnchor),
            imageTopPopUp.leadingAnchor.constraint(equalTo: backGround.leadingAnchor),
            imageTopPopUp.trailingAnchor.constraint(equalTo: backGround.trailingAnchor),
            imageTopPopUp.heightAnchor.constraint(equalToConstant: 20),
    
            
//            labelTopPopUp.topAnchor.constraint(equalTo: backGround.topAnchor),
            labelTopPopUp.centerYAnchor.constraint(equalTo: imageTopPopUp.centerYAnchor),
            labelTopPopUp.centerXAnchor.constraint(equalTo: imageTopPopUp.centerXAnchor),
            
            bottonImageForPopUp.bottomAnchor.constraint(equalTo: backGround.bottomAnchor),
            bottonImageForPopUp.leadingAnchor.constraint(equalTo: backGround.leadingAnchor),
            bottonImageForPopUp.trailingAnchor.constraint(equalTo: backGround.trailingAnchor),
            bottonImageForPopUp.heightAnchor.constraint(equalToConstant: 125),
            
            
            creditbutton.bottomAnchor.constraint(equalTo: backGround.bottomAnchor, constant: -35),
            creditbutton.centerXAnchor.constraint(equalTo: backGround.centerXAnchor),
            creditbutton.widthAnchor.constraint(equalToConstant: 200),
            creditbutton.heightAnchor.constraint(equalToConstant: 60),


        ])
        
        
        NSLayoutConstraint.activate([
            checkVibrate.topAnchor.constraint(equalTo: labelTopPopUp.bottomAnchor, constant: 75),
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
        NSLayoutConstraint.activate([
            backGround.centerXAnchor.constraint(equalTo: centerXAnchor),
            backGround.centerYAnchor.constraint(equalTo: centerYAnchor),
            backGround.heightAnchor.constraint(equalToConstant: 400),
            backGround.widthAnchor.constraint(equalToConstant: 300),
            
            buttonBack.centerYAnchor.constraint(equalTo: backGround.topAnchor, constant: -50),
            buttonBack.centerXAnchor.constraint(equalTo: backGround.trailingAnchor, constant: -3),
            buttonBack.widthAnchor.constraint(equalToConstant: 50),
            buttonBack.heightAnchor.constraint(equalToConstant: 50),
            
            imageTopPopUp.topAnchor.constraint(equalTo: backGround.topAnchor),
            imageTopPopUp.leadingAnchor.constraint(equalTo: backGround.leadingAnchor),
            imageTopPopUp.trailingAnchor.constraint(equalTo: backGround.trailingAnchor),
            imageTopPopUp.heightAnchor.constraint(equalToConstant: 20),
    
            
//            labelTopPopUp.topAnchor.constraint(equalTo: backGround.topAnchor),
            labelTopPopUp.centerYAnchor.constraint(equalTo: imageTopPopUp.centerYAnchor),
            labelTopPopUp.centerXAnchor.constraint(equalTo: imageTopPopUp.centerXAnchor),
            
            bottonImageForPopUp.bottomAnchor.constraint(equalTo: backGround.bottomAnchor),
            bottonImageForPopUp.leadingAnchor.constraint(equalTo: backGround.leadingAnchor),
            bottonImageForPopUp.trailingAnchor.constraint(equalTo: backGround.trailingAnchor),
            bottonImageForPopUp.heightAnchor.constraint(equalToConstant: 125),
            
            
            creditbutton.bottomAnchor.constraint(equalTo: backGround.bottomAnchor, constant: -35),
            creditbutton.centerXAnchor.constraint(equalTo: backGround.centerXAnchor),
            creditbutton.widthAnchor.constraint(equalToConstant: 200),
            creditbutton.heightAnchor.constraint(equalToConstant: 60),


        ])
        
        
        NSLayoutConstraint.activate([
            checkVibrate.topAnchor.constraint(equalTo: labelTopPopUp.bottomAnchor, constant: 75),
            checkVibrate.heightAnchor.constraint(equalToConstant: 100),
            checkVibrate.leadingAnchor.constraint(equalTo: backGround.leadingAnchor, constant: 43),
            checkVibrate.trailingAnchor.constraint(equalTo: backGround.trailingAnchor, constant: -43),

            checkModeDark.topAnchor.constraint(equalTo: labelTopPopUp.bottomAnchor, constant: 150),
            checkModeDark.heightAnchor.constraint(equalToConstant: 100),
            checkModeDark.leadingAnchor.constraint(equalTo: backGround.leadingAnchor, constant: 43),
            checkModeDark.trailingAnchor.constraint(equalTo: backGround.trailingAnchor, constant: -43),
        ])
    }
}

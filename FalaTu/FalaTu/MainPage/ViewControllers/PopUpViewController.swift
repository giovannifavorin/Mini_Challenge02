//
//  PopUpViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 30/09/23.
//

import UIKit

class PopUpViewController: UIViewController {

    let defaults = UserDefaults.standard
    
    weak var delegado: DelegateUserPreferences?
    
    lazy var popUpView: PopUpViewPerfilImage = {
        return PopUpViewPerfilImage()
    }()
    
    override func loadView() {
        self.view = popUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        popUpView.delegatePopUp = self
    }
    
    private func changeImageProfile(){
        let image = popUpView.getImageValue()
        defaults.imageProfile = image
        self.delegado?.changeImage()
        dismiss(animated: false)
    }
}

extension PopUpViewController: DelegatePopUpView{
    func didButon(tag: Int) {
        switch tag{
        case 10:
        
            UIView.animate(withDuration: 1, delay: 0.0,options: .curveEaseOut) {
                self.view.alpha = 1
            }completion: { _ in
                self.dismiss(animated: false)
            }
            print("clickei em 10")
        case 0:
            print("clickei em 0")
            changeImageProfile()
            
        case 1:
            print("clickei em 2")
            changeImageProfile()
        case 2:
            print("clickei em 3")
            changeImageProfile()
            
        case 3:
            print("clickei em 4")
            changeImageProfile()
            
        case 4:
            print("clickei em 5")
            changeImageProfile()
            
        case 5:
            print("clickei em 5")
            changeImageProfile()
            
        default:
            print("invalid tag in PopUpViewController")
        }
    }
}

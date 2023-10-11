//
//  ConfigurationViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 09/10/23.
//

import UIKit


class ConfigurationViewController: UIViewController {

    private lazy var configPopUpView: ConfigPopUpView = {
        return ConfigPopUpView()
    }()
    
    override func loadView() {
        super.loadView()
        self.view = configPopUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configPopUpView.delegateConfigView = self
        self.configPopUpView.checkModeDark.delegateConfigView = self

    }
}

extension ConfigurationViewController: DelegateConfigView{
    func didBackbutton() {
        dismiss(animated: true)
    }
    
    func updateInterfaceStyle(){
        let style = AppSettings.userInterfaceStyle
        
        UIApplication.shared.windows.forEach { window in
            window.overrideUserInterfaceStyle = style
        }
    }
    
    func didCheckButtonChangeThema() {
        updateInterfaceStyle()
        print("aaaaaadjfkdsfjghfdjklglhjkdfhsgljkafsdkngfdsm,ghjldfshlkgndflm,jgndfmgd")
    }
    
}



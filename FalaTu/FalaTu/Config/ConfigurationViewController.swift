//
//  ConfigurationViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 09/10/23.
//

import UIKit


class ConfigurationViewController: UIViewController {

    let userDefaults = UserDefaults.standard
    var isDarMode: Bool?
    
    private lazy var creditViewController: CreditView = {
        return CreditView()
    }()
    
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
    }
}

extension ConfigurationViewController: DelegateConfigView{
    func didBackbutton(tag: Int) {
        switch tag{
        case 0:
            dismiss(animated: true)
        case 1:
            present(creditViewController, animated: true)
        default:
            fatalError("error in ConfigurationViewController -> didBackbutton ")
        }
    }
    
    func updateInterfaceStyle() {
        let currentIsDarMode = userDefaults.isDarMode.isDarMode
        print("valor que veio do banco e: \(currentIsDarMode)")

        let newIsDarMode = !currentIsDarMode

        userDefaults.isDarMode.isDarMode = newIsDarMode

        print("valor que salvei no banco: \(newIsDarMode)")

        // Atualiza o estilo da interface com base no novo valor
        if newIsDarMode {
            AppSettings.userInterfaceStyle = .dark
            print("Modo escuro")
        } else {
            AppSettings.userInterfaceStyle = .light
            print("Modo claro")
        }

        // Aplica o novo estilo à interface
        let style = AppSettings.userInterfaceStyle

        UIApplication.shared.windows.forEach { window in
            window.overrideUserInterfaceStyle = style
        }
    }


    
    func didCheckButtonChangeThema() {
        updateInterfaceStyle()
    }
    
}



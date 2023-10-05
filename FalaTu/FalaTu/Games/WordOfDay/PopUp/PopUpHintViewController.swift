//
//  PophintViewController.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 03/10/23.
//

import UIKit

class PopUpHintViewController: UIViewController {

    lazy var popUpView: PopUpView = {
        return PopUpView()
    }()
    
    override func loadView() {
        self.view = popUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.popUpView.delegateButton = self
    }

}


extension PopUpHintViewController: DelegatePopUPhint{
    func didButton() {
        dismiss(animated: false)

    }
}


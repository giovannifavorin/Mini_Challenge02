//
//  DelegateViewModel.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 24/09/23.
//

import Foundation


//Delegate responds by informing the controller that the button has been clicked
protocol DelegatebuttonColletionViewModel: AnyObject{
    func didButton(tag: Int)
}

protocol DelegateUserPreferences: AnyObject{
    func configureNamePerfil(name: String)
    func presentPopUP(index: IndexPath)
    func changeImage()
}

protocol DelegatePopUpView: AnyObject{
    func didButon(tag: Int)
}

protocol DelegateUpdateInButtonPerfil: AnyObject{
    func updateName(name: String)
    func updateImage()
}

protocol DelegatePopUPhint: AnyObject{
    func didButton()
}

//
//  ViewModel.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 18/09/23.
//

import Foundation
import UIKit


//Extension that allows you to add more than one view to the hierarchy in a single call. Example: addViews(label1, label2, button1, button2)
extension UIView {
    func addSubviewsEx(_ views: UIView...) {
        for view in views {
            addSubview(view)
        }
    }
}


//Funcao que ativa as vibracoes com base na preferencia do usuario.
extension UIView{
    func addHapticFeedback(type: UINotificationFeedbackGenerator.FeedbackType){
        let isVibrate = UserDefaults.standard.isVibrate!
        
        if isVibrate{
            let generetor = UINotificationFeedbackGenerator()
            generetor.notificationOccurred(type)
        }
    }
}

protocol ViewModel {
    //Add views as subviews and define the hierarchy between them
    func addViews()
    
    //Defines the constraints to be used to position the elements in the view
    func addContrains()
    
    //Defines the view styles, such as color, borders, etc.
    func setupStyle()
}

//Calls all protocol methods
extension ViewModel{
    
    func setupViewModel(){
        addViews()
        addContrains()
        setupStyle()
    }
}



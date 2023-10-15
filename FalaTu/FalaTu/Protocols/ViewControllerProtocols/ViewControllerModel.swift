//
//  ViewControllerModel.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 24/09/23.
//

import Foundation
import UIKit


// Protocol for View Controller Model
protocol ViewControllerModel {
    
    // Add subviews to the view and define their hierarchy
    func addSubviews()
    
    // Add styling to the view elements
    func addStyle()
    
    // Add constraints to position elements within the view
    func addConstraints()
    
}

// Extension to provide a default implementation
extension ViewControllerModel {
    // Method to set up the view controller model with all defined steps
    func setupViewControllerModel() {
        
        // Call the method to add subviews
        addSubviews()
        
        // Call the method to add styling
        addStyle()
        
        // Call the method to add constraints
        addConstraints()
        
    }
}

extension UIViewController{
    func addHapticFeedbackFromViewController(type: UINotificationFeedbackGenerator.FeedbackType){
        let isVibrate = UserDefaults.standard.isVibrate
        
        if isVibrate{
            let generetor = UINotificationFeedbackGenerator()
            generetor.notificationOccurred(type)
        }
    }
}

extension UIImpactFeedbackGenerator {
    static func feedback(for type: UIImpactFeedbackGenerator.FeedbackStyle) {
        let isVibrate = UserDefaults.standard.isVibrate
        
        if isVibrate {
            let generator = UIImpactFeedbackGenerator(style: type)
            generator.prepare()
            generator.impactOccurred()
        }
    }
}




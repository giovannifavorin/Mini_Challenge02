//
//  ViewControllerModel.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 24/09/23.
//

import Foundation


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


//
//  DelegateViewModel.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 24/09/23.
//

import Foundation


//Delegate responds by informing the controller that the button has been clicked
protocol DelegateViewModel: AnyObject{
    func didButton(tag: Int)
}

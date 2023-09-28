//
//  Coordinator.swift
//  FalaTu
//
//  Created by Giovanni Favorin de Melo on 26/09/23.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    func eventOcurred(with type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}

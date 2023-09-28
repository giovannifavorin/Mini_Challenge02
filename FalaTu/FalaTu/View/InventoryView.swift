//
//  InventoryView.swift
//  FalaTu
//
//  Created by Leonardo Mota on 22/09/23.
//

import Foundation
import UIKit

class InventoryView: UIView {
    
    // Views acessáveis fora da classe
    let scrollView = UIScrollView()
    let inventoryTitleLabel = UILabel()
    let regionLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
 
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}



// ====================== EXTENSIONS =========================

extension InventoryView {
    func style() {
    }
    
    func layout() {

    }
}


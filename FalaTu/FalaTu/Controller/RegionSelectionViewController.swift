//
//  RegionSelectionViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 26/09/23.
//

import UIKit

class RegionSelectionViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "REGIÕES"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Configurações gerais
        let buttonWidth: CGFloat = 200
        let buttonHeight: CGFloat = 40
        let buttonSpacing: CGFloat = 20
        let centerY = view.center.y
        
        // Crie botões representando as regiões
        for (index, region) in regions_BR.enumerated() {
            let regionButton = makeRegionButton(title: region.regionName, index: index)
            regionButton.frame = CGRect(x: (view.bounds.width - buttonWidth) / 2, y: centerY + CGFloat(index - regions_BR.count / 2) * (buttonHeight + buttonSpacing), width: buttonWidth, height: buttonHeight)
            view.addSubview(regionButton)
        }
    }
    
    private func makeRegionButton(title: String, index: Int) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.backgroundColor = .systemBlue
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(regionButtonTapped(_:)), for: .touchUpInside)
        button.tag = index
        return button
    }
    
    @objc func regionButtonTapped(_ sender: UIButton) {
        // Crie uma instância da InventoryViewController e configure-a com o índice da região selecionada
        let inventoryViewController = InventoryViewController()
        inventoryViewController.selectedRegion = regions_BR[sender.tag]
                
        navigationController?.pushViewController(inventoryViewController, animated: true)
    }
}

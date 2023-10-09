//
//  RegionSelectionViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 26/09/23.
//

import UIKit

class RegionSelectionViewController: UIViewController {
    
//    let regionCoordinates: [String: CGPoint] = [
//        "Norte": CGPoint(x: 100, y: 50),
//        "Nordeste": CGPoint(x: 200, y: 100),
//    ]

    
    private lazy var brazilImage: UIImageView = {
        let brazilImage = UIImageView()
        brazilImage.image = UIImage(named: "brazilMap")
        brazilImage.translatesAutoresizingMaskIntoConstraints = false
        brazilImage.contentMode = .scaleAspectFit
        return brazilImage
    }()
    
    private lazy var planetImage: UIImageView = {
        let brazilImage = UIImageView()
        brazilImage.image = UIImage(named: "planet")
        brazilImage.translatesAutoresizingMaskIntoConstraints = false
        brazilImage.contentMode = .scaleAspectFit
        return brazilImage
    }()

//    func setupRegionButtons() {
//        for (index, regions_BR) in regions_BR.enumerated() {
//            let regionButton = UIButton()
//            regionButton.translatesAutoresizingMaskIntoConstraints = false
//            regionButton.setTitle(regions_BR.regionName, for: .normal)
//            regionButton.addTarget(self, action: #selector(regionButtonTapped(sender:)), for: .touchUpInside)
//            regionButton.tag = index
//            
//            NSLayoutConstraint.activate([
//                regionButton.centerXAnchor.constraint(equalTo: brazilImage.leadingAnchor, constant: regionCoordinates.x),
//                regionButton.centerYAnchor.constraint(equalTo: brazilImage.topAnchor, constant: regionCoordinates.y),
//                // Adicione outras restrições conforme necessário (largura, altura, etc.)
//            ])
//        }
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllerModel()

    }
 
    @objc func regionButtonTapped(sender: UIButton) {
        let regionIndex = sender.tag
        guard regionIndex < regions_BR.count else { return } // Verifique se o índice está dentro dos limites do array

        let selectedRegion = regions_BR[regionIndex]
        let inventoryViewController = InventoryViewController()
        navigationController?.pushViewController(inventoryViewController, animated: true)
    }

}

extension RegionSelectionViewController: ViewControllerModel {
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            // Mapa do Brasil
            brazilImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 10),
            brazilImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            brazilImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            // Planeta
            planetImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            planetImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            planetImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            
        ])
    }
    
    func addSubviews() {
        view.addSubview(planetImage)
        view.addSubview(brazilImage)
    }
    
    func addStyle() {
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
}

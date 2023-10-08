//
//  StatesItemsViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 22/09/23.
//

import UIKit

class InventoryViewController: UIViewController {

    // Selected Region
    var selectedRegion: RegionModel!
    var numOfItens: Int = 0
    
    
    lazy var regionInfoView: RegionInformationView = {
        let regionInfoView = RegionInformationView()
        regionInfoView.regionTopDetails.configure(for: selectedRegion)
        regionInfoView.translatesAutoresizingMaskIntoConstraints = false
        return regionInfoView
    }()

    // ScrollView para os estados
    private lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedRegion = regions_BR[0]
        
        setupViewControllerModel()
        
        createAllStatesWithItems()
    }

    private func createAllStatesWithItems() {
        var previousItemsStackView: UIStackView?
        for state in selectedRegion.states {
        
            let itemsStackView = createItemsStackView(withStateName: state.stateName, numOfItemsUnlocked: state.numberOfItemsUnlocked)
            scrollView.addSubview(itemsStackView)
        
            itemsStackView.translatesAutoresizingMaskIntoConstraints = false
        
            NSLayoutConstraint.activate([
                // Distância entre um estado e outro dentro do inventário
                itemsStackView.topAnchor.constraint(equalTo: previousItemsStackView?.bottomAnchor ?? scrollView.topAnchor),
                itemsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
            previousItemsStackView = itemsStackView
        }
            
        // Configurar ContentSize da ScrollView
        scrollView.contentSize = CGSize(width: view.frame.width, height: CGFloat(selectedRegion.states.count) * 240)
    }
}

extension InventoryViewController : ViewControllerModel {
    func addSubviews() {
        view.addSubview(regionInfoView)
        view.addSubview(scrollView)

    }
    
    func addStyle() {
        // Cor de fundo da view Inventário
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            regionInfoView.topAnchor.constraint(equalTo: view.topAnchor),
            regionInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            regionInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            regionInfoView.heightAnchor.constraint(equalToConstant: 380),
        ])
        
        // Adicionar restrições para o scrollView abaixo da RegionInformationView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: regionInfoView.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func createItemsStackView(withStateName stateName: String, numOfItemsUnlocked numOfItems: Int) -> UIStackView {
        let screenWidth = view.frame.size.width

        let itemsStackView = UIStackView()
        itemsStackView.axis = .vertical
        itemsStackView.spacing = screenWidth/42 // distância entre fileiras (3x o cornerRadius)
        itemsStackView.distribution = .fillEqually
        
        var unlockedItemCount = 0  // Variável para rastrear o número de itens desbloqueados
        
        for lineIndex in 0..<2 {
            let lineStackView = UIStackView()
            lineStackView.axis = .horizontal
            lineStackView.spacing = screenWidth/42 // distância entre mesma fileira (3x o cornerRadius)
            lineStackView.distribution = .fillEqually
            
            for itemIndex in 0..<4 {
                let itemButton = UIButton()
                
                // Definindo um identificador único para o botão
                let itemIdentifier = "\(stateName)_\(lineIndex * 4 + itemIndex + 1)"
                itemButton.accessibilityIdentifier = itemIdentifier
                
                if unlockedItemCount < numOfItems {  // Verificando se ainda deve ser item desbloqueado
                    itemButton.backgroundColor = .green
                    itemButton.layer.borderWidth = 3
                    itemButton.layer.borderColor = UIColor.systemGreen.cgColor
                    itemButton.addTarget(self, action: #selector(itemButtonTapped), for: .touchUpInside)
                    unlockedItemCount += 1  // Atualizando o contador de itens desbloqueados
                } else {
                    itemButton.backgroundColor = .systemGray4
                    itemButton.isUserInteractionEnabled = false // Desativando a interação para os itens cinza
                }
                itemButton.layer.cornerRadius = 15
                itemButton.translatesAutoresizingMaskIntoConstraints = false
                itemButton.heightAnchor.constraint(equalToConstant: screenWidth/5).isActive = true
                itemButton.widthAnchor.constraint(equalToConstant: screenWidth/5).isActive = true
                
                lineStackView.addArrangedSubview(itemButton)
            }
            
            if lineIndex == 0 {
                let stateNameLabel = UILabel()
                stateNameLabel.text = stateName
                stateNameLabel.font = .boldSystemFont(ofSize: 24)
                itemsStackView.addArrangedSubview(stateNameLabel)
            }
            
            itemsStackView.addArrangedSubview(lineStackView)
        }
        
        return itemsStackView
    }


    @objc func itemButtonTapped(sender: UIButton) {
        // Implemente a lógica para lidar com o clique do botão aqui
        if let itemIdentifier = sender.accessibilityIdentifier {
            print("Botão \(itemIdentifier) clicado!")
        }
    }
}

//
//  RegionInfoView.swift
//  FalaTu
//
//  Created by Leonardo Mota on 08/10/23.
//

import UIKit

class RegionDetails: UIView {

    // Label para "Itens"
    private lazy var labelTextItems: UILabel = {
        let view = UILabel()
        view.text = "Itens"
        view.font = UIFont.systemFont(ofSize: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Label para "Estados"
    private lazy var labelTextStates: UILabel = {
        let view = UILabel()
        view.text = "Estados"
        view.font = UIFont.systemFont(ofSize: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Label para Itens desbloqueados
    private lazy var labelNumberItems: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 24)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Label para número de estados desbloqueados
    private lazy var labelNumberStates: UILabel = {
        let view = UILabel()
        view.font = UIFont.boldSystemFont(ofSize: 24)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    // Divider
    let divider: UIView = {
        let divider = UIView()
        divider.backgroundColor = .clear
        divider.layer.cornerRadius = 2
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.backgroundColor = UIColor(named: "dividerColor ")
        return divider
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension RegionDetails: ViewModel{
    func addViews() {
        addSubview(labelTextItems)
        addSubview(labelTextStates)
        
        addSubview(labelNumberItems)
        addSubview(labelNumberStates)
        
        addSubview(divider)
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            // TEXTO ITENS
            labelTextItems.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            labelTextItems.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            
            // TEXTO ESTADOS
            labelTextStates.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            labelTextStates.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),

            // NÚMERO DE ITENS DESBLOQUEADOS
            labelNumberItems.topAnchor.constraint(equalTo: labelTextItems.bottomAnchor),
            labelNumberItems.centerXAnchor.constraint(equalTo: labelTextItems.centerXAnchor),
            
            // NÚMERO DE ESTADOS DESBLOQUEADOS
            labelNumberStates.topAnchor.constraint(equalTo: labelTextStates.bottomAnchor),
            labelNumberStates.centerXAnchor.constraint(equalTo: labelTextStates.centerXAnchor),
            
            // DIVIDER
            divider.centerXAnchor.constraint(equalTo: centerXAnchor),
            divider.topAnchor.constraint(equalTo: topAnchor),
            divider.widthAnchor.constraint(equalToConstant: 1), // Largura do divider
            divider.heightAnchor.constraint(equalToConstant: 50) // Altura do divider
        ])
    }

    
    func setupStyle() {
    }
}

extension RegionDetails {
    public func configure(for region: RegionModel) {
        var numOfStatesUnlocked = 0
        
        for state in region.states {
            let stateKey = "\(region.regionName)_\(state.stateName)_numOfItemsUnlocked"
            if let savedItemsUnlocked = UserDefaults.standard.value(forKey: stateKey) as? Int, savedItemsUnlocked > 0 {
                numOfStatesUnlocked += 1
            }
        }
        
        self.labelNumberItems.text = "\(region.numOfItensInRegion)"
        self.labelNumberStates.text = "\(numOfStatesUnlocked)/\(region.numOfStates)"
    }
}


//
//  RegionInformationView.swift
//  FalaTu
//
//  Created by Leonardo Mota on 06/10/23.
//

import UIKit

class RegionInformationView: UIView {

    // BG
    private lazy var backgroundPattern: UIImageView = {
        let backgroundPattern = UIImageView()
        backgroundPattern.image = UIImage(named: "bgInventory")
        backgroundPattern.translatesAutoresizingMaskIntoConstraints = false
        backgroundPattern.contentMode = .scaleAspectFill
        
        // Adicionando sombra
        backgroundPattern.layer.shadowColor = UIColor.gray.cgColor
        backgroundPattern.layer.shadowOpacity = 0.3
        backgroundPattern.layer.shadowOffset = CGSize(width: 0, height: 4)
        backgroundPattern.layer.shadowRadius = 0.0
        
        return backgroundPattern
    }()


    // Inventário label -> título
    lazy var labelInventario: UILabel = {
        let label = UILabel()
        label.text = "Inventário"
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont(name: "Hore", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
        return label
    }()

    
    // Regiões brasileiras -> subtítulo
    lazy var labelRegioesBrasileiras: UILabel = {
        let label = UILabel()
        label.text = "Regiões brasileiras"
        label.textAlignment = .center
        label.font = UIFont(name: "Poppins", size: UIFont.preferredFont(forTextStyle: .largeTitle).pointSize)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Imagem da região
    lazy var regionImage: UIImageView = {
        let regionImage = UIImageView()
        regionImage.translatesAutoresizingMaskIntoConstraints = false
        regionImage.contentMode = .scaleAspectFit
        regionImage.widthAnchor.constraint(equalToConstant: 240).isActive = true
        regionImage.heightAnchor.constraint(equalToConstant: 160).isActive = true
           
        return regionImage
    }()
    
    lazy var regionTopDetails: RegionDetails = {
        let view = RegionDetails()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
  
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension RegionInformationView: ViewModel {
    func addViews() {
        addSubview(backgroundPattern) // BG
        addSubview(labelInventario) // Título
        addSubview(labelRegioesBrasileiras) // Subtítulo
        addSubview(regionImage) // Imagem do estado
        addSubview(regionTopDetails) // Informações de itens e estados
    }
    
    func addContrains() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            constrains_iPad()
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            constrains_iPhone()
        }
    }
    
    func setupStyle() {
    
    }
}

extension RegionInformationView {
    private func constrains_iPhone() {
        NSLayoutConstraint.activate([
            backgroundPattern.topAnchor.constraint(equalTo: topAnchor),
            backgroundPattern.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundPattern.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundPattern.heightAnchor.constraint(equalToConstant: 320),

            labelInventario.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            labelInventario.centerXAnchor.constraint(equalTo: centerXAnchor),

            labelRegioesBrasileiras.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelRegioesBrasileiras.topAnchor.constraint(equalTo: labelInventario.bottomAnchor), // Espaçamento entre título e subtítulo

            regionImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            regionImage.topAnchor.constraint(equalTo: labelRegioesBrasileiras.bottomAnchor, constant: 10), // Espaçamento entre subtítulo e imagem
            
            regionTopDetails.topAnchor.constraint(equalTo: backgroundPattern.bottomAnchor, constant: 15),
            regionTopDetails.leadingAnchor.constraint(equalTo: leadingAnchor),
            regionTopDetails.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
    
    private func constrains_iPad() {
        NSLayoutConstraint.activate([
            backgroundPattern.topAnchor.constraint(equalTo: topAnchor),
            backgroundPattern.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundPattern.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundPattern.heightAnchor.constraint(equalToConstant: 258),

            labelInventario.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            labelInventario.centerXAnchor.constraint(equalTo: centerXAnchor),

            labelRegioesBrasileiras.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelRegioesBrasileiras.topAnchor.constraint(equalTo: labelInventario.bottomAnchor, constant: 20), // Espaçamento entre título e subtítulo

            regionImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            regionImage.topAnchor.constraint(equalTo: labelRegioesBrasileiras.bottomAnchor, constant: 30), // Espaçamento entre subtítulo e imagem
            
            regionTopDetails.topAnchor.constraint(equalTo: backgroundPattern.bottomAnchor, constant: 110),
            regionTopDetails.leadingAnchor.constraint(equalTo: leadingAnchor),
            regionTopDetails.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

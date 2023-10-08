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
        return backgroundPattern
    }()

    // Inventário label -> título
    lazy var labelInventario: UILabel = {
        let label = UILabel()
        label.text = "Inventário"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Regiões brasileiras -> subtítulo
    lazy var labelRegioesBrasileiras: UILabel = {
        let label = UILabel()
        label.text = "Regiões brasileiras"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // Imagem da região
    private lazy var regionImage: UIImageView = {
        let regionImage = UIImageView()
        regionImage.image = UIImage(named: "NorteTopInventory")
        regionImage.translatesAutoresizingMaskIntoConstraints = false
        regionImage.contentMode = .scaleAspectFit
        return regionImage
    }()
    
    lazy var regionTopDetails: RegionDetails = {
        let view = RegionDetails()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // Borda para as topInfos
    private lazy var borderView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor.systemGray3.cgColor
        view.layer.cornerRadius = 10
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
        addSubview(borderView) // Borda para as top informations
        addSubview(regionTopDetails) // Informações de itens e estados
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            backgroundPattern.topAnchor.constraint(equalTo: topAnchor),
            backgroundPattern.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundPattern.trailingAnchor.constraint(equalTo: trailingAnchor),
            backgroundPattern.heightAnchor.constraint(equalToConstant: 300),

            labelInventario.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 10),
            labelInventario.centerXAnchor.constraint(equalTo: centerXAnchor),

            labelRegioesBrasileiras.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelRegioesBrasileiras.topAnchor.constraint(equalTo: labelInventario.bottomAnchor, constant: 10), // Espaçamento entre título e subtítulo

            regionImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            regionImage.topAnchor.constraint(equalTo: labelRegioesBrasileiras.bottomAnchor, constant: 10), // Espaçamento entre subtítulo e imagem

            borderView.topAnchor.constraint(equalTo: backgroundPattern.bottomAnchor, constant: -10),
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -10),
            borderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 10),
            borderView.heightAnchor.constraint(equalToConstant: 80),
            
            regionTopDetails.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 15),
            regionTopDetails.leadingAnchor.constraint(equalTo: borderView.leadingAnchor),
            regionTopDetails.trailingAnchor.constraint(equalTo: borderView.trailingAnchor),
        ])
    }
    
    func setupStyle() {
        //borderView.backgroundColor = .clear
        borderView.backgroundColor = .systemGray5
    }
}

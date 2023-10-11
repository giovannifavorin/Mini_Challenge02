//
//  PopUpInventoryView.swift
//  FalaTu
//
//  Created by Leonardo Mota on 09/10/23.
//

import UIKit

protocol PopUpInventoryDelegate: AnyObject {
    func didClosePopUp()
}
class PopUpInventory: UIView {
    weak var delegate: PopUpInventoryDelegate?
    
    private lazy var cellPopUp: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "bg_PopUpInventory")
        view.clipsToBounds = true
        view.layer.cornerRadius = 24
        view.layer.borderWidth = 5
        view.layer.borderColor = UIColor(named: "bg_PopUpInventory_Corner")?.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var labelItemName: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 32, weight: .heavy)
        label.text = "Nome"
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "asset_inventoryItem")
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill
        //image.layer.cornerRadius = 53.5
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var labelState: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelDescItem: UILabel = {
        let label = UILabel()
        label.text = "Descrição Descrição Descrição"
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .light)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var buttonBack: UIButton = {
        let button = UIButton()
        button.setTitle("X", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.backgroundColor = .red
        button.layer.cornerRadius = 25
        button.tag = 10
        button.addTarget(self, action: #selector(exitButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
       return button
    }()
    
    func configure(forState stateName: String){
        labelState.text = "Estado: \(stateName)"
    }
    
    @objc private func exitButtonPressed() {
        delegate?.didClosePopUp()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension PopUpInventory: ViewModel{
    func addViews() {
        addSubviewsEx(cellPopUp, buttonBack, labelItemName, imageView, labelState, labelDescItem)
    }
    
    func addContrains() {
        
        NSLayoutConstraint.activate([
            cellPopUp.centerXAnchor.constraint(equalTo: centerXAnchor),
            cellPopUp.centerYAnchor.constraint(equalTo: centerYAnchor),
            cellPopUp.heightAnchor.constraint(equalToConstant: 400),
            cellPopUp.widthAnchor.constraint(equalToConstant: 300),
            
            buttonBack.centerYAnchor.constraint(equalTo: cellPopUp.topAnchor, constant: 10),
            buttonBack.centerXAnchor.constraint(equalTo: cellPopUp.trailingAnchor, constant: -3),
            buttonBack.widthAnchor.constraint(equalToConstant: 50),
            buttonBack.heightAnchor.constraint(equalToConstant: 50),
            
            labelItemName.topAnchor.constraint(equalTo: cellPopUp.topAnchor, constant: 20),
            labelItemName.centerXAnchor.constraint(equalTo: cellPopUp.centerXAnchor),
            
            imageView.topAnchor.constraint(equalTo: labelItemName.bottomAnchor, constant: 20),
            imageView.centerXAnchor.constraint(equalTo: labelItemName.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 200),
            imageView.widthAnchor.constraint(equalToConstant: 200),
            
            labelState.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            labelState.centerXAnchor.constraint(equalTo: imageView.centerXAnchor),
            
            labelDescItem.topAnchor.constraint(equalTo: labelState.bottomAnchor, constant: 15),
            labelDescItem.centerXAnchor.constraint(equalTo: labelState.centerXAnchor),
        ])

    }
    
    func setupStyle() {
        //backgroundColor = .black.withAlphaComponent(0.6)
    }
}


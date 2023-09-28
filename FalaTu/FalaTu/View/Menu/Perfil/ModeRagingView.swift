//
//  ModeRagingView.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 27/09/23.
//

import UIKit

class ModeRagingView: UIView {

    
    private lazy var labelNumber: UILabel = {
        let view = UILabel()
        view.text = "00"
        view.font = UIFont.boldSystemFont(ofSize: 20)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
    private lazy var labelText: UILabel = {
        let view = UILabel()
        view.text = "nill pai"
        view.font = UIFont.systemFont(ofSize: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "questionmark")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    init() {
        super.init(frame: .zero)
        
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension ModeRagingView: ViewModel{
    func addViews() {
        addSubviewsEx(labelText, labelNumber, imageView)
    }
    
    func addContrains() {


        NSLayoutConstraint.activate([
            labelText.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelText.topAnchor.constraint(equalTo: topAnchor, constant: 13),

            
            labelNumber.topAnchor.constraint(equalTo: labelText.bottomAnchor),
            labelNumber.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -7),
            labelNumber.centerXAnchor.constraint(equalTo: labelText.centerXAnchor),

            
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 15),
            imageView.rightAnchor.constraint(equalTo: labelText.leftAnchor, constant: -5),
            imageView.heightAnchor.constraint(equalToConstant: 15),
            imageView.widthAnchor.constraint(equalToConstant: 10),
        ])
    }
    
    func setupStyle() {
        backgroundColor = .white
        
    }
}

extension ModeRagingView{
    public func configure(with labelText: String?, and labelNumber: String?, and image: UIImage){
        self.labelText.text = labelText
        self.labelNumber.text = labelNumber
        self.imageView.image = image
        }
}

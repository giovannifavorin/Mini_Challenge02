//
//  ModeRagingView.swift
//  FalaTu
//
//  Created by Gustavo Horestee Santos Barros on 27/09/23.
//

import UIKit

class ModeRagingView: UIView {

    
     lazy var labelNumber: UILabel = {
        let view = UILabel()
        view.text = "00"
        view.font = .boldSystemFont(ofSize: 20)
        view.textAlignment = .center
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    
     lazy var labelText: UILabel = {
        let view = UILabel()
        view.text = "nill pai"
        view.font = .systemFont(ofSize: 14)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
     lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "questionmark")
        image.contentMode = .scaleAspectFill
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
        
        if UIDevice.current.userInterfaceIdiom == .pad{
            configureItensForiPads()
            contrainsiPad()
            
        }else if UIDevice.current.userInterfaceIdiom == .phone{
            contrainsiPhone()
        }
    }
    
    func setupStyle() {
        backgroundColor = .clear
    }
}

extension ModeRagingView{
    public func configure(labelText: String?, labelNumber: String?, image: UIImage){
        self.labelText.text = labelText
        self.labelNumber.text = labelNumber
        self.imageView.image = image
        
    }
}

extension ModeRagingView{

    private func contrainsiPhone(){
        NSLayoutConstraint.activate([
            labelText.centerXAnchor.constraint(equalTo: centerXAnchor),
            labelText.topAnchor.constraint(equalTo: topAnchor, constant: 13),

            
            labelNumber.topAnchor.constraint(equalTo: labelText.bottomAnchor),
            labelNumber.centerXAnchor.constraint(equalTo: labelText.centerXAnchor),
            labelNumber.bottomAnchor.constraint(equalTo: bottomAnchor),

            
            imageView.bottomAnchor.constraint(equalTo: labelText.topAnchor),
            imageView.centerXAnchor.constraint(equalTo: labelText.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 20),
            imageView.widthAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    
    private func contrainsiPad(){
        NSLayoutConstraint.activate([
            
            labelText.centerXAnchor.constraint(equalTo: centerXAnchor),
//            labelText.topAnchor.constraint(equalTo: topAnchor, constant: 13),

            
            labelNumber.topAnchor.constraint(equalTo: labelText.bottomAnchor),
            labelNumber.centerXAnchor.constraint(equalTo: labelText.centerXAnchor),
            labelNumber.bottomAnchor.constraint(equalTo: bottomAnchor),

            
            imageView.bottomAnchor.constraint(equalTo: labelText.topAnchor, constant: -5),
            imageView.centerXAnchor.constraint(equalTo: labelText.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 25),
            imageView.widthAnchor.constraint(equalToConstant: 25),
        ])
    }
    
    private func configureItensForiPads(){
        labelNumber.font = .systemFont(ofSize: 30, weight: .bold)
        labelText.font = .systemFont(ofSize: 18, weight: .regular)
    }
}

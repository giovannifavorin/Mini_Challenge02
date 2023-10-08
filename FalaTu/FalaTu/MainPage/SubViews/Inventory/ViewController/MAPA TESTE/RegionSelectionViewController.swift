//
//  RegionSelectionViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 26/09/23.
//

import UIKit

class RegionSelectionViewController: UIViewController {
    
    // Função para criar uma máscara de forma da imagem
    func applyMaskToImage(image: UIImage, maskImage: UIImage) -> UIImage? {
        if let maskRef = maskImage.cgImage, let originalImageRef = image.cgImage {
            let mask = CGImage(maskWidth: maskRef.width,
                                height: maskRef.height,
                                bitsPerComponent: maskRef.bitsPerComponent,
                                bitsPerPixel: maskRef.bitsPerPixel,
                                bytesPerRow: maskRef.bytesPerRow,
                                provider: maskRef.dataProvider!,
                                decode: nil,
                                shouldInterpolate: true)
            
            if let maskedImageRef = originalImageRef.masking(mask!) {
                return UIImage(cgImage: maskedImageRef)
            }
        }
        return nil
    }

    
    // Background - padrão sem cores
    private lazy var imagebackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bg_home")
        image.alpha = 0.1
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var brazilImage: UIImageView = {
        let brazilImage = UIImageView()
        brazilImage.image = UIImage(named: "brazilMap")
        brazilImage.translatesAutoresizingMaskIntoConstraints = false
        brazilImage.contentMode = .scaleAspectFit
        return brazilImage
    }()
    
    // NORTE    
    lazy var image_Norte: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false

        // Define o tamanho do botão
//        let buttonSize = CGSize(width: 345.5, height: 235.5)
//        button.widthAnchor.constraint(equalToConstant: buttonSize.width).isActive = true
//        button.heightAnchor.constraint(equalToConstant: buttonSize.height).isActive = true
        
        return button
    }()

    // NORDESTE
    lazy var image_Nordeste: UIButton = {
        let button = UIButton()
        let image = UIImage(named: "map_nordeste")
        button.setImage(image, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFill
        button.clipsToBounds = true // Garante que a imagem seja cortada conforme as dimensões do botão

        // Define o tamanho do botão
//        let buttonSize = CGSize(width: 345.5, height: 235.5)
//        button.widthAnchor.constraint(equalToConstant: buttonSize.width).isActive = true
//        button.heightAnchor.constraint(equalToConstant: buttonSize.height).isActive = true
        
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllerModel()

        configureRegionButton(imageName: "map_norte", button: image_Norte)
        configureRegionButton(imageName: "map_nordeste", button: image_Nordeste)
    }
    
    func configureRegionButton(imageName: String, button: UIButton) {
        let buttonImage = UIImage(named: imageName)
        button.setImage(buttonImage, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.contentMode = .scaleAspectFill
        button.clipsToBounds = true

        button.addTarget(self, action: #selector(regionButtonTapped), for: .touchUpInside)

        if let maskImage = UIImage(named: imageName) {
            if let maskedImage = applyMaskToImage(image: buttonImage!, maskImage: maskImage) {
                button.setImage(maskedImage, for: .normal)
            }
        }
    }
    
    @objc func regionButtonTapped() {
        print("Região clicada")
    }
    
    
}

extension RegionSelectionViewController: ViewControllerModel {
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            //background image
            imagebackground.topAnchor.constraint(equalTo: view.topAnchor),
            imagebackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imagebackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imagebackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Mapa do Brasil
//            brazilImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
//            brazilImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
//            brazilImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            // NORTE
            image_Norte.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image_Norte.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            image_Norte.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            
            // NORTE
            image_Nordeste.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            image_Nordeste.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            image_Nordeste.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            image_Nordeste.topAnchor.constraint(equalTo: image_Norte.bottomAnchor),
  
            
        ])
    }
    
    func addSubviews() {
        view.addSubview(imagebackground)
        //view.addSubview(brazilImage)
        
        
        view.addSubview(image_Norte)
        view.addSubview(image_Nordeste)
    
    }
    
    func addStyle() {
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
}

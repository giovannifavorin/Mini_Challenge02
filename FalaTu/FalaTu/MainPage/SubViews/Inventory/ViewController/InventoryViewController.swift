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
        regionInfoView.regionImage.image = UIImage(named: "\(selectedRegion.regionName)TopInventory")
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
    
    // Número de palavras naquela região (arrumar)
    var labelWordsinRegion: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.isHidden = true
        
        return label
    }()
    
    private lazy var buttonBack: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "buttonBackPerfil"), for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc
    private func backButtonTapped(_ sender: UIButton!) {
        navigationController?.popToRootViewController(animated: true)
        self.addHapticFeedbackFromViewController(type: .error)
    }
    
    private lazy var popUpView: PopUpInventory = {
        let popUpView = PopUpInventory()
        return popUpView
    }()

    private lazy var popUpVC: PopUpViewController = {
        let popUpVC = PopUpViewController()
        popUpVC.view = popUpView
        return popUpVC
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllerModel()
        createAllStatesWithItems()
        
        if let savedWordsCorrect = UserDefaults.standard.value(forKey: "numOfWordsCorrectInRegion") as? Int {
            selectedRegion.numOfWordsCorrectInRegion = savedWordsCorrect
            labelWordsinRegion.text = "Palavras na região: \(selectedRegion.numOfWordsCorrectInRegion)"
        } else {
            labelWordsinRegion.text = "Palavras na região: NÃO RECUPEROU"
        }
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
        scrollView.contentSize = CGSize(width: view.frame.width, height: CGFloat(selectedRegion.states.count) * 260)
    }
}

extension InventoryViewController : ViewControllerModel, PopUpInventoryDelegate {
    
    func addSubviews() {
        view.addSubview(regionInfoView)
        view.addSubview(labelWordsinRegion)
        view.addSubview(scrollView)
        view.addSubview(buttonBack)
    }
    
    func addStyle() {
        // Cor de fundo da view Inventário
        view.backgroundColor = UIColor(named: "bg_scrollview")
        
        // Adicionando sombra à regionInfoView
        regionInfoView.layer.shadowColor = UIColor(named: "bottomborderinformation")?.cgColor// COR DA ULTIMA BORDA DE BAIXO
        regionInfoView.layer.shadowOpacity = 1.0
        regionInfoView.layer.shadowOffset = CGSize(width: 0, height: 4)
        regionInfoView.layer.shadowRadius = 0.0
        
        regionInfoView.backgroundColor = UIColor(named: "bg_Userprofile") // mesmo do perfil
    }

    
    func addConstraints() {
        NSLayoutConstraint.activate([
            regionInfoView.topAnchor.constraint(equalTo: view.topAnchor, constant: -5),
            regionInfoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            regionInfoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            regionInfoView.heightAnchor.constraint(equalToConstant: 350),
        ])
        
        NSLayoutConstraint.activate([
            labelWordsinRegion.topAnchor.constraint(equalTo: regionInfoView.bottomAnchor),
            labelWordsinRegion.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
        
        // Adicionar restrições para o scrollView abaixo da RegionInformationView
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: regionInfoView.bottomAnchor, constant: 4),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Botão de sair
        NSLayoutConstraint.activate([
            buttonBack.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            buttonBack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
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
                    itemButton.backgroundColor = UIColor(named: "button_Select_Active")
                    itemButton.layer.borderWidth = 3
                    itemButton.layer.borderColor = UIColor(named: "Border_button_Select")?.cgColor
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
        guard let itemIdentifier = sender.accessibilityIdentifier else {
            return
        }
        // Nome do estado extraido
        let components = itemIdentifier.components(separatedBy: "_")
        if components.count >= 2 {
            let stateName = components[0]
            popUpView.configure(forState: stateName)
        }
        
        popUpVC.modalPresentationStyle = .overFullScreen
        popUpView.delegate = self
        
        self.addHapticFeedbackFromViewController(type: .success)
        present(popUpVC, animated: true)
    }
    
    func didClosePopUp() {
        popUpVC.dismiss(animated: true)
        self.addHapticFeedbackFromViewController(type: .error)
    }
}

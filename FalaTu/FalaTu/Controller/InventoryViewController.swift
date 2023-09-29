    //
    //  InventoryViewController.swift
    //  FalaTu
    //
    //  Created by Leonardo Mota on 22/09/23.
    //

    import UIKit

    class InventoryViewController: UIViewController {

        // Selected Region
        var selectedRegion: RegionModel!
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // Cor de fundo da view Inventário
        view.backgroundColor = .systemBackground
        

        
    
        setupUI()
    }

}

    extension InventoryViewController {
        
    private func setupUI() {
    // Título "INVENTÁRIO"
    let inventoryTitleLabel = UILabel()
    inventoryTitleLabel.text = "INVENTÁRIO"
    inventoryTitleLabel.textAlignment = .center
    inventoryTitleLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    view.addSubview(inventoryTitleLabel)

    // Subtítulo "Norte"
    let regionLabel = UILabel()
    regionLabel.text = "\(selectedRegion.regionName)" // NOME DA REGIÃO
    regionLabel.font = .boldSystemFont(ofSize: 24)
    view.addSubview(regionLabel)

    // ============================================ ESTADOS x / y
    // StackView para os dois retângulos (HStack)
    let rectanglesStack = UIStackView()
        rectanglesStack.axis = .horizontal
        rectanglesStack.spacing = -15
        rectanglesStack.translatesAutoresizingMaskIntoConstraints = false

    // Retângulo preto com label "Estados"
    let blackRoundedRectangle = UIView()
        blackRoundedRectangle.backgroundColor = .black
        blackRoundedRectangle.layer.cornerRadius = 10
        blackRoundedRectangle.translatesAutoresizingMaskIntoConstraints = false
        blackRoundedRectangle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        blackRoundedRectangle.widthAnchor.constraint(equalToConstant: 100).isActive = true

    
    // Label Estados
    let statesLabel = UILabel()
        statesLabel.text = "Estados"
        statesLabel.textColor = .systemBackground
        statesLabel.textAlignment = .center
        statesLabel.translatesAutoresizingMaskIntoConstraints = false
        blackRoundedRectangle.addSubview(statesLabel)
    
    // Retângulo branco com label de X / Y
    let whiteRoundedRectangle = UIView ()
        whiteRoundedRectangle.backgroundColor = .white
        whiteRoundedRectangle.layer.cornerRadius = 10
        whiteRoundedRectangle.layer.borderWidth = 3
        whiteRoundedRectangle.layer.borderColor = UIColor.black.cgColor
        whiteRoundedRectangle.heightAnchor.constraint(equalToConstant: 50).isActive = true
        whiteRoundedRectangle.widthAnchor.constraint(equalToConstant: 50).isActive = true
        whiteRoundedRectangle.translatesAutoresizingMaskIntoConstraints = false
    
    // Label progresso estados desbloqueados do usuário
    let statesUnlockedLabel = UILabel()
        statesUnlockedLabel.text = "\(selectedRegion.numOfStatesUnlocked) / \(selectedRegion.numOfStates)"
        statesUnlockedLabel.textAlignment = .center
        statesUnlockedLabel.translatesAutoresizingMaskIntoConstraints = false
        whiteRoundedRectangle.addSubview(statesUnlockedLabel)
        
    // Adicionando elementos a hstack
        rectanglesStack.addArrangedSubview(blackRoundedRectangle)
        rectanglesStack.addArrangedSubview(whiteRoundedRectangle)
        view.addSubview(rectanglesStack)
    // ============================================ ESTADOS x / y

        
    // ScrollView para os estados
    let scrollView = UIScrollView()
        scrollView.isDirectionalLockEnabled = true
        scrollView.layer.borderColor = UIColor.systemGray6.cgColor
        scrollView.layer.borderWidth = 3
        scrollView.layer.cornerRadius = 50
    view.addSubview(scrollView)

    // Configurar Constraints
    inventoryTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    regionLabel.translatesAutoresizingMaskIntoConstraints = false
    scrollView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            inventoryTitleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            inventoryTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            regionLabel.topAnchor.constraint(equalTo: inventoryTitleLabel.bottomAnchor, constant: 50),
            regionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 80),

            rectanglesStack.centerYAnchor.constraint(equalTo: regionLabel.centerYAnchor),
            rectanglesStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            statesLabel.centerYAnchor.constraint(equalTo: regionLabel.centerYAnchor),
            statesLabel.centerXAnchor.constraint(equalTo: blackRoundedRectangle.centerXAnchor, constant: -5),
            statesUnlockedLabel.centerYAnchor.constraint(equalTo: regionLabel.centerYAnchor),
            statesUnlockedLabel.centerXAnchor.constraint(equalTo: whiteRoundedRectangle.centerXAnchor),
            

            scrollView.topAnchor.constraint(equalTo: regionLabel.bottomAnchor, constant: 40),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        

        var previousItemsStackView: UIStackView?
        
        for state in selectedRegion.states {
        
            let itemsStackView = createItemsStackView(withStateName: state.stateName, numOfItemsUnlocked: state.numberOfItemsUnlocked)
            scrollView.addSubview(itemsStackView)
        
            itemsStackView.translatesAutoresizingMaskIntoConstraints = false
        
            NSLayoutConstraint.activate([
                // Distância entre um estado e outro dentro do inventário
                itemsStackView.topAnchor.constraint(equalTo: previousItemsStackView?.bottomAnchor ?? scrollView.topAnchor, constant: 20),
                itemsStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            ])
        
            previousItemsStackView = itemsStackView
        }
            
            // Configurar ContentSize da ScrollView
        scrollView.contentSize = CGSize(width: view.frame.width, height: CGFloat(selectedRegion.states.count) * 240)
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
                
                for itemIndex in 0..<5 {
                    let itemButton = UIButton()
                    
                    // Definindo um identificador único para o botão
                    let itemIdentifier = "\(stateName)_\(lineIndex * 5 + itemIndex + 1)"
                    itemButton.accessibilityIdentifier = itemIdentifier
                    
                    if unlockedItemCount < numOfItems {  // Verificando se ainda deve ser item desbloqueado
                        itemButton.backgroundColor = .gray
                        itemButton.addTarget(self, action: #selector(itemButtonTapped), for: .touchUpInside)
                        unlockedItemCount += 1  // Atualizando o contador de itens desbloqueados
                    } else {
                        itemButton.backgroundColor = .systemGray4
                        itemButton.isUserInteractionEnabled = false // Desativando a interação para os itens cinza
                    }
                    itemButton.layer.cornerRadius = screenWidth/14
                    itemButton.translatesAutoresizingMaskIntoConstraints = false
                    itemButton.heightAnchor.constraint(equalToConstant: screenWidth/7).isActive = true
                    itemButton.widthAnchor.constraint(equalToConstant: screenWidth/7).isActive = true
                    
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

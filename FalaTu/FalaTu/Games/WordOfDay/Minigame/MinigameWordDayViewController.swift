//
//  MinigameWordDayViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 24/09/23.
//

import UIKit

class MinigameWordDayViewController: UIViewController, UICollectionViewDelegate {
    
    //RESPOSTA CORRETA
    var answer: String = ""
    var hint: String = ""
    // TENTATIVAS E TAMANHO DAS PALAVRAS
    private var guesses: [[Character?]] = Array(repeating: Array(repeating: nil, count: 5), count: 6) // são 6 tentativas de acerto com 5 caracteres cada
    
    // Botões de cima
    let topButtonsVC = TopButtonsViewController()
    // Botões de baixo
    let bottomButtons = BottomButtonsViewController()
    // Teclado
    let keyboard = KeyboardView()
    // Quadro central
    let boardVC = BoardViewController()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    private lazy var perfilViewController: PerfilViewController = {
        return PerfilViewController()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllerModel()
        
        // Pegando palavra aleatória do banco de palavras
        if let randomWordAndHint = getRandomWordAndHint() {
            answer = randomWordAndHint.word
            hint = randomWordAndHint.hint
            print("Palavra: \(answer)")
        } else {
            answer = "error"
            print("Erro ao obter palavra aleatória")
        }
    }
}

// CONFIGS VIEW CONTROLLER =========================================================================
extension MinigameWordDayViewController: ViewControllerModel {
    func addConstraints() {
        NSLayoutConstraint.activate([
            // Top Buttons
            topButtonsVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topButtonsVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topButtonsVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Board View
            boardVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            boardVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            boardVC.view.topAnchor.constraint(equalTo: topButtonsVC.view.bottomAnchor, constant: 20),
            boardVC.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.48), // arrumar

            // Bottom Buttons
            bottomButtons.view.topAnchor.constraint(equalTo: boardVC.view.bottomAnchor, constant: 15),
            bottomButtons.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomButtons.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Keyboard
            keyboard.topAnchor.constraint(equalTo: bottomButtons.view.bottomAnchor, constant: 20),
            keyboard.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboard.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboard.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func addSubviews() {
        // Botões de cima (3)
        addChild(topButtonsVC)
        view.addSubview(topButtonsVC.view)
        topButtonsVC.didMove(toParent: self)
        topButtonsVC.view.translatesAutoresizingMaskIntoConstraints = false
        
        // Board Principal
        addChild(boardVC)
        view.addSubview(boardVC.view)
        boardVC.didMove(toParent: self)
        boardVC.view.translatesAutoresizingMaskIntoConstraints = false
        boardVC.datasource = self
        
        // Botões de baixo (3)
        addChild(bottomButtons)
        view.addSubview(bottomButtons.view)
        bottomButtons.didMove(toParent: self)
        bottomButtons.view.translatesAutoresizingMaskIntoConstraints = false
        bottomButtons.delegate = self

        // Teclado
        view.addSubview(keyboard)
        keyboard.translatesAutoresizingMaskIntoConstraints = false
        keyboard.delegate = self
    }
    
    func addStyle() {
        // view.backgroundColor = UIColor(named: "backgroundColor")
        view.backgroundColor = .systemBackground
    }
}

// PREENCHER TECLADO =========================================================================
extension MinigameWordDayViewController: KeyboardViewDelegate {
    func keyTapped(_ letter: Character) {
        // Ao clicar na tecla = update nos guesses
        var stop = false
        
        for i in 0..<guesses.count {
            for j in 0..<guesses[i].count {
                if guesses[i][j] == nil {
                    guesses[i][j] = letter
                    stop = true
                    break
                }
            }
            if stop {
                break
            }
        }
        boardVC.reloadData()
    }
}



// PREENCHER QUADRO =========================================================================
// SEND BUTTON =========================================================================
extension MinigameWordDayViewController: BottomButtonsDelegate, BoardViewControllerDatasource {

    func tipButtonPressed() {
        let popUpHint: PopUpHintViewController = {
            let viewController = PopUpHintViewController()
            viewController.modalPresentationStyle = .overFullScreen
            return viewController
        }()
        
        popUpHint.popUpView.configure(hint: hint)
        
        present(popUpHint, animated: false)
    }
    

    
    var currentGuesses: [[Character?]] {
        return guesses
    }
    
    
    func boxColor(at indexPath: IndexPath) -> UIColor? {
        
        let rowIndex = indexPath.section
        let count = guesses[rowIndex].compactMap({ $0 }).count
        
        guard count == 5 else {
            return nil
        }
        
        let indexAnswer = Array(answer)
        
        guard let letter = guesses[rowIndex][indexPath.row], indexAnswer.contains(letter) else {
            return nil
        }
        
        if indexAnswer[indexPath.row] == letter {
            return .systemGreen
        }
        return .systemOrange
    }

    func sendButtonPressed() {
        var totalGuessesLeft: Int = 6
        var totalGuessesWithFive = 0
        
        for row in guesses {
            let count = row.compactMap({ $0 }).count
            if count == 5 {
                totalGuessesWithFive += 1
                totalGuessesLeft -= 1
            }
        }
        
        // Se ainda tiverem chances
        if totalGuessesLeft > 0 {
            if totalGuessesWithFive > 0 {
                print("Pode enviar! \(totalGuessesWithFive) tentativas com 5 letras.")
                print("resta \(totalGuessesLeft)")
                // Lógica para verificar as respostas e atribuir cores às letras
                // ...
            } else {
                print("Não pode enviar. \(totalGuessesWithFive) tentativas com 5 letras.")
                print("faltam \(totalGuessesLeft)\n")
            }
        } else {
            print("acabou")
            navigationController?.pushViewController(perfilViewController, animated: true)
        }
    }
}






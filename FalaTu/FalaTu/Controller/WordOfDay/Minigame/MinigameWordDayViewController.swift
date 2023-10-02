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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllerModel()
        
        // Pegando palavra aleatória do banco de palavras
        if let randomWord = getRandomWord() {
            answer = randomWord
            print(randomWord)
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
            boardVC.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),

            // Bottom Buttons
            bottomButtons.view.topAnchor.constraint(equalTo: boardVC.view.bottomAnchor),
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
extension MinigameWordDayViewController: BoardViewControllerDatasource {
    var currentGuesses: [[Character?]] {
        return guesses
    }
    func boxColor(at indexPath: IndexPath) -> UIColor? {
        
        let rowIndex = indexPath.section
        let count = guesses[rowIndex].compactMap({ $0 }).count // compactMap se livra de todos elementos NIL
        
        
        guard count == 5 else { // APENAS MOSTRAMOS A COR QUANDO FOR IGUAL A 5 (completar a fileira)
            return nil
        }
        
        let indexAnswer = Array(answer) // TRANSFORMANDO A RESPOSTA EM UM ARRAY

        // Tem uma letra?
        guard let letter = guesses[indexPath.section][indexPath.row], indexAnswer.contains(letter) else {
            return nil // se não tiver nenhuma letra, nil
        }
        
        if indexAnswer[indexPath.row] == letter {
            return .systemGreen
        }
        return .systemOrange
    }
}





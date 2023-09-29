//
//  MinigameWordDayViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 24/09/23.
//

import UIKit

// UI
// TECLADO
// GAME BOARD
// CORES - LARANJA E VERDE

class MinigameWordDayViewController: UIViewController {
    
    //RESPOSTA CORRETA
    let answer = "clara"
    private var guesses: [[Character?]] = Array(repeating: Array(repeating: nil, count: 5), count: 6) // são 6 tentativas de acerto com 5 caracteres cada
    
    let keyboardVC = KeyboardViewController()
    let boardVC = BoardViewController()
    let topButtonsVC = TopButtonsViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllerModel()
    }
}

extension MinigameWordDayViewController: ViewControllerModel{
    
    func addSubviews() {
        addChild(topButtonsVC)
        topButtonsVC.didMove(toParent: self)
        topButtonsVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topButtonsVC.view)

        
        addChild(keyboardVC)
        keyboardVC.didMove(toParent: self)
        keyboardVC.delegate = self
        keyboardVC.view
            .translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(keyboardVC.view)

        addChild(boardVC)
        boardVC.didMove(toParent: self)
        boardVC.view
            .translatesAutoresizingMaskIntoConstraints = false
        boardVC.datasource = self
        view.addSubview(boardVC.view)
    }
    
    func addStyle() {
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            topButtonsVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            
            boardVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            boardVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            boardVC.view.topAnchor.constraint(equalTo: topButtonsVC.view.bottomAnchor, constant: 30),
            boardVC.view.bottomAnchor.constraint(equalTo: keyboardVC.view.topAnchor),
            boardVC.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),

            keyboardVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension MinigameWordDayViewController: KeyboardViewControllerDelegate {
    func keyboardViewControllerDelegate(_ vc: KeyboardViewController, didTapKey letter: Character) {
        // Ao clicar na tecla
        // update nos guesses
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
        //
        return .systemOrange
    }
    

}





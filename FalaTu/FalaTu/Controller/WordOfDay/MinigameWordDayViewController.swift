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
    let answer = "gremi"
    private var guesses: [[Character?]] = Array(repeating: Array(repeating: nil, count: 5), count: 6) // são 6 tentativas de acerto com 5 caracteres cada
    
    let keyboardVC = KeyboardViewController()
    let boardVC = BoardViewController()
    let topButtonsVC = TopButtonsViewController()
    let bottomButtonsVC = BottomButtonsViewController()
        
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViewControllerModel()
        
        bottomButtonsVC.sendButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    @objc func buttonPressed() {
        print("aprtorou")
    }
    
    @objc func showTutorialModal() {
        let alertController = UIAlertController(title: "Tutorial", message: "Seu tutorial aqui", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)
    }

  
}

extension MinigameWordDayViewController: ViewControllerModel{

    
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            topButtonsVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topButtonsVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topButtonsVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            boardVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            boardVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            boardVC.view.topAnchor.constraint(equalTo: topButtonsVC.view.bottomAnchor, constant: 30),
            boardVC.view.bottomAnchor.constraint(equalTo: bottomButtonsVC.view.topAnchor, constant: 30),
            boardVC.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.6),

            bottomButtonsVC.view.centerXAnchor.constraint(equalTo: boardVC.view.centerXAnchor),
            bottomButtonsVC.view.bottomAnchor.constraint(equalTo: keyboardVC.view.topAnchor, constant: -20),
            
            keyboardVC.view.topAnchor.constraint(equalTo: bottomButtonsVC.view.bottomAnchor),
            keyboardVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboardVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboardVC.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func addSubviews() {
        // Botões de cima (3)
        addChild(topButtonsVC)
        topButtonsVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(topButtonsVC.view)


        // Board Principal
        addChild(boardVC)
        boardVC.didMove(toParent: self)
        boardVC.view
            .translatesAutoresizingMaskIntoConstraints = false
        boardVC.datasource = self
        view.addSubview(boardVC.view)
        
        // Botões de baixo (3)
        addChild(bottomButtonsVC)
        bottomButtonsVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(bottomButtonsVC.view)
        
        // Teclado
        addChild(keyboardVC)
        keyboardVC.didMove(toParent: self)
        keyboardVC.delegate = self
        keyboardVC.view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(keyboardVC.view)
        
        topButtonsVC.tutorialButton.addTarget(self, action: #selector(showTutorialModal), for: .touchUpInside)
    }
    
    func addStyle() {
       // view.backgroundColor = UIColor(named: "backgroundColor")
        view.backgroundColor = .systemBackground
    }
}

// Preencher teclado
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
        
        return .systemOrange
    }
    

}





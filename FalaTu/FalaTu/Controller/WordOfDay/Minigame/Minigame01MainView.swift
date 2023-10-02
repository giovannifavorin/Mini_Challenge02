//
//  Minigame01MainView.swift
//  FalaTu
//
//  Created by Leonardo Mota on 28/09/23.
//

import Foundation
import UIKit

class Minigame01MainView: UIView {
    
    // Botões de cima
    private lazy var topButtons: UIView = {
        let topButtons = UIView()
        topButtons.translatesAutoresizingMaskIntoConstraints = false
        return topButtons
    }()
    
    // Board principal do jogo
    private lazy var boardGameView: UIView = {
        let boardGame = UIView()
        boardGame.translatesAutoresizingMaskIntoConstraints = false
        return boardGame
    }()
    
    // 3 Botões de baixo
    private lazy var bottomButtonsView: UIView = {
        let topButtons = UIView()
        topButtons.translatesAutoresizingMaskIntoConstraints = false
        return topButtons
    }()
    
    // Teclado
    private lazy var keyboardView: UIView = {
        let topButtons = UIView()
        topButtons.translatesAutoresizingMaskIntoConstraints = false
        return topButtons
    }()
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        setupViewModel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



extension Minigame01MainView: ViewModel {
    func addViews() {
    }
    
    func addContrains() {
        NSLayoutConstraint.activate([
            
        ])
    }
    
    func setupStyle() {
        backgroundColor = UIColor(named: "backgroundColor")

    }
}

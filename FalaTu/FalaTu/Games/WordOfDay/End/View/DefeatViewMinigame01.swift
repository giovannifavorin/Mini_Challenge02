//
//  DefeatViewController.swift
//  FalaTu
//
//  Created by Giovanni Favorin de Melo on 03/10/23.
//

import UIKit

class DefeatViewMinigame01: UIView {
    ///Formata o background do placar
    private lazy var scoreboardBackground: UIImageView = {
        let scoreboard = UIImageView()
        scoreboard.image = UIImage(named: "DefeatScoreboard")
        scoreboard.clipsToBounds = true
        scoreboard.contentMode = .scaleAspectFill
        scoreboard.translatesAutoresizingMaskIntoConstraints = false
        return scoreboard
    }()
    
    ///Formata o "Título" do placar
    private lazy var scoreboardTittle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    ///Formata o "body" do placar
    private lazy var scoreboardContent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    ///Formata o "body" da caixa amarela
    private lazy var yellowBoxContent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    ///Formata o ''Título" da caixa amarela
    private lazy var yellowBoxTittle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    ///Formata a pontuaçao do usuario
    private lazy var pointsContent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var labelPointsContent: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        return label
    }()
    
    // Inicializador personalizado que aceita a variável score como parâmetro
    init(sequenceScore: String, score: String) {
        super.init(frame: .zero)
        // Configurar a view com base na variável score
        setupView(withScore: sequenceScore)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        // Configurações adicionais, se necessário
    }
    
    private func setupView(withScore sequenceScore: String) {
        // Configure a view com base no valor da variável score
        // Por exemplo, defina o texto da label scoreLabel com o valor de score
        pointsContent.text = "Score: \(sequenceScore)"
        
        // Adicione as subviews, configure as restrições, etc.
        addSubview(scoreboardBackground)
        addSubview(pointsContent)
        
        // Configure as restrições de layout, como você fez anteriormente
        // Certifique-se de posicionar e dimensionar as subviews conforme necessário
    }
}


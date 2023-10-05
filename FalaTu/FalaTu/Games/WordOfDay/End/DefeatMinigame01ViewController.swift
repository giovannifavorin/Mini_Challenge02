//
//  DefeatMinigame01ViewController.swift
//  FalaTu
//
//  Created by Giovanni Favorin de Melo on 04/10/23.
//

import UIKit
import SnapKit

class DefeatMinigame01ViewController: UIViewController {
    
    private lazy var background: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "pattern")
        background.contentMode = .scaleToFill // Configurar contentMode
        return background
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "Tempo"
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var regionLabel: UILabel = {
        let label = UILabel()
        label.text = "Região"
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var lostLabelTitle: UILabel = {
        let label = UILabel()
        label.text = "Não foi dessa vez, mano...!"
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var lostLabelBody: UILabel = {
        let label = UILabel()
        label.text = "Acabaram suas chances. \n Tente novamente amanhã!"
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var scoreBox: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "box_score")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var scoreBox2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "box_score")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var scoreBoardBackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "scoreboardDefeat")
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "button_share"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "button_backmenu"), for: .normal)
        button.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        button.tag = 2
        return button
    }()
    
    // Crie uma stack view horizontal
    private lazy var buttonStackView: UIStackView = {
        let buttonStackView = UIStackView()
        buttonStackView.axis = .horizontal
        buttonStackView.spacing = 20
        return buttonStackView
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 20
        return stackView
    }()
    
    @objc private func didButton(_ sender: UIButton!) {
        switch sender.tag {
        case 1:
            print("clico 1")
        case 2:
            print("clico 2")
        default:
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        // Adicione os botões à stack view
        buttonStackView.addArrangedSubview(shareButton)
        buttonStackView.addArrangedSubview(backButton)
        
        labelStackView.addArrangedSubview(lostLabelTitle)
        labelStackView.addArrangedSubview(lostLabelBody)
        
        view.addSubview(background)
        view.addSubview(scoreBoardBackground)
        view.addSubview(buttonStackView)
        
        scoreBoardBackground.addSubview(labelStackView)
        
        scoreBoardBackground.addSubview(scoreBox)
        scoreBoardBackground.addSubview(scoreBox2)
        
        scoreBox.addSubview(timeLabel)
        scoreBox2.addSubview(regionLabel)
        
        background.snp.makeConstraints { make in /*PLANO DE FUNDO*/
            make.edges.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints { make in /*BOTÕES*/
            make.height.equalTo(60)
            make.top.equalTo(scoreBoardBackground.snp.bottom).offset(60)
            make.left.right.equalToSuperview().inset(60)
            make.bottom.equalTo(view.safeAreaLayoutGuide).inset(20)
        }
        
        scoreBoardBackground.snp.makeConstraints { make in /*PLACAR*/
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.right.left.equalToSuperview().inset(10)
        }
        
        labelStackView.snp.makeConstraints { make in /*TÍTULO LABEL*/
            make.top.equalToSuperview().offset(60)
            make.centerX.equalToSuperview()
        }
        
        scoreBox.snp.makeConstraints { make in /*SCORE BOX*/
            make.top.equalToSuperview().offset(250)
            make.left.equalTo(scoreBoardBackground.snp.left).offset(50)
        }
        
        scoreBox2.snp.makeConstraints { make in /*SCORE BOX*/
            make.top.equalToSuperview().offset(250)
            make.right.equalTo(scoreBoardBackground.snp.right).offset(-50)
        }
        
        timeLabel.snp.makeConstraints { make in /*TIME LABEL*/
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
        }
        
        regionLabel.snp.makeConstraints { make in /*REGION LABEL*/
            make.top.equalToSuperview().offset(8)
            make.centerX.equalToSuperview()
        }
    }
}

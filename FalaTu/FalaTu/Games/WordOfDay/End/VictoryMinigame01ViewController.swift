//
//  DefeatMinigame01ViewController.swift
//  FalaTu
//
//  Created by Giovanni Favorin de Melo on 04/10/23.
//

import UIKit
import SnapKit

class VictoryMinigame01ViewController: UIViewController {
    
    // palavra acertada (do dia)
    public var wordOfDay: String! = nil
    // significado
    public var meaningOfWord: String! = nil
    // tempo levado para acertar
    public var timeTaken: Double! = nil
    // Região de onde a palavra do dia é
    public var regionAnswer: RegionModel! = nil
    
    private lazy var background: UIImageView = {
        let background = UIImageView()
        background.image = UIImage(named: "pattern")
        background.contentMode = .scaleToFill // Configurar contentMode
        return background
    }()
    
    // TEMPO
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        
        // Define a primeira parte do texto com um estilo específico
        let attributedString = NSMutableAttributedString(string: "TEMPO\n",
                                                         attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .light)])
        
        // Define a segunda parte do texto com um estilo diferente
        let timeFormatted = String(format: "%.2f", timeTaken)
        let timeTaken = NSAttributedString(string: "\(timeFormatted)",
                                           attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .bold)])
        
        // Adiciona as duas partes ao attributedString
        attributedString.append(timeTaken)
        
        // Define o texto do label com o attributedString
        label.attributedText = attributedString
        
        return label
    }()
    
    // REGIÃO
    private lazy var regionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        
        // Define a primeira parte do texto com um estilo específico
        let attributedString = NSMutableAttributedString(string: "REGIÃO\n",
                                                         attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .light)])
        
        // Define a segunda parte do texto com um estilo diferente
        let regionAnswer = NSAttributedString(string: "\(regionAnswer!.regionName.uppercased())",
                                              attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .bold)])
        
        // Adiciona as duas partes ao attributedString
        attributedString.append(regionAnswer)
        
        // Define o texto do label com o attributedString
        label.attributedText = attributedString
        
        return label
    }()
    
    
    // PALAVRA DO DIA
    private lazy var phraseLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        
        // Define a primeira parte do texto com um estilo específico
        let attributedString = NSMutableAttributedString(string: "A palavra do dia é...\n",
                                                         attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .light)])
        
        // Define a segunda parte do texto com um estilo diferente
        let correctAnswerAttributedString = NSAttributedString(string: "\(wordOfDay!.uppercased())",
                                                               attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 50, weight: .bold)])
        
        // Adiciona as duas partes ao attributedString
        attributedString.append(correctAnswerAttributedString)
        
        // Define o texto do label com o attributedString
        label.attributedText = attributedString
        
        return label
    }()
    
    // SIGNIFICADO DA PALAVRA
    private lazy var meaningLabelBody: UILabel = {
        let label = UILabel()
        label.text = "\(meaningOfWord!)"
        label.textAlignment = .center
        label.numberOfLines = 0
        label.font = UIFont.systemFont(ofSize: 24)
        label.lineBreakMode = .byWordWrapping
        label.adjustsFontSizeToFitWidth = true
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
    
    private lazy var scoreBoardStars: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "stars")
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
            // Botão de compartilhar foi pressionado
            let textToShare = "Texto que você deseja compartilhar."
            if let imageToShare = UIImage(named: "button_share") {
                let objectsToShare: [Any] = [textToShare, imageToShare]
                let activityViewController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
                activityViewController.popoverPresentationController?.sourceView = self.view // Para iPad
                self.present(activityViewController, animated: true, completion: nil)
            }
        case 2:
            navigationController?.popToRootViewController(animated: true)
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
        
        labelStackView.addArrangedSubview(phraseLabel)
//        labelStackView.addArrangedSubview(meaningLabelBody)
        
        view.addSubview(background)
        view.addSubview(scoreBoardBackground)
        view.addSubview(buttonStackView)
        
        scoreBoardBackground.addSubview(scoreBox)
        scoreBoardBackground.addSubview(scoreBox2)
        scoreBoardBackground.addSubview(scoreBoardStars)
        
        scoreBoardStars.addSubview(labelStackView)
        scoreBoardBackground.addSubview(meaningLabelBody)
        
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
        
        scoreBoardStars.snp.makeConstraints { make in /*ESTRELAS DO PLACAR*/
            make.top.equalTo(scoreBoardBackground.snp.top).offset(20)
            make.centerX.equalTo(scoreBoardBackground.snp.centerX)
            make.width.equalTo(view.frame.width * 0.68)
        }
        
        labelStackView.snp.makeConstraints { make in /*TÍTULO LABEL*/
            make.top.equalTo(scoreBoardStars.snp.top).offset(20)
            make.centerX.equalTo(scoreBoardStars.snp.centerX)
        }
        
        meaningLabelBody.snp.makeConstraints { make in
            make.top.equalTo(labelStackView.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(20)
        }
        
        scoreBox.snp.makeConstraints { make in /*SCORE BOX*/
            make.top.equalTo(meaningLabelBody.snp.bottom).offset(40)
            make.left.equalTo(scoreBoardBackground.snp.left).offset(50)
            make.width.equalTo(view.frame.width * 0.29)
        }
        
        scoreBox2.snp.makeConstraints { make in /*SCORE BOX2*/
            make.top.equalTo(meaningLabelBody.snp.bottom).offset(40)
            make.right.equalTo(scoreBoardBackground.snp.right).offset(-50)
            make.width.equalTo(view.frame.width * 0.29)
        }
        
        timeLabel.snp.makeConstraints { make in /*TIME LABEL*/
            make.top.equalToSuperview().offset(14)
            make.centerX.equalToSuperview()
        }
        
        regionLabel.snp.makeConstraints { make in /*REGION LABEL*/
            make.top.equalToSuperview().offset(14)
            make.centerX.equalToSuperview()
        }
    }
}

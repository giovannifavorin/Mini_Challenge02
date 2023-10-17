//
//  DefeatMinigame01ViewController.swift
//  FalaTu
//
//  Created by Giovanni Favorin de Melo on 04/10/23.
//

import UIKit
import SnapKit

class DefeatMinigame01ViewController: UIViewController {
    
    // tempo levado para acertar
    public var timeTaken: Double! = nil
    // Região de onde a palavra do dia é
    public var regionAnswer: RegionModel! = nil
    
    private let coreDataManager = CoreDataManager.coreDataManager
    
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

        let minutes = Int(timeTaken) / 60
        let seconds = Int(timeTaken) % 60
        let timeString = String(format: "%02d:%02d", minutes, seconds)

        let attributedString = NSMutableAttributedString(string: "TEMPO\n",
                                                         attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .light)])

        let timeTaken = NSAttributedString(string: timeString,
                                           attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .bold)])

        attributedString.append(timeTaken)

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
    
    private lazy var lostLabelTitle: UILabel = {
        let label = UILabel()
        label.text = "Não foi dessa vez..."
        label.font = UIFont.systemFont(ofSize: 28)
        label.textAlignment = .center
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    private lazy var lostLabelBody: UILabel = {
        let label = UILabel()
        label.text = "Acabaram suas chances. \n Tente novamente amanhã!"
        label.font = UIFont.systemFont(ofSize: 28)
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
        
        coreDataManager.updateTotalDeJogos()
        
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
        
        setupViewModel()
    }
}


extension DefeatMinigame01ViewController: ViewModel{
    
    func addViews() {
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
    }
    
    func addContrains() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            constrains_iPad()
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            constrains_iPhone()
        }
    }
    
    func setupStyle() {
        view.backgroundColor = UIColor(named: "backgroundColor")

    }
}


extension DefeatMinigame01ViewController{
    private func constrains_iPad(){
                
        background.snp.makeConstraints { make in /*PLANO DE FUNDO*/
            make.edges.equalToSuperview()
        }
        
        buttonStackView.snp.makeConstraints { make in /*BOTÕES*/
            make.height.equalTo(60)
            make.top.equalTo(scoreBoardBackground.snp.bottom).offset(40)
            make.centerX.equalToSuperview().inset(10)
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
            make.left.equalTo(scoreBoardBackground.snp.left).offset(190)
        }
        
        scoreBox2.snp.makeConstraints { make in /*SCORE BOX*/
            make.top.equalToSuperview().offset(250)
            make.right.equalTo(scoreBoardBackground.snp.right).offset(-190)
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
    
    
    private func constrains_iPhone(){
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
            make.top.equalToSuperview().offset(14)
            make.centerX.equalToSuperview()
        }
        
        regionLabel.snp.makeConstraints { make in /*REGION LABEL*/
            make.top.equalToSuperview().offset(14)
            make.centerX.equalToSuperview()
        }
    }
}


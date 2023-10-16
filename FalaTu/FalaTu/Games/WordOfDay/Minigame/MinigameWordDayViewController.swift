//
//  MinigameWordDayViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 24/09/23.
//

import UIKit

class MinigameWordDayViewController: UIViewController, UICollectionViewDelegate {
    var isRowSent: [Bool] = Array(repeating: false, count: 6) // numberOfSections é o número total de seções na sua coleção
    
    //RESPOSTA CORRETA
    var answer: String = ""
    var hint: String = ""
    var meaning: String = ""
    var answer_region: RegionModel!
    
    // TENTATIVAS E TAMANHO DAS PALAVRAS
    private var guesses: [[Character?]] = Array(repeating: Array(repeating: nil, count: 5), count: 6) // são 6 tentativas de acerto com 5 caracteres cada
    
    // Botões de cima
    let topButtonsVC = TopButtonsViewController()
    // Botões de baixo
    let bottomButtonsVC = BottomButtonsViewController()
    // Teclado
    let keyboard = KeyboardView()
    // Quadro central
    let boardVC = BoardViewController()
    // Vitória
    let victoryVC = VictoryMinigame01ViewController()
    // Derrota
    let defeatVC = DefeatMinigame01ViewController()
    // tempo levado
    var timeElapsed: Double! = nil
    
    // Background - padrão sem cores
    private lazy var imagebackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "bg_home")
        image.alpha = 0.1
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    // VARIÁVEIS PARA CONTROLAR TEMPO
    var startTime: Date?
    var endTimeWin: Date?
    var endTimeDefeat: Date?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllerModel()
        
        // Pegando palavra aleatória do banco de palavras
        if let random_Word_Hint_Meaning = getRandom_Word_Hint_Meaning() {
            answer = random_Word_Hint_Meaning.word
            hint = random_Word_Hint_Meaning.hint
            meaning = random_Word_Hint_Meaning.meaning
            answer_region = random_Word_Hint_Meaning.region
            print("Palavra: \(answer), significado: \(meaning)")
        } else {
            answer = "error"
            print("Erro ao obter palavra aleatória")
        }
    }
}

// CONFIGS VIEW CONTROLLER =========================================================================
extension MinigameWordDayViewController: ViewControllerModel {
    func addConstraints() {
        if UIDevice.current.userInterfaceIdiom == .pad {
            constrains_iPad()
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            constrains_iPhone()
        }
        
        
    }
    
    func addSubviews() {
        // Background
        view.addSubview(imagebackground)
        
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
        addChild(bottomButtonsVC)
        view.addSubview(bottomButtonsVC.view)
        bottomButtonsVC.didMove(toParent: self)
        bottomButtonsVC.view.translatesAutoresizingMaskIntoConstraints = false
        bottomButtonsVC.delegate = self

        // Teclado
        view.addSubview(keyboard)
        keyboard.translatesAutoresizingMaskIntoConstraints = false
        keyboard.delegate = self
    }
    
    func addStyle() {
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
}

// PREENCHER TECLADO =========================================================================
extension MinigameWordDayViewController: KeyboardViewDelegate {
    func keyTapped(_ letter: Character) {
        if startTime == nil {
            startTime = Date() // registrando o tempo quando o usuário começar a digitar
        }
        // Permitir a entrada de letras na primeira linha sempre
        if boardVC.currentRow == 0 {
            handleLetterInput(letter, inRow: 0)
        } else {
            guard isRowSent[boardVC.currentRow - 1] else {
                // Se a linha anterior não foi enviada, não permita a entrada de letras
                return
            }
            handleLetterInput(letter, inRow: boardVC.currentRow)
        }
    }
    
    private func handleLetterInput(_ letter: Character, inRow row: Int) {
        // Ao clicar na tecla = update nos guesses
        if letter == "⌫" {
            // Remover a letra da última célula preenchida da linha atual
            for j in (0..<guesses[row].count).reversed() {
                if guesses[row][j] != nil {
                    guesses[row][j] = nil
                    boardVC.reloadData()
                    return
                }
            }
        } else {
            // Adicionar a letra na primeira célula vazia da linha atual
            for j in 0..<guesses[row].count {
                if guesses[row][j] == nil {
                    guesses[row][j] = letter
                    boardVC.reloadData()
                    return
                }
            }
        }
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
        
        guard count == 5, isRowSent[rowIndex] else {
            return nil
        }
        
        let indexAnswer = Array(answer)
        
        guard let letter = guesses[rowIndex][indexPath.row], indexAnswer.contains(letter) else {
            return UIColor(named: "WrongLetter")
            
        }
        
        if indexAnswer[indexPath.row] == letter {
            return UIColor(named: "GreenLetter")
        }
        return UIColor(named: "OrangeLetter")
    }
    
    func sendButtonPressed() {
        // Função para verificar se existe a palavra digitada =========================================
        func verify(userAnswer: String) -> Bool {
            // Primeiro, verifica se a palavra está no dicionário
            if isWordInDictionary(userAnswer) {
                print("Palavra encontrada no dicionário")
                return true
            }
            
            // Em seguida, verifica se a palavra está associada a algum estado em suas regiões
            for region in regions_BR {
                for state in region.states {
                    let wordsWithHints = state.words
                    if let (_, _) = wordsWithHints[userAnswer] {
                        print("Palavra encontrada no estado \(state.stateName)")
                        return true
                    }
                }
            }
            
            // Se a palavra não foi encontrada em nenhum lugar, retorna falso
            print("Palavra não encontrada em nenhum lugar")
            return false
        }

        func isWordInDictionary(_ word: String) -> Bool {
            if let path = Bundle.main.path(forResource: "br-utf8", ofType: "txt") {
                do {
                    let content = try String(contentsOfFile: path, encoding: .utf8)
                    let wordsList = content.components(separatedBy: "\n")
                    return wordsList.contains(word)
                } catch {
                    print("Erro ao carregar o arquivo de lista de palavras.")
                    return false
                }
            }
            return false
        }


        
        // COMEÇA VERIFICAÇÃO DA LINHA QUE ESTÁ SENDO ESCRITA ======================================
        guard boardVC.currentRow < guesses.count, guesses[boardVC.currentRow].compactMap( { $0 }).count == 5 else {
            print("\n\n\nlinha atual incompleta")
            print("linha atual: \(boardVC.currentRow)")
            print("itens preenchidos: \(guesses[boardVC.currentRow].compactMap( { $0 }).count) = \(guesses[boardVC.currentRow].compactMap({ $0 }))")
            return
        }
        
        let userAnwerArray = guesses[boardVC.currentRow].compactMap({ $0 })
        let userAnswer = String(userAnwerArray)
        let wordExists = verify(userAnswer: userAnswer)
        
        if wordExists {
            // ACERTO DE RESPOSTA ======================================================================
            if userAnswer == answer {
                isRowSent[boardVC.currentRow] = true
                boardVC.boardView.collectionView.reloadData()
                // Desativa o botão após acerto
                bottomButtonsVC.bottomButtonsView.sendButton.isEnabled = false
                
                // tempo
                endTimeWin = Date()
                timeElapsed = endTimeWin?.timeIntervalSince(startTime ?? Date()) ?? 0
                
                // PONTUAÇÃO -> PALAVRAS NA REGIÃO
                // Recupera o valor
                if let savedWordsCorrect = UserDefaults.standard.value(forKey: "\(answer_region.regionName)_numOfWordsCorrectInRegion") as? Int {
                    // Recebe o valor armazenado
                    answer_region.numOfWordsCorrectInRegion = savedWordsCorrect
                    print("Antes, a região \(answer_region.regionName) tinha \(answer_region.numOfWordsCorrectInRegion) palavras acertadas")
                    for state in answer_region.states {
                        print("Antes, o estado \(state.stateName) tinha \(state.numberOfItemsUnlocked) itens")
                    }

                    // Incrementa
                    incrementWordsCorrectInRegion(in: &answer_region)
                    // Guarda o valor
                    UserDefaults.standard.set(answer_region.numOfWordsCorrectInRegion, forKey: "\(answer_region.regionName)_numOfWordsCorrectInRegion")
                    print("Agora, a região \(answer_region.regionName) tem \(answer_region.numOfWordsCorrectInRegion) palavras acertadas")
                    for state in answer_region.states {
                        print("Agora, o estado \(state.stateName) tem \(state.numberOfItemsUnlocked) itens")
                    }

                } else {
                    // Incrementa
                    incrementWordsCorrectInRegion(in: &answer_region)
                    // Guarda o valor
                    UserDefaults.standard.set(answer_region.numOfWordsCorrectInRegion, forKey: "\(answer_region.regionName)_numOfWordsCorrectInRegion")
                }

                
                // CHAMADA VIEW DE VITÓRIA
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    self.victoryVC.wordOfDay = self.answer
                    self.victoryVC.meaningOfWord = self.meaning
                    self.victoryVC.timeTaken = self.timeElapsed
                    self.victoryVC.regionAnswer = self.answer_region
                    self.addHapticFeedbackFromViewController(type: .success)
                    self.navigationController?.pushViewController(self.victoryVC, animated: true)
                }
                
            // ERRO DE RESPOSTA (TENTATIVAS) ======================================================================
            } else {
                // tempo
                endTimeDefeat = Date()
                timeElapsed = endTimeDefeat?.timeIntervalSince(startTime ?? Date()) ?? 0
                print("tempo até agora: \(timeElapsed!) segundos")
                
                // Se o jogador não acertar a resposta -> aquela fileira foi finalizada
                isRowSent[boardVC.currentRow] = true
                
                // Enquanto houverem tentativas
                if boardVC.currentRow < guesses.count - 1{
                    boardVC.currentRow += 1
                    boardVC.boardView.collectionView.reloadData()

                // Quando chegar no limite de tentativas
                } else {
                    // Mandou
                    isRowSent[boardVC.currentRow] = true
                    boardVC.boardView.collectionView.reloadData()
                    // desativa o botão após perder tudo
                    bottomButtonsVC.bottomButtonsView.sendButton.isEnabled = false
                    // Se o jogador não acertar após 6 tentativas
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        // NÃO CONSEGUIU
                        self.defeatVC.timeTaken = self.timeElapsed
                        self.defeatVC.regionAnswer = self.answer_region
                        UIImpactFeedbackGenerator.feedback(for: .rigid)
                        self.navigationController?.pushViewController(self.defeatVC, animated: true)
                    }
                }
            }
        } else {
            let alertController = UIAlertController(
                    title: "Palavra Não Encontrada!",
                    message: "A palavra que você digitou é inválida ou não existe...",
                    preferredStyle: .alert
                )
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(okAction)
                
                // Obtenha uma referência ao seu view controller atual e apresente o alerta
                guard let currentViewController = UIApplication.shared.windows.first?.rootViewController else {
                    return
                }
            
                self.addHapticFeedbackFromViewController(type: .error)
                currentViewController.present(alertController, animated: true, completion: nil)
                
        }

    }
    
}

extension MinigameWordDayViewController {
    
    // constrains para iPhone
    private func constrains_iPhone() {
        print("Constrains_iPhone")
        
        NSLayoutConstraint.activate([
            //background image
            imagebackground.topAnchor.constraint(equalTo: view.topAnchor),
            imagebackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imagebackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imagebackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Top Buttons
            topButtonsVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topButtonsVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topButtonsVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Board View
            boardVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            boardVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            boardVC.view.topAnchor.constraint(equalTo: topButtonsVC.view.bottomAnchor, constant: 20),
            boardVC.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.48),

            // Bottom Buttons
            bottomButtonsVC.view.topAnchor.constraint(equalTo: boardVC.view.bottomAnchor, constant: 15),
            bottomButtonsVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomButtonsVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Keyboard
            keyboard.topAnchor.constraint(equalTo: bottomButtonsVC.view.bottomAnchor, constant: 30),
            keyboard.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboard.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            keyboard.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
 
    }
    
    // constrains para iPad
    private func constrains_iPad() {
        print("Constrains_iPad")
        
        NSLayoutConstraint.activate([
            //background image
            imagebackground.topAnchor.constraint(equalTo: view.topAnchor),
            imagebackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imagebackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imagebackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Top Buttons
            topButtonsVC.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topButtonsVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            topButtonsVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Board View
            boardVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 200),
            boardVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -200),
            boardVC.view.topAnchor.constraint(equalTo: topButtonsVC.view.bottomAnchor, constant: 20),
            boardVC.view.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.55),
            
            // Bottom Buttons
            bottomButtonsVC.view.topAnchor.constraint(equalTo: boardVC.view.bottomAnchor, constant: 15),
            bottomButtonsVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            bottomButtonsVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            // Keyboard
            keyboard.topAnchor.constraint(equalTo: bottomButtonsVC.view.bottomAnchor, constant: 30),
            keyboard.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            keyboard.trailingAnchor.constraint(equalTo: view.trailingAnchor),            
            keyboard.bottomAnchor.constraint(equalTo: view.bottomAnchor)

        ])
    }
}




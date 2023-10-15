import UIKit

class CreditView: UIViewController {
    private lazy var imagebackground: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "CreditViewBackground")
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var buttonBack: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "closeButton"), for: .normal)
        button.tag = 10
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleLabel: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoCredits") // Substitua com o nome da sua imagem
        imageView.contentMode = .center
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Este jogo foi desenvolvido como atividade\n no Apple Developer Academy UCB, sob mentoria\n de Antônio Santos, Júlio Santos e Nadja Caldeira, \nFelipe Carvalho com Coordenação\n Pedagógica de Jair Barbosa."
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(named: "colorLetters")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "divader1") // Substitua com o nome da sua imagem
        image.contentMode = .center
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var boldTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Desenvolvimento"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(named: "colorLetters") // Defina a cor do texto
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var additionalTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Giovanni Favorin- iOS Developer \nGustavo Horestee - iOS Developer \nLeonardo Mota - iOS Developer \nVictor Assis - iOS Developer \nMaria Clara Guimarães - UI/UX Designer"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16) // Ajuste o tamanho e o estilo da fonte conforme necessário
        label.textColor = UIColor(named: "colorLetters") // Defina a cor do texto
        label.numberOfLines = 0 // Para permitir várias linhas, se necessário
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var divaderImage2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "divader2") // Substitua com o nome da sua imagem
        image.contentMode = .center
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var secondBoldTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Assets"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(named: "colorLetters") // Defina a cor do texto
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var assetsLabel: UILabel = {
        let label = UILabel()
        label.text = "Word Game icon by Regara from Noun Project \n Fire icon by YANDI RS from Noun Project \n Edit icon by Idwar from Noun Project "
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 16) // Ajuste o tamanho e o estilo da fonte conforme necessário
        label.textColor = UIColor(named: "colorLetters")
        label.numberOfLines = 0 // Para permitir várias linhas, se necessário
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var thirdBoldTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Agradecimentos"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textColor = UIColor(named: "colorLetters") // Defina a cor do texto
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    @objc private func actionButton(_ sender: UIButton!){
        dismiss(animated: true)
        self.addHapticFeedbackFromViewController(type: .error)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllerModel()
        
    }
}

extension CreditView: ViewControllerModel {
    func addSubviews() {
        view.addSubview(imagebackground)
        view.addSubview(buttonBack)
        view.addSubview(titleLabel) // Adicione a imageView do título à vista
        view.addSubview(descriptionLabel) // Adicione a UILabel para o texto
        view.addSubview(logoImage) // Adicione a imageView para a imagem abaixo do texto
        view.addSubview(boldTextLabel) // Adicione a UILabel para o texto em negrito
        view.addSubview(additionalTextLabel) // Adicione a UILabel para o texto adicional
        view.addSubview(divaderImage2)
        view.addSubview(secondBoldTextLabel) // Adicione a UILabel para o segundo texto em negrito
        view.addSubview(assetsLabel)
    }
    
    func addStyle() {
        view.backgroundColor = .systemBackground
    }
    
    func addConstraints() {
        NSLayoutConstraint.activate([
            imagebackground.topAnchor.constraint(equalTo: view.topAnchor),
            imagebackground.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            imagebackground.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imagebackground.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            buttonBack.topAnchor.constraint(equalTo: view.topAnchor, constant: 70),
            buttonBack.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            buttonBack.widthAnchor.constraint(equalToConstant: 40),
            buttonBack.heightAnchor.constraint(equalToConstant: 40),
            
            // Restrições para posicionar a imageView do título abaixo da safeArea
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 110), // Abaixo da safeArea com um espaçamento de 20
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Centralizado horizontalmente
            
            // Restrições para posicionar a UILabel abaixo da imageView do título
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 40), // Abaixo da imageView do título com espaçamento de 20
            descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Centralizado horizontalmente
            
            // Restrições para posicionar a imageView abaixo do texto
            logoImage.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 20), // Abaixo do texto com espaçamento de 20
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Centralizado horizontalmente
            
            // Restrições para posicionar o texto em negrito abaixo da imageView
            boldTextLabel.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 20), // Abaixo da imageView com espaçamento de 20
            boldTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Centralizado horizontalmente
            
            // Restrições para posicionar o texto adicional abaixo do texto em negrito
            additionalTextLabel.topAnchor.constraint(equalTo: boldTextLabel.bottomAnchor, constant: 20), // Abaixo do texto em negrito com espaçamento de 20
            additionalTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Centralizado horizontalmente
            divaderImage2.topAnchor.constraint(equalTo: additionalTextLabel.bottomAnchor, constant: 20),
            divaderImage2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Restrições para posicionar o segundo texto em negrito abaixo do segundo divisor
            secondBoldTextLabel.topAnchor.constraint(equalTo: divaderImage2.bottomAnchor, constant: 20), // Abaixo do segundo divisor com espaçamento de 20
            secondBoldTextLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Centralizado horizontalmente
            assetsLabel.topAnchor.constraint(equalTo: secondBoldTextLabel.bottomAnchor, constant: 20),
            assetsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}

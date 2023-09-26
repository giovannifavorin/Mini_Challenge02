import UIKit

class CreditoView: UIViewController {
    // Rótulo para exibir um texto
    let textLabel = makeHead(text: "Créditos")
    let Teste = makeBody(text: "Este jogo foi desenvolvido como atividade no Apple Developer Academy UCB, sob mentoria de Antônio Santos, Júlio Santos e Nadja Caldeira, Felipe Carvalho com Coordenação Pedagógica de Jair Barbosa.")
    let divider = makeDivider()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Configure a cor da view
        view.backgroundColor = .white

        // Adicione o rótulo à view
        view.addSubview(textLabel)
        view.addSubview(Teste)

        view.addSubview(divider)

        // Configure as restrições de layout para a textLabel
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 75),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 96.5),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -96.5)
        ])

        // Configure as restrições de layout para a Teste
        NSLayoutConstraint.activate([
            Teste.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 47),
            Teste.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 54.5),
            Teste.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -54.5),
        ])

        NSLayoutConstraint.activate([
            divider.topAnchor.constraint(equalTo: Teste.bottomAnchor, constant: 20),
            divider.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 155),
            divider.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -155),
            divider.heightAnchor.constraint(equalToConstant: 4) // Ajuste a altura conforme necessário
        ])

        // Permita que o texto quebre em várias linhas
        Teste.numberOfLines = 0

        // Configurar o botão de retorno na barra de navegação
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            title: "Voltar",
            style: .plain,
            target: self,
            action: #selector(backButtonTapped)
        )
    }

    @objc func backButtonTapped() {
        print("clicou")
        navigationController?.popViewController(animated: true)
    }

    // Função para criar e configurar um rótulo
    static func makeHead(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 32)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func makeSubHead(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }
    
    static func makeBody(text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    static func makeDivider() -> UIView {
        let roundedView = UIView()
        roundedView.backgroundColor = .black
        roundedView.translatesAutoresizingMaskIntoConstraints = false
        
        // Define o raio do canto para criar o retângulo arredondado
        roundedView.layer.cornerRadius = 2.5
        return roundedView
    }
}

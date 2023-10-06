import UIKit

class ModalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Configure a aparência da sua modal
        view.backgroundColor = UIColor.white
        
        // Crie um rótulo para exibir a mensagem
        let messageLabel = UILabel()
        messageLabel.text = "Olá, esta é uma modal!"
        messageLabel.textAlignment = .center
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Adicione o rótulo à view da modal
        view.addSubview(messageLabel)
        
        // Configure as restrições para posicionar o rótulo no centro da modal
        NSLayoutConstraint.activate([
            messageLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            messageLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        // Adicione um botão para fechar a modal
        let closeButton = UIButton(type: .system)
        closeButton.setTitle("Fechar", for: .normal)
        closeButton.addTarget(self, action: #selector(closeModal), for: .touchUpInside)
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Adicione o botão à view da modal
        view.addSubview(closeButton)
        
        // Configure as restrições para posicionar o botão na parte inferior da modal
        NSLayoutConstraint.activate([
            closeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            closeButton.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func closeModal() {
        // Método para fechar a modal quando o botão "Fechar" é pressionado
        dismiss(animated: true, completion: nil)
    }
}

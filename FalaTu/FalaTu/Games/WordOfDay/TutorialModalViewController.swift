import UIKit

class ModalViewController: UIViewController {
    
    private lazy var tutorial: UIImageView = {
        let modal = UIImageView(image: UIImage(named: "ModalLight"))
        modal.contentMode = .scaleAspectFit
        modal.translatesAutoresizingMaskIntoConstraints = false
        return modal
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tutorial)
        
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        NSLayoutConstraint.activate([
            tutorial.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
            tutorial.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tutorial.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50),
            tutorial.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
    }
}

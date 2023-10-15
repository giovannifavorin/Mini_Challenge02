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
        
        NSLayoutConstraint.activate([
            tutorial.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

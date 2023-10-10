import UIKit

class ModalViewController: UIViewController {
    
    private lazy var tutorial:UIImageView = {
        let modal = UIImageView(image: UIImage(named: "ModalLight"))
        modal.translatesAutoresizingMaskIntoConstraints = false
        modal.contentMode = .scaleAspectFit
        return modal
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tutorial)
        
        NSLayoutConstraint.activate([
            tutorial.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
//        tutorial.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
    }
}

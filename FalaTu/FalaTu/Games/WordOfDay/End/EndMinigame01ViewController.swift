//
//  EndMinigame01ViewController.swift
//  FalaTu
//
//  Created by Giovanni Favorin de Melo on 03/10/23.
//

import UIKit

class EndMinigame01ViewController: UIViewController {
    let endView = DefeatViewMinigame01(sequenceScore: "100", score: "100")
    private lazy var backMenuButton: UIButton = {
        let backMenuButton = UIButton(type: .custom)
        backMenuButton.translatesAutoresizingMaskIntoConstraints = false
        backMenuButton.setImage(UIImage(named: "button_backmenu"), for: .normal)
        backMenuButton.contentMode = .scaleAspectFit
//        backMenuButton.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        backMenuButton.tag = 1
        return backMenuButton
    }()// passar os buttons pra viewController
    
    private lazy var shareButton: UIButton = {
        let shareButton = UIButton(type: .custom)
        shareButton.translatesAutoresizingMaskIntoConstraints = false
        shareButton.setImage(UIImage(named: "button_share"), for: .normal)
        shareButton.contentMode = .scaleAspectFit
//        backMenuButton.addTarget(self, action: #selector(didButton), for: .touchUpInside)
        shareButton.tag = 1
        return shareButton
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(endView)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

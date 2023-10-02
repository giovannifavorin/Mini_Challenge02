//
//  KeyboardViewController.swift
//  FalaTu
//
//  Created by Leonardo Mota on 28/09/23.
//

import UIKit

protocol KeyboardViewControllerDelegate: AnyObject {
    func keyboardViewControllerDelegate(_ vc: KeyboardViewController, didTapKey letter: Character)
}

class KeyboardViewController: UIViewController, KeyboardViewDelegate {
    weak var delegate: KeyboardViewControllerDelegate?

    private let keyboardView: KeyboardView = {
        let view = KeyboardView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        keyboardView.delegate = self
        view.addSubview(keyboardView)
        
        NSLayoutConstraint.activate([
            keyboardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            keyboardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            keyboardView.topAnchor.constraint(equalTo: view.topAnchor),
            keyboardView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 30)
        ])
    }

    func keyTapped(_ letter: Character) {
        delegate?.keyboardViewControllerDelegate(self, didTapKey: letter)
    }
}

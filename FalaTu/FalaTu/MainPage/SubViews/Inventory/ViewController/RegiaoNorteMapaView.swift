//
//  RegiaoNorteMapaView.swift
//  FalaTu
//
//  Created by Leonardo Mota on 05/10/23.
//

import UIKit

class RegiaoNorteMapaView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    private func setupView() {
        self.frame = CGRect(x: 0, y: 0, width: 345.5, height: 235.5)
        self.layer.cornerRadius = 4

        let stroke = UIView()
        stroke.bounds = self.bounds.insetBy(dx: -7.5, dy: -7.5)
        stroke.center = self.center
        self.addSubview(stroke)
        stroke.layer.cornerRadius = 11.5
        stroke.layer.borderWidth = 15
        stroke.layer.borderColor = UIColor(red: 0.208, green: 0.196, blue: 0.212, alpha: 1).cgColor
    }
}


//
//  Button.swift
//  MagicApp
//
//  Created by Nick Babo on 30/03/21.
//

import Foundation
import UIKit

final class Button: UIButton, ViewCodable {

    init() {
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() { }

    func addConstraints() {
        layout.applyConstraint {
            $0.heightAnchor(equalToConstant: 42)
        }
    }

    func configure() {
        backgroundColor = .clear
        layer.cornerRadius = 42/2
        layer.borderWidth = 2
        layer.borderColor = UIColor.green.cgColor
        setTitleColor(.green, for: .normal)
    }

}

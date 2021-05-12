//
//  TextInput.swift
//  MagicApp
//
//  Created by Nick Babo on 11/05/21.
//

import UIKit

final class TextInput: UITextField {

    init() {
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TextInput: ViewCodable {

    func buildViewHierarchy() { }

    func addConstraints() {
        layout.applyConstraint { textField in
            textField.heightAnchor(equalToConstant: 44)
        }
    }

    func configure() {
        backgroundColor = .clear
        tintColor = .green
        layer.cornerRadius = 44/2
        layer.borderWidth = 2
        layer.borderColor = UIColor.black.cgColor

        autocorrectionType = .no
    }

}

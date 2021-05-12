//
//  TextInputView.swift
//  MagicApp
//
//  Created by Nick Babo on 11/05/21.
//

import UIKit

final class TextInputView: UIView {

    var didChangeInput: ((String?) -> Void)?

    lazy var textField: TextInput = TextInput()

    init() {
        super.init(frame: .zero)
        setupView()
        textField.delegate = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension TextInputView: ViewCodable {

    func buildViewHierarchy() {
        addSubview(textField)
    }

    func addConstraints() {
        textField.layout.applyConstraint { field in
            field.topAnchor(equalTo: topAnchor, constant: 16)
            field.bottomAnchor(equalTo: bottomAnchor, constant: -16)
            field.leftAnchor(equalTo: leftAnchor, constant: 16)
            field.rightAnchor(equalTo: rightAnchor, constant: -16)
        }
    }

    func configure() {
        backgroundColor = .white
    }

}

extension TextInputView: UITextFieldDelegate {

    func textFieldDidEndEditing(_ textField: UITextField) {
        didChangeInput?(textField.text)
    }

}

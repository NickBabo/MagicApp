//
//  FilterView.swift
//  MagicApp
//
//  Created by Nick Babo on 30/03/21.
//

import Foundation
import UIKit
import SketchKit

final class FilterView: UIView, ViewCodable {

    var didTapSearchButton: ((String?) -> Void)?
    var didSelectColorSearchRule: ((Int) -> Void)? {
        didSet {
            colorPickerView.didSelectRule = didSelectColorSearchRule
        }
    }

    private lazy var scrollView: UIScrollView = UIScrollView()
    private lazy var stackView: UIStackView = UIStackView()
    private lazy var textInputView: TextInputView = TextInputView()
    private lazy var colorPickerView: ColorPickerView = ColorPickerView()
    private lazy var searchButton: Button = Button()
    private lazy var bottomContainerView: UIView = UIView()

    init() {
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func buildViewHierarchy() {
        stackView.addArrangedSubview(textInputView)
        stackView.addArrangedSubview(colorPickerView)

        scrollView.addSubview(stackView)

        bottomContainerView.addSubview(searchButton)

        addSubview(scrollView)
        addSubview(bottomContainerView)
    }

    func addConstraints() {
        scrollView.layout.applyConstraint { scroll in
            scroll.topAnchor(equalTo: safeTopAnchor)
            scroll.leftAnchor(equalTo: leftAnchor)
            scroll.rightAnchor(equalTo: rightAnchor)
            scroll.bottomAnchor(equalTo: bottomContainerView.topAnchor)
        }

        stackView.layout.applyConstraint { stack in
            stack.topAnchor(equalTo: scrollView.topAnchor)
            stack.leftAnchor(equalTo: scrollView.leftAnchor)
            stack.rightAnchor(equalTo: scrollView.rightAnchor)
            stack.bottomAnchor(equalTo: scrollView.bottomAnchor)
            stack.widthAnchor(equalTo: scrollView.widthAnchor)
        }

        bottomContainerView.layout.applyConstraint { view in
            view.bottomAnchor(equalTo: bottomAnchor)
            view.leftAnchor(equalTo: leftAnchor)
            view.rightAnchor(equalTo: rightAnchor)
        }

        searchButton.layout.applyConstraint { button in
            button.topAnchor(
                equalTo: bottomContainerView.topAnchor,
                constant: 16
            )
            button.leftAnchor(
                equalTo: bottomContainerView.leftAnchor,
                constant: 16
            )
            button.rightAnchor(
                equalTo: bottomContainerView.rightAnchor,
                constant: -16
            )
            button.bottomAnchor(equalTo: safeBottomAnchor, constant: -16)
            button.heightAnchor(equalToConstant: 42)
        }
    }

    func configure() {
        backgroundColor = .white
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 16
        bottomContainerView.backgroundColor = .white
        bottomContainerView.applyShadow(
            offset: CGSize(width: 0, height: -2)
        )
        searchButton.setTitle("Search", for: .normal)
        searchButton.addTarget(self, action: #selector(tapSearchButton), for: .touchUpInside)
        stackView.backgroundColor = .lightGray
        textInputView.textField.placeholder = "Card name"
    }

    @objc
    func tapSearchButton() {
        didTapSearchButton?(textInputView.textField.text)
    }

    func show(_ viewModel: FilterViewModel) {
        colorPickerView.show(viewModel.colorRules)
    }

}

//
//  ColorPickerView.swift
//  MagicApp
//
//  Created by Nick Babo on 12/05/21.
//

import UIKit

final class ColorPickerView: UIView {

    var didSelectRule: ((Int) -> Void)?

    lazy var ruleSelector: UISegmentedControl = UISegmentedControl()

    init() {
        super.init(frame: .zero)
        setupView()
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension ColorPickerView: ViewCodable {

    func buildViewHierarchy() {
        addSubview(ruleSelector)
    }

    func addConstraints() {
        ruleSelector.layout.applyConstraint { view in
            view.topAnchor(equalTo: topAnchor, constant: 16)
            view.bottomAnchor(equalTo: bottomAnchor, constant: -16)
            view.centerXAnchor(equalTo: centerXAnchor)
        }
    }

    func configure() {
        backgroundColor = .white
        ruleSelector.selectedSegmentTintColor = .green
        ruleSelector.addTarget(
            self,
            action: #selector(didChangeRule),
            for: .valueChanged
        )
    }

    func show(_ options: [FilterViewModel.ColorRule]) {
        ruleSelector.removeAllSegments()

        var nextIndex: Int = 0

        options.forEach { option in
            ruleSelector.insertSegment(
                withTitle: option.description,
                at: nextIndex,
                animated: false
            )

            if option.isSelected {
                ruleSelector.selectedSegmentIndex = nextIndex
            }
            nextIndex += 1
        }
    }

    @objc
    func didChangeRule() {
        didSelectRule?(ruleSelector.selectedSegmentIndex)
    }

}

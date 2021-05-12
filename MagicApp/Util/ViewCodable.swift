//
//  ViewCodable.swift
//  MagicApp
//
//  Created by Nick Babo on 30/03/21.
//

import Foundation

protocol ViewCodable {
    func buildViewHierarchy()
    func addConstraints()
    func configure()
}

extension ViewCodable {

    func setupView() {
        buildViewHierarchy()
        addConstraints()
        configure()
    }

    func configure() { }

}

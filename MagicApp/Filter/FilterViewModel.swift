//
//  FilterViewModel.swift
//  MagicApp
//
//  Created by Nick Babo on 12/05/21.
//

import Foundation

struct FilterViewModel {

    var cardName: String?
    var colorRules: [ColorRule]

    init() {
        cardName = nil
        colorRules = [
            ColorRule(rule: .exactly, isSelected: true),
            ColorRule(rule: .including, isSelected: false)
        ]
    }

}

extension FilterViewModel {

    struct ColorRule {
        var rule: Rule
        var isSelected: Bool

        var description: String {
            rule.rawValue.capitalized
        }
    }

    enum Rule: String {
        case exactly
        case including
    }

}

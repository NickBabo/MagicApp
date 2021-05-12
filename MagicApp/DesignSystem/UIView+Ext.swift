//
//  UIView+Ext.swift
//  MagicApp
//
//  Created by Nick Babo on 30/03/21.
//

import Foundation
import UIKit

public extension UIView {

    func applyShadow(color: UIColor = .black,
                     opacity: Float = 0.1,
                     radius: CGFloat = 4,
                     offset: CGSize = CGSize(width: 0, height: 2)) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowRadius = radius
    }

}

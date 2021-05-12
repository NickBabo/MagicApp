//
//  Coordinator.swift
//  MagicApp
//
//  Created by Nick Babo on 30/03/21.
//

import Foundation
import UIKit

enum NavigationType {
    case root
    case push
    case present(() -> Void?)
}

protocol Coordinator {
    func start() -> UIViewController
}

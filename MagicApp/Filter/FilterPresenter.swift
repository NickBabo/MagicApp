//
//  FilterPresenter.swift
//  MagicApp
//
//  Created by Nick Babo on 12/05/21.
//

import Foundation

final class FilterPresenter {

    weak var controller: FilterViewController?

    var viewModel: FilterViewModel {
        didSet {
            controller?.show(viewModel)
        }
    }

    init() {
        viewModel = FilterViewModel()
    }

    func start() {
        controller?.show(viewModel)
    }

    func updateColorSearchRule(_ selectedIndex: Int) {

    }

}

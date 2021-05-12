//
//  FilterViewController.swift
//  MagicApp
//
//  Created by Nick Babo on 30/03/21.
//

import Foundation
import UIKit
import MagicSDK

final class FilterViewController: UIViewController {

    private let contentView: FilterView
    private let presenter: FilterPresenter = FilterPresenter()

    init(contentView: FilterView = FilterView()) {
        self.contentView = contentView
        super.init(nibName: nil, bundle: nil)
        presenter.controller = self
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureActions()
        presenter.start()
    }

    func show(_ viewModel: FilterViewModel) {
        contentView.show(viewModel)
    }

    private func configureActions() {
        contentView.didTapSearchButton = { [weak self] text in
            self?.searchCards(text: text)
        }

        contentView.didSelectColorSearchRule = { [weak self] index in
            self?.presenter.updateColorSearchRule(index)
        }
    }

    private func searchCards(text: String?) {
        let name = text ?? "Thassa"
        MagicSDK().cards(parameters: [.name(name)]) { result in
            switch result {
            case .success(let response):
                print(response.data)
            case .failure(let error):
                print(error)
            }
        }
    }

}

//
//  Coordinator.swift
//  MVVMDemo2
//
//  Created by Jose Vilson de Farias on 12/4/20.
//

import UIKit

class Coordinator {
    let service: CarDataSource
    let presenter: CarViewController

    init(service: CarDataSource) {
        self.service = service
        presenter = CarViewController()
        presenter.delegate = self

        DispatchQueue.global().asyncAfter(deadline: .now() + 2.0) {
            self.fetchFromBackend()
        }
    }

    func fetchFromBackend() {
        let viewModel = retrieveInformationFromBackend()
        DispatchQueue.main.async {
            self.presenter.viewModel = viewModel
        }
    }

    func retrieveInformationFromBackend() -> CarViewController.ViewModel {
        let result = service.fetchData()
        return CarViewController.ViewModel(color: result["color"],
                                           model: result["car"],
                                           year: result["year_built"])
    }
}

extension Coordinator: CarViewControllerDelegate {
    func buttonTapped() {
        fetchFromBackend()
    }
}

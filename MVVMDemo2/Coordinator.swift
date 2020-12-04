//
//  Coordinator.swift
//  MVVMDemo2
//
//  Created by Jose Vilson de Farias on 12/4/20.
//

import UIKit

class Coordinator {
    let service: MockService
    let presenter: RedViewController

    init(service: MockService) {
        self.service = service
        presenter = RedViewController()
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

    func retrieveInformationFromBackend() -> RedViewController.ViewModel {
        let result = service.fetchData()

        guard let color = result["color"],
              let car = result["car"],
              let year = result["year"]
        else {
            return RedViewController.ViewModel(carName: "unknown", year: "no year")
        }

        let model = RedViewController.ViewModel(carName: color + " " + car, year: "Year \(year)")
        return model
    }
}

extension Coordinator: RedViewControllerDelegate {
    func buttonTapped() {
        fetchFromBackend()
    }
}

//
//  ViewController.swift
//  MVVMDemo2
//
//  Created by Jose Vilson de Farias on 12/4/20.
//

import UIKit

protocol CarViewControllerDelegate: AnyObject {
    func buttonTapped()
}

class CarViewController: UIViewController {

    weak var delegate: CarViewControllerDelegate?

    let mainView = CarView()

    var viewModel: CarViewController.ViewModel? {
        didSet {
            updateModel()
        }
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    func updateModel() {
        guard let viewModel = viewModel
        else { return }

        mainView.backgroundColor = .blue
        mainView.setLabels(titleText: viewModel.carName, subTitleText: viewModel.year)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view = mainView
        mainView.delegate = self
        mainView.initializeUIElements()
        mainView.setLabels(titleText: "_________________", subTitleText: "_________")
    }
}

extension CarViewController: CarViewDelegate {
    func buttonTapped() {
        delegate?.buttonTapped()
    }
}


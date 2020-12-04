//
//  ViewController.swift
//  MVVMDemo2
//
//  Created by Jose Vilson de Farias on 12/4/20.
//

import UIKit

protocol RedViewControllerDelegate: AnyObject {
    func buttonTapped()
}

class RedViewController: UIViewController {

    weak var delegate: RedViewControllerDelegate?

    let mainView = MainView()

    struct ViewModel{
        let carName: String // Red Ferrari
        let year: String // Year 2020
    }

    var viewModel: RedViewController.ViewModel? {
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

extension RedViewController: MainViewDelegate {
    func buttonTapped() {
        delegate?.buttonTapped()
    }
}


//
//  MainView.swift
//  MVVMDemo2
//
//  Created by Jose Vilson de Farias on 12/4/20.
//

import UIKit

protocol CarViewDelegate: AnyObject {
    func buttonTapped()
}

class CarView: UIView {

    weak var delegate: CarViewDelegate?

    private let titleLabel = UILabel()
    private let subTitleLabal = UILabel()
    private let button = UIButton()

    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = .red

        titleLabel.textColor = .black
        subTitleLabal.textColor = .white

        button.setTitle("Get another car", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func initializeUIElements() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabal.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(titleLabel)
        self.addSubview(subTitleLabal)
        self.addSubview(button)

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            subTitleLabal.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            subTitleLabal.centerXAnchor.constraint(equalTo: self.centerXAnchor),

            button.topAnchor.constraint(equalTo: subTitleLabal.bottomAnchor, constant: 30),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])

        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }

    @objc func buttonTapped(ender: UIButton!) {
        print(self)
        delegate?.buttonTapped()
    }

    func setLabels(titleText: String, subTitleText: String) {
        print(self)
        print("set \(titleText) / \(subTitleText)")
        titleLabel.text = titleText
        subTitleLabal.text = subTitleText
        backgroundColor = titleText == "Red Ferrari" ? .red : .lightGray
        print(backgroundColor!)
    }

}

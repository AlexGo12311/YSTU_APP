//
//  ViewController.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 09.09.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private let label: UILabel = {
        let label = UILabel()
        label.text = "Hello, World"
        label.font = .Montserrat.Light.size(of: 48)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor)
        ])
    }


}


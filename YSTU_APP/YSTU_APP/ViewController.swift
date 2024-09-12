//
//  ViewController.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 09.09.2024.
//

import UIKit

class BaseController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        layoutViews()
        configure()
    }


}

@objc extension BaseController {
    func addViews() {}
    func layoutViews() {}
    func configure() {
        view.backgroundColor = .systemBackground
    }
}

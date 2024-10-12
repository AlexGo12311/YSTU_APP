//
//  MarksController.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 10.09.2024.
//

import UIKit

final class MarksController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Marks"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont.Montserrat.Bold.size(of: 28)]
    }
}

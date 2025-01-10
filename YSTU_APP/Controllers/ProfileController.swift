//
//  ProfileController.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 10.09.2024.
//

import UIKit

final class ProfileController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont.Montserrat.SemiBold.size(of: 17)]
    }
}

//
//  MarksCoordinator.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 10.09.2024.
//

import UIKit

class MarksCoordinator: Coordinator {
    override func start() {
        showMarksScene()
    }
}

fileprivate extension MarksCoordinator {
    func showMarksScene() {
        let vc = MarksController()
        navigationController.pushViewController(vc, animated: false)
    }
}

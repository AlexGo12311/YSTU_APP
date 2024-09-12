//
//  ScheduleCoordinator.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 10.09.2024.
//

import UIKit

class ScheduleCoordinator: Coordinator {
    override func start() {
        showScheduleScene()
    }
}

fileprivate extension ScheduleCoordinator {
    func showScheduleScene() {
        let vc = ScheduleController()
        navigationController.pushViewController(vc, animated: false)
    }
}

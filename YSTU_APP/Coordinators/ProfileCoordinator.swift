//
//  ProfileCoordinator.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 10.09.2024.
//

import UIKit

class ProfileCoordinator: Coordinator {
    override func start() {
        showProfileScene()
    }
}

fileprivate extension ProfileCoordinator {
    func showProfileScene() {
        let vc = ProfileController()
        navigationController.pushViewController(vc, animated: false)
    }
}

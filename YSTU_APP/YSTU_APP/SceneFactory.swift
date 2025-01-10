//
//  SceneFactory.swift
//  YSTU_APP
//
//  Created by Alex Neumark on 09.09.2024.
//

import UIKit

struct SceneFactory {
    static func makeMainFlow(superCoordinator: CoordinatorProtocol, finishDelegate: CoordinatorFinishDelegate) -> TabBarController {
        let scheduleNavController = UINavigationController()
        scheduleNavController.tabBarItem = UITabBarItem(title: "Schedule", image: UIImage(resource: .calendar), tag: 0)
        let scheduleCoordinator = ScheduleCoordinator(type: .schedule, navigationController: scheduleNavController, finishDelegate: finishDelegate)
        superCoordinator.addChildCoordinator(scheduleCoordinator)
        scheduleCoordinator.start()
        
        let marksNavController = UINavigationController()
        marksNavController.tabBarItem = UITabBarItem(title: "Marks", image: UIImage(resource: .star), tag: 1)
        let marksCoordinator = MarksCoordinator(type: .marks, navigationController: marksNavController, finishDelegate: finishDelegate)
        superCoordinator.addChildCoordinator(marksCoordinator)
        marksCoordinator.start()
        
        let profileNavController = UINavigationController()
        profileNavController.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(resource: .head), tag: 2)
        let profileCoordinator = ProfileCoordinator(type: .profile, navigationController: profileNavController, finishDelegate: finishDelegate)
        superCoordinator.addChildCoordinator(profileCoordinator)
        profileCoordinator.start()
        
        let controllers = [scheduleNavController, marksNavController, profileNavController]
        return TabBarController(controllers: controllers)
    }
}

//
//  TabBarViewController.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    private let feedVC = FeedViewController()
    private var logInVC = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        setupConthollers()
        
    }
  
    private func setupConthollers() {
        
        let feedVCNav = UINavigationController(rootViewController: feedVC)
        let logInVCNav = UINavigationController(rootViewController: logInVC)
        
        
        logInVCNav.tabBarItem.title = "LogIn"
        logInVCNav.tabBarItem.image = UIImage(systemName: "personalhotspot")
        logInVCNav.navigationBar.backgroundColor = .white
        
        feedVCNav.tabBarItem.title = "Profile"
        feedVCNav.tabBarItem.image = UIImage(systemName: "person.fill")
        feedVCNav.navigationBar.backgroundColor = .white
        
        viewControllers = [logInVCNav, feedVCNav]
    }
}

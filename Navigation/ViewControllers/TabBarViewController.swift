//
//  TabBarViewController.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    private var profileVC = ProfileViewController()
    private var feedVC = FeedViewController()
    private var logInVC = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        setupControllers()
    }
  
    private func setupControllers() {
        
        let feedVCNav = UINavigationController(rootViewController: feedVC)
        let logInVCNav = UINavigationController(rootViewController: logInVC)
        
        
        logInVCNav.tabBarItem.title = "LogIn"
        logInVCNav.tabBarItem.image = UIImage(systemName: "personalhotspot")
        logInVCNav.navigationBar.backgroundColor = .white
        
        feedVCNav.tabBarItem.title = "Feed"
        feedVCNav.tabBarItem.image = UIImage(systemName: "light.ribbon")
        feedVCNav.navigationBar.backgroundColor = .white
        
        viewControllers = [logInVCNav, feedVCNav]
    }
}

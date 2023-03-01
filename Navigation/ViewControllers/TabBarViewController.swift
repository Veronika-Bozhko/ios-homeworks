//
//  TabBarViewController.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit

final class TabBarViewController: UITabBarController {
    
    private let feedVC = FeedViewController()
    private let profileVC = ProfileViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .white
        setupConthollers()
    }
  
    private func setupConthollers() {
        
        let feedVCNav = UINavigationController(rootViewController: feedVC)
        
        let profileVCNav = UINavigationController(rootViewController: profileVC)
        
        feedVCNav.tabBarItem.title = "Лента профиля"
        feedVCNav.tabBarItem.image = UIImage(systemName: "light.ribbon")
        feedVCNav.navigationBar.backgroundColor = .white
        
        profileVCNav.tabBarItem.title = "Профиль"
        profileVCNav.tabBarItem.image = UIImage(systemName: "person.fill")
        
        profileVCNav.navigationBar.backgroundColor = .white
        viewControllers = [feedVCNav, profileVCNav]
    }
}

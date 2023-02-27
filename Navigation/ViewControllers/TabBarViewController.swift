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
        setupConthollers()
    }
  
    private func setupConthollers() {
        let navigationController = UINavigationController(rootViewController: feedVC)
        
        feedVC.tabBarItem.title = "Лента профиля"
        feedVC.tabBarItem.image = UIImage(systemName: "light.ribbon")
        
        profileVC.tabBarItem.title = "Профиль"
        profileVC.tabBarItem.image = UIImage(systemName: "person.fill")
        
        viewControllers = [navigationController, profileVC]
    }
}

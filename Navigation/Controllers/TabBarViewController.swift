//
//  TabBarViewController.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit
    
//MARK: - TabBarController
final class TabBarViewController: UITabBarController {
    
    private let feedVC = FeedViewController()
    private var logInVC = LogInViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = UIColor(named: "ColorBackground")
        setupControllers()
    }
    
    //MARK: - Creation NC
    private func setupControllers() {
        
        viewControllers = [
            createNavController(vc: logInVC, itemName: "logIn", itemImage: "personalhotspot"),
            createNavController(vc: feedVC, itemName: "Feed", itemImage: "light.ribbon")
        ]
    }
    
    //MARK: - Settings NC
    private func createNavController(vc: UIViewController, itemName: String, itemImage: String) -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(systemName: itemImage)?.withAlignmentRectInsets(.init(top: 5, left: 0, bottom: 0, right: 0)), tag: 0)
        item.titlePositionAdjustment = .init(horizontal: 0, vertical: 0)
        
        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        
        return navController
    }
}

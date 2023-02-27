//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let profileHeaderView = ProfileHeaderView()
    
    func setupProfileViewController() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220),
    
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мой профиль"
        view.backgroundColor = .lightGray
        view.addSubview(profileHeaderView)
        setupProfileViewController()
        
    }
}

    


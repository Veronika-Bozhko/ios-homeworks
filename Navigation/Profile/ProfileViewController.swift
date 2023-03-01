//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private lazy var profileView: ProfileHeaderView = {
        let profileView = ProfileHeaderView()
        profileView.backgroundColor = .lightGray
        return profileView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        view.backgroundColor = .white
        setupView()
    }
    
    private func setupView() {
        view.addSubview(profileView)
    }
    
    @objc private func statusButtonPressed() {
        profileView.statusLabel.text = profileView.statusTextField.text
    }

        internal override func viewWillLayoutSubviews() {
            profileView.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([

                profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                profileView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    }
    

    


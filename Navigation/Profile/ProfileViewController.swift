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
        profileView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return profileView
    }()
    
    private lazy var newBottomButton: UIButton = {
        var bottomButton = UIButton(type: .system)
        bottomButton = UIButton()
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.setTitle("Новая кнопка", for: .normal)
        bottomButton.setTitleColor(.white, for: .normal)
        bottomButton.backgroundColor = .systemBlue
        bottomButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        bottomButton.layer.cornerRadius = 16
        bottomButton.layer.shadowColor = UIColor.black.cgColor
        bottomButton.layer.shadowOpacity = 0.7
        return bottomButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"
        view.backgroundColor = .white
//        view.addSubview(profileView)
        view.addSubview(newBottomButton)
        setupView()
        
    }
    
    private func setupView() {
        view.addSubview(profileView)
    }
    
    @objc private func statusButtonPressed() {
        
    }

    internal override func viewWillLayoutSubviews() {
        profileView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([

            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            profileView.heightAnchor.constraint(equalToConstant: 220),
            
            newBottomButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            newBottomButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            newBottomButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            newBottomButton.heightAnchor.constraint(equalToConstant: 50)
    
        ])

    }
    
}
    

    


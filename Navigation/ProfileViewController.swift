//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private let headerLebel: UILabel = {
        let header = UILabel(frame: CGRect(x: 20, y: 90, width: 350, height: 40))
        header.backgroundColor = .darkGray
        return header
    }()
    
    init(textForLebel: String? = "Имя пользователя") {
        super.init(nibName: nil, bundle: nil)
        headerLebel.text = textForLebel
        headerLebel.textColor = .white
        headerLebel.font = UIFont.boldSystemFont(ofSize: 20.0)
        headerLebel.textAlignment = .center
    }
    
    @objc private func tapAction() {
        let profileVC = ProfileViewController()
        profileVC.title = "Profile VC"
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        view.addSubview(headerLebel)
        tapAction()
    }
    
}

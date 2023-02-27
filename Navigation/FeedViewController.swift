//
//  FeedViewController.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private let postTitle = Post(title: "PostStrucTitle")
    
    private let nextPageButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        button.layer.cornerRadius = 16
        button.setTitle("Смотреть пост", for: .normal)
        button.backgroundColor = .darkGray
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .black)
        return button
    }()
    
    @objc func actionPostButton() {
        let postVC = PostViewController()
        postVC.title = postTitle.title
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        setupButtom()
//        tapAction()
    }
    
    private func setupButtom() {
        view.addSubview(nextPageButton)
        nextPageButton.center = view.center
        nextPageButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
    }
    
    private func makeBarItem() {
        let barItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(barItemAction))
        navigationItem.rightBarButtonItem = barItem
        barItem.image = .init(systemName: "info.circle.fill")
    }
    
    @objc private func tapAction() {
        let profileVC = PostViewController()
        profileVC.title = "Profale VC"
        navigationController?.pushViewController(profileVC, animated: true)
    }
    
    @objc private func barItemAction() {
        let postVC = PostViewController()
        postVC.title = "Post VC"
        postVC.modalPresentationStyle = .fullScreen
        // present(postVC, animated: true)
        navigationController?.pushViewController(postVC, animated: true)
    }
}

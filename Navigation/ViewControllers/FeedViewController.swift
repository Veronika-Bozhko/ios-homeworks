//
//  FeedViewController.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private let postTitle = Post(title: "PostStrucTitle")
    
    private let stackView: UIStackView = {
        $0.axis = .vertical
         $0.spacing = 10
         $0.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
         $0.alignment = .center
         $0.distribution = .fillEqually
         $0.translatesAutoresizingMaskIntoConstraints = false
         return $0
     }(UIStackView())
    
    private let newTopButton: UIButton = {
        var topButton = UIButton(type: .system)
        topButton = UIButton()
        topButton.translatesAutoresizingMaskIntoConstraints = false
        topButton.setTitle("Смотреть пост", for: .normal)
        topButton.setTitleColor(.white, for: .normal)
        topButton.backgroundColor = .systemBlue
        topButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        topButton.layer.cornerRadius = 16
        topButton.layer.shadowColor = UIColor.black.cgColor
        topButton.layer.shadowOpacity = 0.7
        return topButton
    }()
    
    private let newBottomButton: UIButton = {
        var bottomButton = UIButton(type: .system)
        bottomButton = UIButton()
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        bottomButton.setTitle("Смотреть пост", for: .normal)
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
        view.backgroundColor = .white
        title = "Feed"
        view.addSubview(newTopButton)
        view.addSubview(newBottomButton)
        setupButtom()
    }
    
    @objc func actionPostButton() {
        let postVC = PostViewController()
        postVC.title = postTitle.title
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    private func setupButtom() {
        view.addSubview(newTopButton)
        view.addSubview(newBottomButton)
        newTopButton.center = view.center
        newTopButton.addTarget(self, action: #selector(barItemAction), for: .touchUpInside)
        newBottomButton.center = view.center
        newBottomButton.addTarget(self, action: #selector(barItemAction), for: .touchUpInside)
    }
    
    private func makeBarItem() {
        let barItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(barItemAction))
        navigationItem.rightBarButtonItem = barItem
        barItem.image = .init(systemName: "info.circle.fill")
    }
    
    @objc private func barItemAction() {
        let postVC = PostViewController()
        postVC.title = "Пост"
        postVC.modalPresentationStyle = .fullScreen
        // present(postVC, animated: true)
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    internal override func viewWillLayoutSubviews() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            
            newTopButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 200),
            newTopButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            newTopButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            newTopButton.heightAnchor.constraint(equalToConstant: 100),
            
            newBottomButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            newBottomButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -16),
            newBottomButton.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -32),
            newBottomButton.heightAnchor.constraint(equalToConstant: 100)
            
        ])
    }
}

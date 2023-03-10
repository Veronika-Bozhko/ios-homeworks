//
//  FeedViewController.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private let postTitle = Post(title: "Post")
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    
    private lazy var topButton: UIButton = {
        var topButton = UIButton()
        topButton.setTitle("Смотреть пост", for: .normal)
        topButton.tintColor = .white
        topButton.backgroundColor = .systemBlue
        topButton.layer.cornerRadius = 16
        topButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        topButton.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).cgColor
        topButton.layer.shadowOpacity = 0.7
        topButton.layer.shadowOffset = CGSizeMake(0.0, 5.0)
        topButton.addTarget(self, action: #selector(actionPostButton), for: .touchUpInside)
        topButton.translatesAutoresizingMaskIntoConstraints = false
        return topButton
    }()
    
    private lazy var bottomButton: UIButton = {
        var bottomButton = UIButton()
        bottomButton.setTitle("Смотреть пост", for: .normal)
        bottomButton.tintColor = .white
        bottomButton.backgroundColor = .systemBlue
        bottomButton.layer.cornerRadius = 16
        bottomButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        bottomButton.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).cgColor
        bottomButton.layer.shadowOpacity = 0.7
        bottomButton.layer.shadowOffset = CGSizeMake(0.0, 5.0)
        bottomButton.addTarget(self, action: #selector(actionPostButton), for: .touchUpInside)
        bottomButton.translatesAutoresizingMaskIntoConstraints = false
        return bottomButton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Feed"
        setupButton()
        setupConstraints()
    }
    
    @objc func actionPostButton() {
        let postVC = PostViewController()
        postVC.title = postTitle.title
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    private func setupButton() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(topButton)
        stackView.addArrangedSubview(bottomButton)

    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            topButton.widthAnchor.constraint(equalToConstant: 50),
            bottomButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}

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

    
    private lazy var topButtom: UIButton = {
        var topButtom = UIButton()
        topButtom.setTitle("Смотреть пост", for: .normal)
        topButtom.tintColor = .white
        topButtom.backgroundColor = .systemBlue
        topButtom.layer.cornerRadius = 16
        topButtom.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        topButtom.layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).cgColor
        topButtom.layer.shadowOpacity = 0.7
        topButtom.layer.shadowOffset = CGSizeMake(0.0, 5.0)
        topButtom.addTarget(self, action: #selector(actionPostButton), for: .touchUpInside)
        topButtom.translatesAutoresizingMaskIntoConstraints = false
        return topButtom
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
        setupButtom()
        setupConstraints()
    }
    
    @objc func actionPostButton() {
        let postVC = PostViewController()
        postVC.title = postTitle.title
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    private func setupButtom() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(topButtom)
        stackView.addArrangedSubview(bottomButton)

    }

    private func setupConstraints() {

        NSLayoutConstraint.activate([
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            topButtom.widthAnchor.constraint(equalToConstant: 50),
            bottomButton.widthAnchor.constraint(equalToConstant: 50)
        ])
    }
}

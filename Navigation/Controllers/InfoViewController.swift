//
//  InfoViewController.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit

class InfoViewController: UIViewController {

//MARK: - Add Back Button
    private lazy var backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 300, height: 50))
        button.layer.cornerRadius = 16
        button.setTitle("Хотите выйти?", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        button.backgroundColor = .darkGray
        return button
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
          setupButton()
      }
    
//MARK: - Setup Button
    private func setupButton() {
        view.addSubview(backButton)
        backButton.center = view.center
        backButton.addTarget(self, action: #selector(backAction), for: .touchUpInside)
    }
    
//MARK: - Action Back Button
    @objc private func backAction() {
        
        let alert = UIAlertController(title: "Уверены?", message: nil, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Выйти", style: .default) { _ in
            self.navigationController?.popViewController(animated: true)
            print("Нажатие \"Выйти\"")
        }
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
        print("Нажатие \"Отмена\"")
        
        alert.addAction(cancelAction)
        alert.addAction(okAction)
        present(alert, animated: true)
        
    }
}
    

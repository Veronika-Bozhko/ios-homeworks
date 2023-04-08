//
//  PostViewController.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit

final class PostViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "ColorBackground")
        barButtonItem()
    }
    
//MARK: - Bar Button Item
    private func barButtonItem() {
        lazy var barButton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(barItemAction))
        navigationItem.rightBarButtonItem = barButton
        barButton.image = .init(systemName: "info.circle.fill")
    }
    
//MARK: - Bar Item Action
    @objc private func barItemAction() {
        let infoVC = InfoViewController()
        navigationController?.pushViewController(infoVC, animated: true)
    }
}

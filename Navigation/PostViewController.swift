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
        view.backgroundColor = .systemYellow
        barBattonItem()
    }
    
    private func barBattonItem() {
        lazy var barBatton = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(barItemAction))
        navigationItem.rightBarButtonItem = barBatton
        barBatton.image = .init(systemName: "info.circle.fill")
    }
    
    @objc private func barItemAction() {
        let infoVC = InfoViewController()
        navigationController?.pushViewController(infoVC, animated: true)
    }
}

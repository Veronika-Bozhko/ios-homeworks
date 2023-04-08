//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private var cartoon:[[Any]]  = [["Photos"], Cartoons2022.makePost()]

//MARK: - Add Table View
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .singleLine
        tableView.sectionHeaderTopPadding = .zero
        tableView.sectionHeaderHeight = .zero
        tableView.sectionFooterHeight = .zero
        tableView.separatorColor = .black
        tableView.separatorInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        tableView.backgroundColor = UIColor(named: "ColorBackground")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Profile"
        view.backgroundColor = UIColor(named: "ColorBackground")
        setupLayoutConstraints()
    }
    
//MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

//MARK: - Extension UITableViewDataSource
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return cartoon.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cartoon[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.delegate = self
            return cell
        
        default:
            if let post: Cartoons2022 = cartoon[indexPath.section][indexPath.row] as? Cartoons2022 {
                let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
                cell.setupCell(cartoon: post)
                return cell
            } else { return UITableViewCell() }
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return section == 0 ? ProfileHeaderView() : nil
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
}

//MARK: - Extension UITableViewDelegate
extension ProfileViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && editingStyle == .delete {
            cartoon[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if var cartoon: Cartoons2022 = cartoon[indexPath.section][indexPath.row] as? Cartoons2022 {
            let additionVC = AdditionViewController()
            cartoon.views += 1
            additionVC.viewsLabel.text = "Views: \(cartoon.views)"
            additionVC.likesLabel.text = "Likes: \(cartoon.likes)"
            additionVC.detailedImageView.image = UIImage(named: cartoon.image)
            additionVC.descriptionLabel.text = cartoon.description
            additionVC.titleLabel.text = cartoon.author
            navigationController?.pushViewController(additionVC, animated: true)
        }
    }
}

//MARK: - Setting Gallery Button Action
extension ProfileViewController: PhotosTableViewCellDelegate {
    @objc internal func galleryButtonAction() {
        let photosVC = PhotosViewController()
        navigationController?.pushViewController(photosVC, animated: true)
    }
}


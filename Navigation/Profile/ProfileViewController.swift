//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    private var model:[[Any]]  = [["Photos"], Cartoons2022.makePost()]

    //MARK: - Add Table View
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.separatorStyle = .none
        tableView.sectionHeaderTopPadding = .zero
        tableView.sectionHeaderHeight = .zero
        tableView.sectionFooterHeight = .zero
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
        layout()
    }
    
    private func layout() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
extension ProfileViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell: PhotosTableViewCell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.goToGalleryButton.addTarget(self, action: #selector(setupGoToGalleryButton), for: .touchUpInside)
            return cell
        
        default:
            if let post: Cartoons2022 = model[indexPath.section][indexPath.row] as? Cartoons2022 {
                let cell: PostTableViewCell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
                cell.setupCell(cartoon: post)
                return cell
            } else { return UITableViewCell() }
            
        }
    }
    
    @objc private func setupGoToGalleryButton() {
            let photosVC = PhotosViewController()
            navigationController?.pushViewController(photosVC, animated: true)
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

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && editingStyle == .delete {
            model[indexPath.section].remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
}

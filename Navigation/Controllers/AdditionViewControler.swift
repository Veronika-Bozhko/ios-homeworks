//
//  AdditionViewControler.swift
//  Navigation
//
//  Created by Veronika Bozhko on 08.04.2023.
//

import UIKit

final class AdditionViewController: UIViewController {
    
    private let screenWidth = UIScreen.main.bounds.width
    
//MARK: - Adding Scroll View
    private  lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        scroll.translatesAutoresizingMaskIntoConstraints = false
        return scroll
    }()
    
//MARK: - Adding Content View
    private let contentView: UIView = {
        let content = UIView()
        content.translatesAutoresizingMaskIntoConstraints = false
        return content
    }()
    
//MARK: - Adding Title Label
    lazy var titleLabel: UILabel = {
        let title = UILabel(frame: .zero)
        title.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        title.textColor = UIColor(named: "ColorLabel")
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
//MARK: - Adding Detailed Image View
    lazy var detailedImageView: UIImageView = {
        let image = UIImageView()
        image.backgroundColor = .white
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
//MARK: - Adding Description Label
    lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(named: "ColorDescription")
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//MARK: - Adding Likes Label
    lazy var likesLabel: UILabel = {
        let like = UILabel()
        like.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        like.textColor = UIColor(named: "ColorLabel")
        like.translatesAutoresizingMaskIntoConstraints = false
        like.isUserInteractionEnabled = true
        return like
    }()
    
//MARK: - Adding Views Label
    lazy var viewsLabel: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        view.textColor = UIColor(named: "ColorLabel")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "ColorBackground")
        title = "Description Сartoon"
        navigationController?.setNavigationBarHidden(false, animated: true)
        setupLayoutConstraints()
    }
    
//MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(titleLabel)
        scrollView.addSubview(detailedImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)
        
        NSLayoutConstraint.activate([

            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            titleLabel.bottomAnchor.constraint(equalTo: detailedImageView.topAnchor, constant: -16),

            detailedImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            detailedImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            detailedImageView.heightAnchor.constraint(equalToConstant: screenWidth),

            descriptionLabel.topAnchor.constraint(equalTo: detailedImageView.bottomAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.bottomAnchor.constraint(equalTo: likesLabel.topAnchor, constant: -16),

            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
        ])
    }
}








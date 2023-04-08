//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Veronika Bozhko on 21.03.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private var cartoonImage = Cartoons2022(author: "", image: "", likes: 1, views: 1, description: "")
    private let screenWidth = UIScreen.main.bounds.width

//MARK: - Adding Author Label
    private lazy var authorLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(named: "ColorLabel")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

//MARK: - Adding Image View
    private lazy var myImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = UIColor(named: "ColorBackground")
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

//MARK: - Adding Description Label
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor(named: "BorderStatusTextField")
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

//MARK: - Adding Likes Label
    private lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(named: "ColorLabel")
        label.isUserInteractionEnabled = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

//MARK: - Adding Views Label
    private lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor(named: "ColorLabel")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = UIColor(named: "ColorBackground")
        setupLayoutConstraints()
        setupGestures()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
// MARK: - Setup Gestures Tap Like Label Gesture
    private func setupGestures() {
        let tapLikeLabelGesture = UITapGestureRecognizer(target: self, action: #selector(likeAction))
        likesLabel.addGestureRecognizer(tapLikeLabelGesture)
    }
    
// MARK: - Like Action Tap Like Label Gesture
    @objc private func likeAction() {
        UIView.animate(withDuration: 0.5,
                       delay: 0.0,
                       usingSpringWithDamping: 1.0,
                       initialSpringVelocity: 0.0,
                       options: .curveEaseInOut) {
            
            self.cartoonImage.likes += 1
            self.likesLabel.text = "Likes \(self.cartoonImage.likes)"
        }
    }

//MARK: - Setup Cell
    func setupCell(cartoon: Cartoons2022) {
        cartoonImage = cartoon
        authorLabel.text = cartoon.author
        myImageView.image = UIImage(named: cartoon.image)
        likesLabel.text = "Likes: \(cartoon.likes)"
        viewsLabel.text = "Views: \(cartoon.likes)"
        descriptionLabel.text = cartoon.description
    }

//MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {

        contentView.addSubview(authorLabel)
        contentView.addSubview(myImageView)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(likesLabel)
        contentView.addSubview(viewsLabel)

        NSLayoutConstraint.activate([

            authorLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),

            myImageView.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            myImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            myImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            myImageView.heightAnchor.constraint(equalToConstant: screenWidth),

            descriptionLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 16),
            descriptionLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),

            likesLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            likesLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),

            viewsLabel.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)

        ])
    }
}

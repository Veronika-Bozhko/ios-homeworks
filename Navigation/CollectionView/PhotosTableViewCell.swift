//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Veronika Bozhko on 23.03.2023.
//

import UIKit

final class PhotosTableViewCell: UITableViewCell {
    
    //MARK: - Add PhotosLabel
    let photosTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.textColor = UIColor(named: "ColorLabel")
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    //MARK: - Add GoToGalleryButton
    var goToGalleryButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = UIColor(named: "ColorTintButton")
        return button
    }()
    
    //MARK: - Add ImageView1
    let imageView1: UIImageView = {
        let image1 = UIImageView()
        image1.translatesAutoresizingMaskIntoConstraints = false
        image1.contentMode = .scaleAspectFill
        image1.clipsToBounds = true
        image1.layer.cornerRadius = 6
        image1.image = UIImage(named: "1")
        return image1
    }()
    
    //MARK: - Add ImageView2
    let imageView2: UIImageView = {
        let image2 = UIImageView()
        image2.translatesAutoresizingMaskIntoConstraints = false
        image2.contentMode = .scaleAspectFill
        image2.clipsToBounds = true
        image2.layer.cornerRadius = 6
        image2.image = UIImage(named: "2")
        return image2
    }()
    
    //MARK: - Add ImageView3
    let imageView3: UIImageView = {
        let image3 = UIImageView()
        image3.translatesAutoresizingMaskIntoConstraints = false
        image3.contentMode = .scaleAspectFill
        image3.clipsToBounds = true
        image3.layer.cornerRadius = 6
        image3.image = UIImage(named: "3")
        return image3
    }()
    
    //MARK: - Add ImageView4
    let imageView4: UIImageView = {
        let image4 = UIImageView()
        image4 .translatesAutoresizingMaskIntoConstraints = false
        image4 .contentMode = .scaleAspectFill
        image4 .clipsToBounds = true
        image4 .layer.cornerRadius = 6
        image4 .image = UIImage(named: "4")
        return image4
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup Layout
    func layout() {
        
        [photosTextLabel, goToGalleryButton, imageView1, imageView2, imageView3, imageView4].forEach { contentView.addSubview($0) }
        contentView.layer.borderWidth = 0
        
        let inset: CGFloat = 12
        let insetImage: CGFloat = 8
        let screenWidth = UIScreen.main.bounds.width
        let imageWidth = (screenWidth - 48) / 4
        let imageHeight = imageWidth / 4 * 3
        
        NSLayoutConstraint.activate([
            photosTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: inset),
            photosTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            photosTextLabel.trailingAnchor.constraint(equalTo: contentView.centerXAnchor),
            
            goToGalleryButton.centerYAnchor.constraint(equalTo: photosTextLabel.centerYAnchor),
            goToGalleryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            
            imageView1.topAnchor.constraint(equalTo: photosTextLabel.bottomAnchor, constant: inset),
            imageView1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: inset),
            imageView1.widthAnchor.constraint(equalToConstant: imageWidth),
            imageView1.heightAnchor.constraint(equalToConstant: imageHeight),
            imageView1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            
            imageView2.topAnchor.constraint(equalTo: photosTextLabel.bottomAnchor, constant: inset),
            imageView2.leadingAnchor.constraint(equalTo: imageView1.trailingAnchor, constant: insetImage),
            imageView2.widthAnchor.constraint(equalToConstant: imageWidth),
            imageView2.heightAnchor.constraint(equalToConstant: imageHeight),
            imageView2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            
            imageView3.topAnchor.constraint(equalTo: photosTextLabel.bottomAnchor, constant: inset),
            imageView3.leadingAnchor.constraint(equalTo: imageView2.trailingAnchor, constant: insetImage),
            imageView3.widthAnchor.constraint(equalToConstant: imageWidth),
            imageView3.heightAnchor.constraint(equalToConstant: imageHeight),
            imageView3.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset),
            
            imageView4.topAnchor.constraint(equalTo: photosTextLabel.bottomAnchor, constant: inset),
            imageView4.widthAnchor.constraint(equalToConstant: imageWidth),
            imageView4.heightAnchor.constraint(equalToConstant: imageHeight),
            imageView4.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -inset),
            imageView4.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -inset)
        ])
    }
}


//
//  CollectionViewCellTable.swift
//  Navigation
//
//  Created by Veronika Bozhko on 23.03.2023.
//

import UIKit

final class CollectionViewCellTable: UICollectionViewCell {
        
// MARK: - Adding Image View
    private lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 6
        image.clipsToBounds = true
        return image
    }()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "ColorBackground")
        setupLayoutConstraintsCell()
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
// MARK: - Setup Image Cartoon
    func setupImageCartoon(_ image: Photos) {
        imageView.image = UIImage(named: image.image)
    }
        
// MARK: - Setup Layout Constraints Cell
    func setupLayoutConstraintsCell() {
        contentView.addSubview(imageView)
            
        NSLayoutConstraint.activate ([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 2),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -2),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

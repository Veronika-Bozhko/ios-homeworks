//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Veronika Bozhko on 08.04.2023.
//

import UIKit

// MARK: - Protocol Photo Cell Delegate
protocol PhotoCellDelegate: AnyObject {
    func tapAction(photo: UIImage)
    func cancelAnimationButton()
}

final class CollectionViewCell: UICollectionViewCell {

    weak var buttonAllPhotoCellDelegate: PhotoCellDelegate?

//MARK: - Adding Image View
    lazy var collectionImageView: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 5
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayoutConstraints()
        setupGestures()
    }

    required init?(coder: NSCoder) {
        fatalError()
    }

// MARK: - Setup Gestures
    private func setupGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(photoAction))
        collectionImageView.isUserInteractionEnabled = true
        collectionImageView.addGestureRecognizer(tapGesture)
    }

// MARK: - Photo Action
    @objc private func photoAction() {
        buttonAllPhotoCellDelegate?.tapAction(photo: collectionImageView.image!)
    }

//MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {
        contentView.addSubview(collectionImageView)

        NSLayoutConstraint.activate ([
            collectionImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            collectionImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}




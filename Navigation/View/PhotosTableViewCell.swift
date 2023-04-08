//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Veronika Bozhko on 23.03.2023.
//

import UIKit

// MARK: - Protocol Photos Table View Cell Delegate
protocol PhotosTableViewCellDelegate: AnyObject {
    func galleryButtonAction()
}

final class PhotosTableViewCell: UITableViewCell {
    
    weak var delegate: PhotosTableViewCellDelegate?
    private let photos = Photos.setupImage()

// MARK: - Adding Collection View Horizontal
    private lazy var collectionView: UICollectionView = {
        let layoutCollection = UICollectionViewFlowLayout()
        layoutCollection.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero ,collectionViewLayout: layoutCollection)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "backgroundColor")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CollectionViewCellTable.self, forCellWithReuseIdentifier: CollectionViewCellTable.identifier)
        return collectionView
    }()
    
//MARK: - Adding Photos Text Label
   private lazy var photosTextLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Photos"
        label.textColor = UIColor(named: "ColorLabel")
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
//MARK: - Adding Go To Gallery Button
    private lazy var goToGalleryButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName: "arrow.right"), for: .normal)
        button.tintColor = UIColor(named: "ColorTintButton")
        button.addTarget(self, action: #selector(galleryButtonAction), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayoutConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Gallery Button Action
    @objc private func galleryButtonAction() {
        delegate?.galleryButtonAction()
    }
    
//MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {

        contentView.addSubview(collectionView)
        contentView.addSubview(photosTextLabel)
        contentView.addSubview(goToGalleryButton)
        
        NSLayoutConstraint.activate([
            photosTextLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            photosTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),

            goToGalleryButton.centerYAnchor.constraint(equalTo: photosTextLabel.centerYAnchor),
            goToGalleryButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            goToGalleryButton.widthAnchor.constraint(equalToConstant: 50),
            goToGalleryButton.heightAnchor.constraint(equalToConstant: 50),

            collectionView.topAnchor.constraint(equalTo: photosTextLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12 - 8),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12 + 8),
            collectionView.heightAnchor.constraint(equalToConstant: 100),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12)
        ])
    }
}

// MARK: - Extension UICollectionViewDataSource
extension PhotosTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellTable.identifier, for: indexPath) as? CollectionViewCellTable else { return CollectionViewCellTable() }
        let photos = photos[indexPath.item]
        cell.backgroundColor = UIColor(named: "ColorBackground")
        cell.setupImageCartoon(photos)
        return cell
    }
}

// MARK: - Extension UICollectionViewDelegateFlowLayout
extension PhotosTableViewCell: UICollectionViewDelegateFlowLayout {
    var sideInset: CGFloat { return 8 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (collectionView.bounds.width - sideInset * 3) / 4
        return CGSize(width: height, height: height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 1, left: sideInset, bottom: 1, right: sideInset)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
}

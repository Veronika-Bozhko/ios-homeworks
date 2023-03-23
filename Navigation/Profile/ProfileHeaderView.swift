//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    //MARK: - Add Avatar Image
    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "Batman")
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        image.clipsToBounds = true
        image.layer.cornerRadius = 50.0
        image.layer.borderWidth = 3.0
        image.layer.borderColor = UIColor.white.cgColor
        image.layer.masksToBounds = true
        return image
    }()
    
    //MARK: - Add Title Label
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ночной защитник"
        label.textColor = UIColor(named: "ColorLabel")
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    //MARK: - Add Status Label
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидание..."
        label.textColor = UIColor(named: "ColorStatusLabel")
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
    
    //MARK: - Add Status Button
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Показать статус", for: .normal)
        button.setTitleColor(UIColor(named: "ColorTintButtonHeader"), for: .normal)
        button.backgroundColor = UIColor(named: "ColorButtonBackground")
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.layer.shadowColor = UIColor(named: "ColorShadow")?.cgColor
        button.layer.shadowOffset = CGSizeMake(0.0, 4.0)
        button.layer.cornerRadius = 14
        button.layer.shadowOpacity = 0.2
        button.isEnabled = true
        button.addTarget(ProfileHeaderView.self, action: #selector(statusButtonPressed), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Add Text Field
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Введите статус"
        textField.backgroundColor = UIColor(named: "ColorBackground")
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.clearButtonMode = .whileEditing
        textField.layer.borderColor = UIColor(named: "BorderstatusTextField")?.cgColor
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.textColor = UIColor(named: "ColorLabel")
        textField.indent(size: 10)
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .systemGray4
        setupProfileHeaderView()
        customizeCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func statusButtonPressed() {
        statusLabel.text = statusTextField.text
        print(statusLabel.text!)
        print(statusLabel.intrinsicContentSize)
    }
    
    //MARK: - Add Properties HeaderView
    private func customizeCell() {
//        backgroundColor = UIColor(named: "ColorBackground")
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.darkGray.cgColor
    }
    
    //MARK: - Setup Layout
    func setupProfileHeaderView() {
        [avatarImageView, fullNameLabel, statusLabel, statusTextField, setStatusButton].forEach(addSubview)
        NSLayoutConstraint.activate([
            
            avatarImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            
            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.topAnchor, constant: 30),
            statusLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),
            
            statusTextField.topAnchor.constraint(equalTo: statusLabel.topAnchor, constant: 20),
            statusTextField.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 16),
            statusTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),
            
            
            setStatusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}

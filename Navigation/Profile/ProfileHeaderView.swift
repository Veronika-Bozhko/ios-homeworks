//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String = ""
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = #imageLiteral(resourceName: "Batman")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 55
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.masksToBounds = true
        return imageView
    }()
        
    private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ночной защитник"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
        
    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Ожидание..."
        label.textColor = .darkGray
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return label
    }()
        
    private lazy var statusButton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Показать статус", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.shadowOffset = CGSizeMake(4.0, 4.0)
        button.layer.cornerRadius = 14
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(self, action: #selector(statusButtonPressed), for: .touchUpInside)
        return button
    }()
        
    private lazy var statusTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Введите статус"
        textField.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        textField.textAlignment = .center
        textField.layer.cornerRadius = 12
        textField.layer.borderWidth = 1
        textField.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        textField.font = .systemFont(ofSize: 15, weight: .regular)
        textField.addTarget(self, action: #selector(textFieldAction), for: .editingChanged)
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubView()
        addTab()
    }
        
    private func addTab() {
        let tab = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        addGestureRecognizer(tab)
    }
    
    @objc private func hideKeyboard() {
        endEditing(true)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func avatarButtonAction(selector: UIButton) {
        statusLabel.text = statusText
    }
    
    @objc private func textFieldAction(_ textField: UITextField) {
        if textField.text?.isEmpty != nil {
            statusText = textField.text!
        }
    }
    
    @objc private func statusButtonPressed() {
        statusLabel.text = statusTextField.text
        print("\(String(describing: statusTextField.text))")
    }

    func addSubView() {
        addSubview(avatarImageView)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(statusButton)
        
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
                
            statusButton.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 16),
            statusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            statusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
}

//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Veronika Bozhko on 27.02.2023.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private var statusText: String?
    private var topImage = NSLayoutConstraint()
    private var leadingImage = NSLayoutConstraint()
    private var widthImage = NSLayoutConstraint()
    private var heightImage = NSLayoutConstraint()
    
    //MARK: - Add Avatar Image
    private lazy var avatarImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = #imageLiteral(resourceName: "Batman")
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .white
        image.clipsToBounds = true
        image.layer.cornerRadius = 50
        image.layer.borderWidth = 3
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
        textField.delegate = self
        textField.addTarget(self, action: #selector(textFieldAction), for: .editingChanged)
        textField.indent(size: 10)
        return textField
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
        button.addTarget(self, action: #selector(avatarButtonAction), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Add CrossButton for animation
    private lazy var crossButton: UIButton = {
        let crossButton = UIButton()
        crossButton.translatesAutoresizingMaskIntoConstraints = false
        crossButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        crossButton.tintColor = #colorLiteral(red: 0, green: 0.5695073605, blue: 1, alpha: 1)
        crossButton.alpha = 0
        crossButton.addTarget(self, action: #selector(cancelAction), for: .touchUpInside)
        return crossButton
    }()

    //MARK: - Add BlackView for animation
    private let blackView: UIView = {
        let viewBlack = UIView()
        viewBlack.translatesAutoresizingMaskIntoConstraints = false
        viewBlack.alpha = 0
        viewBlack.backgroundColor = .black
        viewBlack.frame = UIScreen.main.bounds
        return viewBlack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(named: "ColorBackground")
        setupLayout()
        setupGesture()
        addTap()
        setupAnimationAvatar()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Action Avatar Button
    @objc private func avatarButtonAction(selector: UIButton) {
        if statusTextField.text == "" {
            statusTextField.attributedPlaceholder = NSAttributedString(string: "Cannot be empty...",
                                                                       attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])

        } else if statusTextField.text != "" {
            statusTextField.attributedPlaceholder = NSAttributedString(string: "Set your status...",
                                                                       attributes: [NSAttributedString.Key.foregroundColor: UIColor.gray])
            statusLabel.text = statusTextField.text
        }
    }
    
    //MARK: - Action Text Field
    @objc private func textFieldAction(_ textField:  UITextField) {
        statusText = statusLabel.text ?? ""
    }

    //MARK: - Remove Keyboard
    private func addTap() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        addGestureRecognizer(tap)
    }
    
    //MARK: - Action Remove Keyboard
    @objc private func hideKeyboard() {
        endEditing(true)
    }
    
    //MARK: - SetupGesture for animation
    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(actionTap))
        avatarImageView.isUserInteractionEnabled = true
        avatarImageView.addGestureRecognizer(tapGesture)
    }

    //MARK: - Action Tap for animation
    @objc private func actionTap() {

        UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut) {
            self.blackView.alpha = 0.7
            self.avatarImageView.layer.cornerRadius = 10
            self.topImage.constant = 100
            self.leadingImage.constant = 0
            self.widthImage.constant = UIScreen.main.bounds.width
            self.heightImage.constant = UIScreen.main.bounds.width
            self.layoutIfNeeded()

        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.crossButton.alpha = 1
            }
        }
    }

    //MARK: - CancelAction Animation
    @objc private func cancelAction() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            self.crossButton.alpha = 0

        } completion: { _ in
            UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) {
                self.avatarImageView.layer.cornerRadius = 50
                self.topImage.constant = 0
                self.leadingImage.constant = 16
                self.widthImage.constant = 100
                self.heightImage.constant = 100
                self.blackView.alpha = 0
                self.layoutIfNeeded()
            }
        }
    }

    //MARK: - Setup Animation Avatar
  private func setupAnimationAvatar() {

        topImage = avatarImageView.topAnchor.constraint(equalTo: topAnchor, constant: 20)
        leadingImage = avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        widthImage = avatarImageView.widthAnchor.constraint(equalToConstant: 100)
        heightImage = avatarImageView.heightAnchor.constraint(equalToConstant: 100)

        NSLayoutConstraint.activate([
            topImage, leadingImage, widthImage, heightImage
        ])
    }

    //MARK: - Setup Layout
    private func setupLayout() {

        addSubview(avatarImageView)
        addSubview(setStatusButton)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(statusTextField)
        addSubview(blackView)
        addSubview(crossButton)
        bringSubviewToFront(avatarImageView)

        NSLayoutConstraint.activate([

            crossButton.topAnchor.constraint(equalTo: topAnchor, constant: 30),
            crossButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            crossButton.widthAnchor.constraint(equalToConstant: 30),
            crossButton.heightAnchor.constraint(equalToConstant: 30),

            fullNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            fullNameLabel.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 130),
            fullNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 20),

            statusLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 30),
            statusLabel.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusLabel.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            statusLabel.heightAnchor.constraint(equalToConstant: 20),

            statusTextField.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 7),
            statusTextField.leadingAnchor.constraint(equalTo: fullNameLabel.leadingAnchor),
            statusTextField.trailingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor),
            statusTextField.heightAnchor.constraint(equalToConstant: 40),

            setStatusButton.topAnchor.constraint(equalTo: statusTextField.bottomAnchor, constant: 16),
            setStatusButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 43),
            setStatusButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}

//MARK: - Blocking Set Status Button if there is no text
extension ProfileHeaderView: UITextFieldDelegate {

    //MARK: - Remove The Keyboard
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return true
    }
}

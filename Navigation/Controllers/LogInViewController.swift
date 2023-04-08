//
//  LogInViewController.swift
//  Navigation
//
//  Created by Veronika Bozhko on 07.03.2023.
//

import UIKit

final class LogInViewController: UIViewController {

    private let notification = NotificationCenter.default
    private let login = ""
    private let password = ""
    
//MARK: - Adding Scroll View
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
//MARK: - Adding Content View
    private lazy var contentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "ColorBackground")
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
//MARK: - Adding Logo Image View
    private lazy var logoImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "logo")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
//MARK: - Adding StackView
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.backgroundColor = UIColor(named: "ColorLabel")
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.layer.cornerRadius = 10
        stackView.layer.borderWidth = 0.5
        stackView.layer.masksToBounds = true
        return stackView
    }()

//MARK: - Adding Email Text Field
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(named: "ColorBackground")
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        textField.textColor = UIColor(named: "ColorLabel")
        textField.font = .systemFont(ofSize: 16)
        textField.clearButtonMode = .whileEditing
        textField.placeholder = "Email of phone"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        return textField
    }()
    
//MARK: - Adding Password Text Field
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = UIColor(named: "ColorBackground")
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        textField.textColor = UIColor(named: "ColorLabel")
        textField.font = .systemFont(ofSize: 16)
        textField.clearButtonMode = .whileEditing
        textField.placeholder = "Password"
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        return textField
    }()
    
//MARK: - Adding Login Button
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(actionLoginButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
//MARK: - Adding Alert Label
    private lazy var alertLabel: UILabel = {
        let labelAlert = UILabel()
        labelAlert.translatesAutoresizingMaskIntoConstraints = false
        labelAlert.text = "Пароль должен содержать не менее 8 символов"
        labelAlert.textColor = .red
        labelAlert.isHidden = true
        labelAlert.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return labelAlert
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "ColorBackground")
        navigationController?.navigationBar.isHidden = true
        navigationController?.setNavigationBarHidden(true, animated: true)
        setupLayoutConstraints()
        hideKeyboardTapped()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
    
//MARK: - Adding Keyboard Observers
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
//MARK: - Unsubscribe From Observers
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardWillHideNotification)
    }
    
//MARK: - Setting Keyboard Display
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }
//MARK: - Setting Hiding the Keyboard
    @objc private func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    
//MARK: - Setting Correct Password
    private func correctPassword(_ password: String) -> Bool {
        let passwordRegEx = "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,64}"
        let passwordPredicate = NSPredicate(format:"SELF MATCHES %@", passwordRegEx)
        return passwordPredicate.evaluate(with: password)
    }

//MARK: - Setting Correct Email
    private func correctEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
    
//MARK: - Adding Action Login Button
    @objc private func actionLoginButton () {
        if emailTextField.text == "" && passwordTextField.text == "" {
            let animationText = CABasicAnimation(keyPath: "position")
            animationText.duration = 0.07
            animationText.repeatCount = 4
            animationText.autoreverses = true
            animationText.fromValue = NSValue(cgPoint: CGPoint(x: stackView.center.x - 10, y: stackView.center.y))
            animationText.toValue = NSValue(cgPoint: CGPoint(x: stackView.center.x + 10, y: stackView.center.y))
            stackView.layer.add(animationText, forKey: "position")
            emailTextField.attributedPlaceholder = NSAttributedString(string: emailTextField.placeholder ?? "",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
            passwordTextField.attributedPlaceholder = NSAttributedString(string: passwordTextField.placeholder ?? "",
                                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }  else {
            stackView.layer.removeAnimation(forKey: "position")

        }

        if emailTextField.text != "" && passwordTextField.text == "" {
            let animationText = CABasicAnimation(keyPath: "position")
            animationText.duration = 0.07
            animationText.repeatCount = 4
            animationText.autoreverses = true
            animationText.fromValue = NSValue(cgPoint: CGPoint(x: stackView.center.x - 10, y: stackView.center.y))
            animationText.toValue = NSValue(cgPoint: CGPoint(x: stackView.center.x + 10, y: stackView.center.y))
            stackView.layer.add(animationText, forKey: "position")
            passwordTextField.attributedPlaceholder = NSAttributedString(string: passwordTextField.placeholder ?? "",
                                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }

// MARK: - Setting Validation Check Email
        if correctEmail(emailTextField.text!) == false && emailTextField.text != ""  {
            emailTextField.text = ""
            emailTextField.attributedPlaceholder = NSAttributedString(string: " Не корректно введен логин",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }

// MARK: - Setting Validation for input Email
        if correctPassword(passwordTextField.text!) && emailTextField.text == ""  {
            emailTextField.text = ""
            emailTextField.attributedPlaceholder = NSAttributedString(string: " Не введен логин",
                                                                     attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }

//MARK: -  Setting Checking for the number of characters entered
        if passwordTextField.text!.count < 8 && passwordTextField.text != "" {
            alertLabel.text = alertLabel.text
            alertLabel.isHidden = false

        } else {
            alertLabel.isHidden = true
        }

        if correctEmail(emailTextField.text!) && correctPassword(passwordTextField.text!) {
            let profileVC = ProfileViewController()
            navigationController?.pushViewController(profileVC, animated: true)

        } else if emailTextField.text != "" && passwordTextField.text != "" {
            let alert = UIAlertController(title: nil, message: "Введен неверный логин или пароль", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Попробовать еще раз", style: .default)
            alert.addAction(okAction)
            present(alert, animated: true)
        }

//MARK: - Setting Validation Check Password
        if correctPassword(passwordTextField.text!) == false && passwordTextField.text != ""  {
            passwordTextField.text = ""
            passwordTextField.attributedPlaceholder = NSAttributedString(string: " Не корректно введен пароль",
                                                                        attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        }
    }
    
//MARK: - Setup Layout Constraints
    private func setupLayoutConstraints() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(stackView)
        contentView.addSubview(loginButton)
        contentView.addSubview(alertLabel)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        
        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            logoImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),

            stackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            stackView.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            stackView.heightAnchor.constraint(equalToConstant: 100),

            loginButton.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.bottomAnchor, constant: 20),
            loginButton.leadingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),

            alertLabel.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 3),
            alertLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
        ])
    }
}

//MARK: - Extension UITextFieldDelegate
extension LogInViewController: UITextFieldDelegate {

//MARK: - Setting Keyboard Processing
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }

//MARK: - Setting Hide Keyboard
    func hideKeyboardTapped() {
        let press: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        press.cancelsTouchesInView = false
        view.addGestureRecognizer(press)
    }

//MARK: - Setting Remove Keyboard
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}

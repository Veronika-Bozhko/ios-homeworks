//
//  LogInViewController.swift
//  Navigation
//
//  Created by Veronika Bozhko on 07.03.2023.
//

import UIKit

final class LogInViewController: UIViewController {

    private let notification = NotificationCenter.default
    
        //MARK: - Scroll View
        lazy var scrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()
    
        //MARK: - Content View
        private lazy var contentView: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
        //MARK: - Logo Image View
        private lazy var logoImageView: UIImageView = {
            let image = UIImageView()
            image.image = UIImage(named: "logo")
            image.contentMode = .scaleAspectFill
            image.clipsToBounds = true
            image.translatesAutoresizingMaskIntoConstraints = false
            return image
        }()
    
        //MARK: - Email Text Field
        private lazy var emailTextField: UITextField = {
            let textField = UITextField()
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.layer.borderWidth = 0.5
            textField.layer.cornerRadius = 10
            textField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
            textField.textColor = .black
            textField.font = .systemFont(ofSize: 16)
            textField.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
            textField.placeholder = "Email of phone"
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
            textField.leftViewMode = .always
            textField.autocapitalizationType = .none
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
    
        //MARK: - Password Text Field
        private lazy var passwordTextField: UITextField = {
            let textField = UITextField()
            textField.layer.borderColor = UIColor.lightGray.cgColor
            textField.layer.borderWidth = 0.5
            textField.layer.cornerRadius = 10
            textField.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
            textField.textColor = .black
            textField.font = .systemFont(ofSize: 16)
            textField.backgroundColor = #colorLiteral(red: 0.9594197869, green: 0.9599153399, blue: 0.975127399, alpha: 1)
            textField.placeholder = "Password"
            textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
            textField.leftViewMode = .always
            textField.autocapitalizationType = .none
            textField.isSecureTextEntry = true
            textField.translatesAutoresizingMaskIntoConstraints = false
            return textField
        }()
    
        //MARK: - Login Button
        var loginButton: UIButton = {
            let button = UIButton()
            button.setTitle("Log in", for: .normal)
            button.setTitleColor(.white, for: .normal)
            button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
            button.layer.cornerRadius = 10
            button.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMinXMinYCorner]
            button.clipsToBounds = true
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    
//        override init(frame: CGRect) {
//            super.init(frame: frame)
//            backgroundColor = .white
//            setupView()
//            setupConstraints()
//            addTap()
//        }
//
//        required init?(coder: NSCoder) {
//            fatalError()
//        }
    
//        //MARK: - Setup View
//        private func setupView() {
//            view.addSubview(scrollView)
//            scrollView.addSubview(contentView)
//            contentView.addSubview(logoImageView)
//            contentView.addSubview(emailTextField)
//            contentView.addSubview(passwordTextField)
//            contentView.addSubview(loginButton)
////            emailTextField.delegate = self
////            passwordTextField.delegate = self
//        }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.isHidden = true
        hideNavigationBar()
        layout()
        setLoginButtonStates()
        setupLoginButton()
    }
    
    func setLoginButtonStates() {
        switch loginButton.state {
        case .normal: loginButton.alpha = 1
        case .selected: loginButton.alpha = 0.5
        case .highlighted: loginButton.alpha = 0.5
        case .disabled: loginButton.alpha = 0.5
        default:
            break
        }
    }
    
    private func setupLoginButton() {
        loginButton.addTarget(self, action: #selector(actionloginButton), for: .touchUpInside)
    }
    
    private func layout() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(logoImageView)
        contentView.addSubview(emailTextField)
        contentView.addSubview(passwordTextField)
        contentView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([

            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),

            logoImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            logoImageView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 100),
            logoImageView.widthAnchor.constraint(equalToConstant: 100),

            emailTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 120),
            emailTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            emailTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),

            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor),
            passwordTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            passwordTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),

            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 16),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    //MARK: - Action Login Button Show ProfileViewController
    @objc func actionloginButton() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)
    }

    //MARK: - Keyboard Observers
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

    //MARK: - Keyboard Display
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
        }
    }

    //MARK: - Hiding the Keyboard
    @objc private func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}

//MARK: - Hide Navigation Bar
extension LogInViewController {
    func hideNavigationBar() {
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
}

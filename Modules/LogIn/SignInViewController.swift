//
//  ViewController.swift
//  LAMP APP
//
//  Created by Goin-Keivn on 3/20/24.
//

import UIKit

protocol SignInDelegate: AnyObject {
    func signIn(rememberMe: Bool)
}

class SignInViewController: UIViewController {

    var signInAction: SignInActions?

    // This view is added for spaces
    private lazy var spacerView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private lazy var signInButton: CustomButton = {
        let button = CustomButton(backgroudColor: .systemBlue, title: "Sign In")
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        return button
    }()

    private lazy var signInLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 40)
        label.text = "Sign In"
        label.textAlignment = .center
        return label
    }()

    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        let fullText = "Username*"
        let attributedString = NSMutableAttributedString(string: fullText)
        if let asteriskRange = fullText.range(of: "*") {
            let nsRange = NSRange(asteriskRange, in: fullText)
            attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: nsRange)
            attributedString.addAttribute(.baselineOffset, value: 10, range: nsRange)
        }
        label.attributedText = attributedString
        return label
    }()

    lazy var userNameTextField: CustomTextField = {
        let textField = CustomTextField(placeHolder: "Enter username")
        textField.autocapitalizationType = .none
        return textField
    }()

    private lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.black
        label.font = UIFont.systemFont(ofSize: 16)
        label.textAlignment = .left
        let fullText = "Password*"
        let attributedString = NSMutableAttributedString(string: fullText)
        if let asteriskRange = fullText.range(of: "*") {
            let nsRange = NSRange(asteriskRange, in: fullText)
            attributedString.addAttribute(.foregroundColor, value: UIColor.red, range: nsRange)
            attributedString.addAttribute(.baselineOffset, value: 10, range: nsRange)
        }
        label.attributedText = attributedString
        return label
    }()

    lazy var passwordTextField: CustomTextField = {
        let textField = CustomTextField(placeHolder: "Enter password")
        textField.isSecureTextEntry = true
        return textField
    }()

    private lazy var rememberMeSwitch: UISwitch = {
        let rememberSwitch = UISwitch()
        rememberSwitch.isOn = false
        return rememberSwitch
    }()

    private lazy var rememberMeLabel: UILabel = {
        let label = UILabel()
        label.text = "Remember Me"
        label.textColor = UIColor.black
        return label
    }()

    private lazy var rememberMeStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [rememberMeSwitch, rememberMeLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
        loadSavedCredentials()
    }

    // Actions
    @objc func signInButtonTapped() {
        signInButton.isEnabled = false
        let rememberMe = rememberMeSwitch.isOn
        signInAction?.signIn(rememberMe: rememberMe)
    }

    // Setup UI
    func setUpUI() {
        view.backgroundColor = .white
        view.addSubview(stackView)
        stackView.addArrangedSubview(signInLabel)
        stackView.addArrangedSubview(userNameLabel)
        stackView.addArrangedSubview(userNameTextField)
        stackView.addArrangedSubview(passwordLabel)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(rememberMeStackView) // Add rememberMeStackView here
        stackView.addArrangedSubview(spacerView) // Add spacerView here
        stackView.addArrangedSubview(signInButton)

        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 400),

            signInLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            signInLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),

            userNameLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            userNameLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),

            userNameTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            userNameTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),

            passwordLabel.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            passwordLabel.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),

            passwordTextField.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),

            rememberMeStackView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            rememberMeStackView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),

            spacerView.heightAnchor.constraint(equalToConstant: 10), // Set the height of the spacerView

            signInButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }

    private func loadSavedCredentials() {
        let defaults = UserDefaults.standard
        if let savedUsername = defaults.string(forKey: "username"),
           let savedPassword = defaults.string(forKey: "password") {
            userNameTextField.text = savedUsername
            passwordTextField.text = savedPassword
            rememberMeSwitch.isOn = true
        }
    }
}

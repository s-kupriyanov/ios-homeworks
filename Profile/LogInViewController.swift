//
//  LogInViewController.swift
//  Navigation
//
//  Created by Stas Kupriyanov on 10.11.2023.
//

import UIKit

class CustomButton: UIButton {
    override var isHighlighted: Bool {
        didSet {
            if (isHighlighted) {
                alpha = 0.8
            } else {
                alpha = 1
            }
        }
    }
    override var isSelected: Bool {
        didSet {
            if (isSelected) {
                alpha = 0.8
            } else {
                alpha = 1
            }
        }
    }
}

class LogInViewController: UIViewController {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var logoVk: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "logoVk")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var inputLogin: UITextField = {
        let inputText = UITextField()
        inputText.layer.cornerRadius = 10
        inputText.layer.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]
        inputText.layer.borderWidth = 0.5
        inputText.leftViewMode = .always
        inputText.leftView = UIView(
            frame: CGRect(x: 0, y: 0, width: 10, height: inputText.frame.height)
        )
        inputText.layer.borderColor = UIColor.lightGray.cgColor
        inputText.backgroundColor = .systemGray6
        inputText.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        inputText.textColor = .black
        inputText.placeholder = "Email of phone"
        inputText.clearButtonMode = .whileEditing
        inputText.autocapitalizationType = .none
        inputText.autocorrectionType = UITextAutocorrectionType.no
        inputText.keyboardType = UIKeyboardType.emailAddress
        inputText.returnKeyType = UIReturnKeyType.done
        inputText.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        inputText.translatesAutoresizingMaskIntoConstraints = false
        inputText.delegate = self
        return inputText
    }()
    
    private lazy var inputPassword: UITextField = {
        let inputText = UITextField()
        inputText.layer.cornerRadius = 10
        inputText.layer.maskedCorners = [
            .layerMaxXMaxYCorner,
            .layerMinXMaxYCorner
        ]
        inputText.layer.borderWidth = 0.5
        inputText.leftViewMode = .always
        inputText.leftView = UIView(
            frame: CGRect(x: 0, y: 0, width: 10, height: inputText.frame.height)
        )
        inputText.layer.borderColor = UIColor.lightGray.cgColor
        inputText.backgroundColor = .systemGray6
        inputText.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        inputText.textColor = .black
        inputText.placeholder = "Password"
        inputText.clearButtonMode = .whileEditing
        inputText.autocapitalizationType = .none
        inputText.autocorrectionType = UITextAutocorrectionType.no
        inputText.keyboardType = UIKeyboardType.default
        inputText.returnKeyType = UIReturnKeyType.done
        inputText.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        inputText.isSecureTextEntry = true
        inputText.translatesAutoresizingMaskIntoConstraints = false
        inputText.delegate = self
        return inputText
    }()
    
    var buttonLogIn: CustomButton = {
        let button = CustomButton()
        
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)

        button.setBackgroundImage(UIImage(named: "bluePixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addSubviews()
        setupConstraints()
        
        buttonTarget(buttonLogIn)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        setupKeyboardObservers()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardObservers()
    }
    
    // MARK: - Actions
    
    @objc private func willShowKeyboard(_ notification: NSNotification) {
        if let keyboardSize = (
            notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
        )?.cgRectValue {
            scrollView.contentOffset.y = keyboardSize.height - (
                scrollView.frame.height - buttonLogIn.frame.minY
            )
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(
                top: 0,
                left: 0,
                bottom: keyboardSize.height,
                right: 0
            )
        }
    }
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.isHidden = true
    }
    
    private func addSubviews() {
        view.addSubview(scrollView)

        scrollView.addSubview(contentView)
        contentView.addSubview(logoVk)
        contentView.addSubview(inputLogin)
        contentView.addSubview(inputPassword)
        contentView.addSubview(buttonLogIn)
    }
    
    private func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate(
            [
                scrollView.leadingAnchor.constraint(
                    equalTo: safeAreaGuide.leadingAnchor
                ),
                scrollView.trailingAnchor.constraint(
                    equalTo: safeAreaGuide.trailingAnchor
                ),
                scrollView.topAnchor.constraint(
                    equalTo: safeAreaGuide.topAnchor
                ),
                scrollView.bottomAnchor.constraint(
                    equalTo: safeAreaGuide.bottomAnchor
                ),
                
                contentView.leadingAnchor.constraint(
                    equalTo: scrollView.leadingAnchor
                ),
                contentView.widthAnchor.constraint(
                    equalTo: scrollView.widthAnchor
                ),
                contentView.trailingAnchor.constraint(
                    equalTo: scrollView.trailingAnchor
                ),
                contentView.topAnchor.constraint(
                    equalTo: scrollView.topAnchor
                ),
                contentView.bottomAnchor.constraint(
                    equalTo: scrollView.bottomAnchor
                ),
                
                logoVk.centerXAnchor.constraint(
                    equalTo: contentView.centerXAnchor
                ),
                logoVk.topAnchor.constraint(
                    equalTo: contentView.topAnchor,
                    constant: 120
                ),
                logoVk.widthAnchor.constraint(
                    equalToConstant: 100
                ),
                logoVk.heightAnchor.constraint(
                    equalToConstant: 100
                ),
                inputLogin.topAnchor.constraint(
                equalTo: logoVk.bottomAnchor,
                constant: 120
                    ),
                inputLogin.leftAnchor.constraint(
                    equalTo: view.leftAnchor,
                    constant: 16
                ),
                inputLogin.rightAnchor.constraint(
                    equalTo: view.rightAnchor,
                    constant: -16
                ),
                inputLogin.heightAnchor.constraint(
                        equalToConstant: 50.0
                    ),

                inputPassword.topAnchor.constraint(
                    equalTo: inputLogin.bottomAnchor,
                    constant: 0
                ),
                inputPassword.leftAnchor.constraint(
                    equalTo: view.leftAnchor,
                    constant: 16
                ),
                inputPassword.rightAnchor.constraint(
                    equalTo: view.rightAnchor,
                    constant: -16
                ),
                inputPassword.heightAnchor.constraint(
                    equalToConstant: 50.0
                ),
                
                buttonLogIn.topAnchor.constraint(
                    equalTo: inputPassword.bottomAnchor,
                    constant: 16
                ),
                buttonLogIn.leftAnchor.constraint(
                    equalTo: view.leftAnchor,
                    constant: 16
                ),
                buttonLogIn.rightAnchor.constraint(
                    equalTo: view.rightAnchor,
                    constant: -16
                ),
                buttonLogIn.heightAnchor.constraint(
                    equalToConstant: 50.0
                ),
                buttonLogIn.bottomAnchor.constraint(
                    equalTo: contentView.bottomAnchor
                ),
            ]
        )
    }
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(
            self,
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        notificationCenter.removeObserver(
            self,
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func buttonTarget(_ sender: UIButton) {
        sender.addTarget(
            self,
            action: #selector(openProfileViewController),
            for: .touchUpInside
        )
    }
    
    @objc func openProfileViewController(_ sender: UIButton) {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(
            profileViewController,
            animated: false
        )
    }
    
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}

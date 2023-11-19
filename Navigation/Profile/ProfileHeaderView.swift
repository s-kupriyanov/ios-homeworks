//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Stas Kupriyanov on 02.11.2023.
//

import UIKit

final class ProfileHeaderView: UIView {
    
    static let idHeader = "CustomHeader"
    
    private lazy var avatarImage: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.image = UIImage(named: "avatarImage")
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.cornerRadius = 60
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        return avatarImage
    }()

     private lazy var fullNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Hipster Cat"
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = "Waiting for something..."
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var inputText: UITextField = {
        let inputText = UITextField()
        inputText.leftViewMode = .always
        inputText.leftView = UIView(
            frame: CGRect(x: 0, y: 0, width: 10, height: inputText.frame.height)
        )
        inputText.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        inputText.textColor = .black
        inputText.layer.cornerRadius = 12
        inputText.backgroundColor = .white
        inputText.layer.borderWidth = 1
        inputText.layer.borderColor = UIColor.black.cgColor
        inputText.placeholder = "Введите статус"
        inputText.clearButtonMode = .whileEditing
        inputText.translatesAutoresizingMaskIntoConstraints = false
        return inputText
    }()

    private lazy var buttonShowStatus: UIButton = {
        let button = UIButton()
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func buttonTarget() {
        buttonShowStatus.addTarget(
            self,
            action: #selector(buttonPressed),
            for: .touchUpInside
        )
    }

    @objc func buttonPressed(_ sender: UIButton) {
        guard inputText.text?.isEmpty == false else { return }
        statusLabel.text = inputText.text
    }

    private func inputTarget() {
        inputText.addTarget(
            self,
            action: #selector(statusTextChanged),
            for: .editingChanged
        )
    }

    @objc func statusTextChanged(_ textField: UITextField) {
        _ = textField.text ?? ""
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        buttonTarget()
        inputTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        addSubview(avatarImage)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(inputText)
        addSubview(buttonShowStatus)
        
        NSLayoutConstraint.activate(
            [
                avatarImage.topAnchor.constraint(
                    equalTo: self.topAnchor,
                    constant: 16
                ),
                avatarImage.leftAnchor.constraint(
                    equalTo: self.leftAnchor,
                    constant: 16
                ),
                avatarImage.heightAnchor.constraint(
                    equalToConstant: 120.0
                ),
                avatarImage.widthAnchor.constraint(
                    equalToConstant: 120.0
                ),
                
                fullNameLabel.topAnchor.constraint(
                    equalTo: self.topAnchor,
                    constant: 27
                ),
                fullNameLabel.leftAnchor.constraint(
                    equalTo: avatarImage.rightAnchor,
                    constant: 16
                ),
                fullNameLabel.rightAnchor.constraint(
                    equalTo: self.rightAnchor,
                    constant: -16
                ),
                
                statusLabel.topAnchor.constraint(
                    equalTo: fullNameLabel.bottomAnchor,
                    constant: 10
                ),
                statusLabel.leftAnchor.constraint(
                    equalTo: avatarImage.rightAnchor,
                    constant: 16
                ),
                statusLabel.rightAnchor.constraint(
                    equalTo: self.rightAnchor,
                    constant: -16
                ),
                
                inputText.topAnchor.constraint(
                    equalTo: statusLabel.bottomAnchor,
                    constant: 10
                ),
                inputText.leftAnchor.constraint(
                    equalTo: avatarImage.rightAnchor,
                    constant: 16
                ),
                inputText.rightAnchor.constraint(
                    equalTo: self.rightAnchor,
                    constant: -16
                ),
                inputText.heightAnchor.constraint(
                    equalToConstant: 40.0
                ),
                
                buttonShowStatus.topAnchor.constraint(
                    equalTo: avatarImage.bottomAnchor,
                    constant: 16
                ),
                buttonShowStatus.leftAnchor.constraint(
                    equalTo: self.leftAnchor,
                    constant: 16
                ),
                buttonShowStatus.rightAnchor.constraint(
                    equalTo: self.rightAnchor,
                    constant: -16
                ),
                buttonShowStatus.heightAnchor.constraint(
                    equalToConstant: 50.0
                ),
            ]
        )
    }
    
}

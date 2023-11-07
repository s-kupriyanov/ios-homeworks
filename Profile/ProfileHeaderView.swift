//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Stas Kupriyanov on 02.11.2023.
//

import UIKit

// Добавьте в группу Profile новый файл ProfileHeaderView.swift, в этом файле создайте одноименный класс-наследник UIView.

final class ProfileHeaderView: UIView {
    
    // Перейдите в файл ProfileHeaderView и, следуя макету, добавьте необходимые UI-элементы в качестве подпредставлений и установите для них нужные параметры. Ваш экран Profile должен в точности повторять макет
    
    let avatarImage: UIImageView = {
        
        let avatarImage = UIImageView(frame: CGRect(x: 16, y: 120, width: 120, height: 120))
        
        avatarImage.image = UIImage(named: "avatarImage")
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.cornerRadius = 60
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.borderColor = UIColor.white.cgColor
        
        return avatarImage
    }()
    
    lazy var fullNameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: avatarImage.frame.maxX + 10, y: 120, width: 100, height: 20))
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Hipster Cat"
        label.numberOfLines = 0
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: avatarImage.frame.maxX + 10, y: fullNameLabel.frame.maxY + 16, width: 100, height: 20))
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.text = "Waiting for something..."
        label.numberOfLines = 0

        return label
    }()
    
    // Добавьте экземпляр класса UITextField в класс ProfileHeaderView, выполните необходимые настройки согласно макету
    
    lazy var inputText: UITextField = {
        let inputText = UITextField(frame: CGRect(x: avatarImage.frame.maxX + 10, y: statusLabel.frame.maxY + 16, width: UIScreen.main.bounds.width - statusLabel.frame.minX - 16, height: 40))
        inputText.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        inputText.textColor = .black
        inputText.layer.cornerRadius = 12
        inputText.backgroundColor = .white
        inputText.layer.borderWidth = 1
        inputText.layer.borderColor = UIColor.black.cgColor
        inputText.placeholder = "Введите статус"
        inputText.clearButtonMode = .whileEditing
        
        return inputText
    }()
    
    lazy var buttonShowStatus: UIButton = {
        let button = UIButton(frame: CGRect(x: 16, y: avatarImage.frame.maxY + 10, width: UIScreen.main.bounds.width - 32, height: 50))
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7

        return button
    }()
    
    // Добавьте обработку нажатия по кнопке addTarget, UIEvent выбрать .touchUpInside
    
    private func buttonTarget() {
        buttonShowStatus.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    // Добавьте функцию, которую будет принимать обработчик, например, @objc func buttonPressed()
    
    @objc func buttonPressed() {
        // Функция должна выводить в консоль текст из поля «статус»
        print(statusLabel.text ?? "Нет статуса")
        
        statusLabel.text = inputText.text
        
    }
    
    // Добавьте обработку изменения введённого текста при помощи addTarget, UIEvent выбрать .editingChanged
    
    private func inputTarget() {
        inputText.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
    }
    
    // Добавьте функцию, которую будет принимать обработчик
    
    
    @objc func statusTextChanged(_ textField: UITextField) {
        
        _ = textField.text ?? ""
    }
    
    // Добавьте приватную переменную statusText с типом данных String
    
    // private var statusText: String
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        buttonTarget()
        inputTarget()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        addSubview(avatarImage)
        addSubview(fullNameLabel)
        addSubview(statusLabel)
        addSubview(inputText)
        addSubview(buttonShowStatus)
    }
    
}

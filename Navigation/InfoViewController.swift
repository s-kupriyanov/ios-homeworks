//
//  InfoViewController.swift
//  Navigation
//
//  Created by Stas Kupriyanov on 13.04.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private lazy var alertButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Вам сообщение", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .cyan
        view.addSubview(alertButton)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            alertButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            alertButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            alertButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            alertButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        alertButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Улыбайтесь и смейтесь", message: "Улыбка - это простой способ улучшить настроение и привлечь позитивные эмоции. Вы согласны?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: NSLocalizedString("Да", comment: "Пожалуй, да"), style: .default, handler: { _ in NSLog("=)") }))
        alert.addAction(UIAlertAction(title: NSLocalizedString("Нет", comment: "Пожалуй, нет"), style: .default, handler: { _ in NSLog("=(") }))
        self.present(alert, animated: true, completion: nil)
    }

}

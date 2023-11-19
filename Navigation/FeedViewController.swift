//
//  FeedViewController.swift
//  Navigation
//
//  Created by Stas Kupriyanov on 10.04.2023.
//

import UIKit

struct PostOne {
    let title: String
}

class FeedViewController: UIViewController {
    
    let postOne = PostOne(title: "Мой первый пост")
    
    private lazy var buttonOne: UIButton = {
        let button = UIButton()
        button.setTitle("Button One", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        return button
    }()
    
    private lazy var buttonTwo: UIButton = {
        let button = UIButton()
        button.setTitle("Button Two", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10.0
        stackView.addArrangedSubview(buttonOne)
        stackView.addArrangedSubview(buttonTwo)
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .lightGray
        view.addSubview(stackView)
        setupContraints()
        buttonTarget(buttonOne)
        buttonTarget(buttonTwo)
    }
    
    private func setupContraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate(
            [
                stackView.leadingAnchor.constraint(
                    equalTo: safeAreaGuide.leadingAnchor,
                    constant: 20.0
                ),
                stackView.trailingAnchor.constraint(
                    equalTo: safeAreaGuide.trailingAnchor,
                    constant: -20.0
                ),
                stackView.topAnchor.constraint(
                    equalTo: safeAreaGuide.topAnchor,
                    constant: 20.0
                ),
                stackView.bottomAnchor.constraint(
                    equalTo: safeAreaGuide.bottomAnchor,
                    constant: -20.0
                )
            ]
        )
    }
    
    private func buttonTarget(_ sender: UIButton) {
        sender.addTarget(
            self,
            action: #selector(openPostViewController),
            for: .touchUpInside
        )
    }
    
    @objc func openPostViewController(_ sender: UIButton) {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(
            postViewController,
            animated: false
        )
    }

}

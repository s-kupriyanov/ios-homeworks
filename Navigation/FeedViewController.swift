//
//  FeedViewController.swift
//  Navigation
//
//  Created by Stas Kupriyanov on 10.04.2023.
//

import UIKit

struct Post {
    let title: String
}

class FeedViewController: UIViewController {
    
    private lazy var actionButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Открыть статью", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    let postOne = Post(title: "Мой первый пост")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .orange
        
        view.addSubview(actionButton)
        
        let safeAreaLayoutGuide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            actionButton.leadingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.leadingAnchor,
                constant: 20.0
            ),
            actionButton.trailingAnchor.constraint(
                equalTo: safeAreaLayoutGuide.trailingAnchor,
                constant: -20.0
            ),
            actionButton.centerYAnchor.constraint(equalTo: safeAreaLayoutGuide.centerYAnchor),
            actionButton.heightAnchor.constraint(equalToConstant: 44.0)
        ])
        
        actionButton.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        let postViewController = PostViewController()
        postViewController.title = postOne.title
        
        self.navigationController?.pushViewController(postViewController, animated: false)
    }

}

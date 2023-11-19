//
//  ProfileTableHederView.swift
//  Navigation
//
//  Created by Stas Kupriyanov on 18.11.2023.
//

import UIKit

class ProfileTableHederView: UIView {
    
    private let profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var buttonBottom: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .darkGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupProfileHeaderView()
    }
    
    private func setupProfileHeaderView() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        view.addSubview(profileHeaderView)
        view.addSubview(buttonBottom)
        
        NSLayoutConstraint.activate(
            [
                profileHeaderView.topAnchor.constraint(
                    equalTo: safeAreaGuide.topAnchor
                ),
                profileHeaderView.leftAnchor.constraint(
                    equalTo: safeAreaGuide.leftAnchor
                ),
                profileHeaderView.rightAnchor.constraint (
                    equalTo: safeAreaGuide.rightAnchor
                ),
                profileHeaderView.heightAnchor.constraint(
                    equalToConstant: 220
                ),
                
                buttonBottom.leftAnchor.constraint(
                    equalTo: view.leftAnchor
                ),
                buttonBottom.rightAnchor.constraint(
                    equalTo: view.rightAnchor
                ),
                buttonBottom.bottomAnchor.constraint(
                    equalTo: safeAreaGuide.bottomAnchor
                ),
                buttonBottom.heightAnchor.constraint(
                    equalToConstant: 50.0
                ),
            ]
        )
    }
    
}

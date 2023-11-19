//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Stas Kupriyanov on 10.04.2023.
//

import UIKit

class ProfileViewController: UIViewController {

    private let profileHeaderView: ProfileHeaderView = {
        let view = ProfileHeaderView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .plain
        )
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupProfileHeaderView()
        setupTableView()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(
            PostTableViewCell.self,
            forCellReuseIdentifier: PostTableViewCell.idCell
        )
    }
    
    private func setupProfileHeaderView() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        view.addSubview(profileHeaderView)
        view.addSubview(tableView)
        
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
                
                tableView.leadingAnchor.constraint(
                    equalTo: safeAreaGuide.leadingAnchor
                ),
                tableView.trailingAnchor.constraint(
                    equalTo: safeAreaGuide.trailingAnchor
                ),
                tableView.topAnchor.constraint(
                    equalTo: profileHeaderView.bottomAnchor
                ),
                tableView.bottomAnchor.constraint(
                    equalTo: safeAreaGuide.bottomAnchor
                ),

            ]
        )
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        arrPosts.count
    }
    
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PostTableViewCell.idCell,
            for: indexPath
        ) as? PostTableViewCell else { return UITableViewCell() }
        
        let post = arrPosts[indexPath.row]
        cell.configure(with: post)
        
        return cell
    }
}

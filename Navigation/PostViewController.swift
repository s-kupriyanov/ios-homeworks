//
//  PostViewController.swift
//  Navigation
//
//  Created by Stas Kupriyanov on 10.04.2023.
//

import UIKit

class PostViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //title = "Статья"
        view.backgroundColor = .systemYellow
        
        let barButtonInfo = UIBarButtonItem(barButtonSystemItem: .bookmarks, target: self, action: #selector(openInfoView))
        
        navigationItem.rightBarButtonItem = barButtonInfo
    }

    @objc func openInfoView() {
        let infoViewController = InfoViewController()
        
        infoViewController.modalTransitionStyle = .flipHorizontal
        infoViewController.modalPresentationStyle = .pageSheet
        
        present(infoViewController, animated: true)
    }
    
    

}

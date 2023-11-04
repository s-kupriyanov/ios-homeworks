//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Stas Kupriyanov on 10.04.2023.
//

import UIKit

// Добавьте в группу Profile новый файл ProfileViewController.swift, в этом файле создайте одноименный класс-наследник UIViewController.

class ProfileViewController: UIViewController {
    
    // lazy var navigationBarHeight = Float(self.navigationController!.navigationBar.frame.size.height)
    
    // Создайте экземпляр класса ProfileHeaderView в классе ProfileViewController
    
    let profileHeaderView = ProfileHeaderView()

    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Установите .lightGray в качестве backgroundColor в коде для ProfileViewController, запустите проект и убедитесь, что при переходе на таб Profile цвет бэкграунда изменился на серый.
        
        view.backgroundColor = .lightGray
        
        // Экземпляр класса ProfileHeaderView добавьте в качестве subview
        
        view.addSubview(profileHeaderView)
        
    }
    
    // В методе viewWillLayoutSubviews() задайте ProfileHeaderView frame, равный frame корневого view.

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = view.frame
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

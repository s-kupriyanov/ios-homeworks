//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Stas Kupriyanov on 18.11.2023.
//

import UIKit

final class PostTableViewCell: UITableViewCell {
    
    static let idCell = "CustomCell"
    
    private lazy var postAuthor: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
       label.textColor = .black
       label.numberOfLines = 2
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    private lazy var postImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.layer.borderColor = UIColor.black.cgColor
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

     private lazy var postDescription: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var postLikes: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
       label.textColor = .black
       label.numberOfLines = 0
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    private lazy var postViews: UILabel = {
       let label = UILabel()
       label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
       label.textColor = .black
       label.numberOfLines = 0
       label.translatesAutoresizingMaskIntoConstraints = false
       return label
   }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with post: Post) {
        postAuthor.text = post.author
        postImage.image = UIImage(named: post.image)
        postDescription.text = post.description
        postLikes.text = "Likes: \(post.likes)"
        postViews.text = "Views: \(post.views)"
    }
    
    private func setupUI() {
        addSubview(postAuthor)
        addSubview(postImage)
        addSubview(postDescription)
        addSubview(postLikes)
        addSubview(postViews)
        
        NSLayoutConstraint.activate(
            [
                postAuthor.topAnchor.constraint(
                    equalTo: self.topAnchor,
                    constant: 16
                ),
                postAuthor.leadingAnchor.constraint(
                    equalTo: self.leadingAnchor,
                    constant: 16
                ),
                postAuthor.trailingAnchor.constraint(
                    equalTo: self.trailingAnchor,
                    constant: -16
                ),
                
                postImage.topAnchor.constraint(
                    equalTo: postAuthor.bottomAnchor,
                    constant: 12
                ),
                postImage.widthAnchor.constraint(
                    equalTo: self.widthAnchor
                ),
                postImage.heightAnchor.constraint(
                    equalTo: postImage.widthAnchor
                ),
                
                postDescription.topAnchor.constraint(
                    equalTo: postImage.bottomAnchor,
                    constant: 16
                ),
                postDescription.leadingAnchor.constraint(
                    equalTo: self.leadingAnchor,
                    constant: 16
                ),
                postDescription.trailingAnchor.constraint(
                    equalTo: self.trailingAnchor,
                    constant: -16
                ),
                
                postLikes.topAnchor.constraint(
                    equalTo: postDescription.bottomAnchor,
                    constant: 16
                ),
                postLikes.bottomAnchor.constraint(
                    equalTo: self.bottomAnchor,
                    constant: -16
                ),
                postLikes.leadingAnchor.constraint(
                    equalTo: self.leadingAnchor,
                    constant: 16
                ),
                
                postViews.topAnchor.constraint(
                    equalTo: postDescription.bottomAnchor,
                    constant: 16
                ),
                postViews.bottomAnchor.constraint(
                    equalTo: self.bottomAnchor,
                    constant: -16
                ),
                postViews.trailingAnchor.constraint(
                    equalTo: self.trailingAnchor,
                    constant: -16
                ),
            ]
        )
    }
    
}

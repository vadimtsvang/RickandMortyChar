//
//  FavoriteViewController.swift
//  Krash Poems
//
//  Created by Vadim on 09.01.2023.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "AK")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Избранное"
        label.font = .boldSystemFont(ofSize: 30)
        label.toAutoLayout()
        return label
    }()
    
    private let mainCollectionView = MainCollectionView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubviews(titleImageView, titleLabel)
    }
}

extension FavoriteViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            titleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            titleLabel.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

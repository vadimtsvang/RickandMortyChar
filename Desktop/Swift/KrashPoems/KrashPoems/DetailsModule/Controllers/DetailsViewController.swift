//
//  DetailsViewController.swift
//  KrashPoems
//
//  Created by Vadim on 16.11.2022.
//

import UIKit

class DetailsViewController: UIViewController {
    
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "AK")
        return imageView
    }()
    
    private let poemLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .boldSystemFont(ofSize: 24)
        label.text = hand
        label.numberOfLines = 0
        label.toAutoLayout()
        return label
    }()
    
    private let fullPoemLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont(name: "Roboto-Medium", size: 18)
        label.text = hand
        label.numberOfLines = 0
        label.toAutoLayout()
        return label
    }()
    
    private var detailsModel = DetailsModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
        
        poemLabel.text = detailsModel.poemName
        fullPoemLabel.text = detailsModel.fullPoem
    }
    
    private func setupViews() {
        view.backgroundColor = .white
        view.addSubviews(titleImageView, poemLabel, fullPoemLabel)
    }
    
    public func setDetailsModel(_ model: DetailsModel) {
        detailsModel = model
    }
}

extension DetailsViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            titleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            poemLabel.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 15),
            poemLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            poemLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            fullPoemLabel.topAnchor.constraint(equalTo: poemLabel.bottomAnchor, constant: 5),
            fullPoemLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            fullPoemLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
        ])
    }
}


//
//  MainViewController.swift
//  Krash Poems
//
//  Created by Vadim on 15.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    private let titleImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.toAutoLayout()
        imageView.image = UIImage(named: "AK")
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Стихи"
        label.font = .boldSystemFont(ofSize: 30)
        label.toAutoLayout()
        return label
    }()
    
    private var poemArray = [DetailsModel(poemName: handName, fullPoem: hand),
                             DetailsModel(poemName: areYouName, fullPoem: areYou),
                             DetailsModel(poemName: quietName, fullPoem: quiet),
                             DetailsModel(poemName: howName, fullPoem: how),
                             DetailsModel(poemName: threeName, fullPoem: three),
                             DetailsModel(poemName: youName, fullPoem: you),
                             DetailsModel(poemName: teachMeName, fullPoem: teachMe),
                             DetailsModel(poemName: oldName, fullPoem: old),
                             DetailsModel(poemName: marryName, fullPoem: marry),
                             DetailsModel(poemName: atTimeName, fullPoem: atTime)]
    
    private let mainCollectionView = MainCollectionView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstraints()
    }
    
    private func setupViews() {
        
        mainCollectionView.mainDelegate = self
        mainCollectionView.setPoemArray(poemArray)
        
        view.backgroundColor = .white
        view.addSubviews(titleLabel, titleImageView, mainCollectionView)
    }
}

extension MainViewController {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            titleImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            
            titleLabel.topAnchor.constraint(equalTo: titleImageView.bottomAnchor, constant: 15),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            mainCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            mainCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            mainCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
}

extension MainViewController: MainCollectionViewProtocol {
    func goToDetails(index: Int) {
        let detailsViewController = DetailsViewController()
        detailsViewController.setDetailsModel(poemArray[index])
        present(detailsViewController, animated: true)
    }
}

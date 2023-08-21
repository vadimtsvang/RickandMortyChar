//
//  OriginCell.swift
//  rAndMCharacters
//
//  Created by Vadim on 21.08.2023.
//

import UIKit

class OriginCell: UICollectionViewCell {
    
    private lazy var mainView: UIView = {
        var mainView = UIView()
        mainView.backgroundColor = #colorLiteral(red: 0.1482235789, green: 0.1655988097, blue: 0.2178440988, alpha: 1)
        mainView.layer.cornerRadius = 15
        mainView.clipsToBounds = true
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    private lazy var squareView: UIView = {
        var squareView = UIView()
        squareView.backgroundColor = #colorLiteral(red: 0.09701510519, green: 0.1106951013, blue: 0.162830621, alpha: 1)
        squareView.translatesAutoresizingMaskIntoConstraints = false
        squareView.layer.cornerRadius = 10
        squareView.clipsToBounds = true
        return squareView
    }()
    
    private lazy var earthImageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "earthImage")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var planetLabel: UILabel = {
        var label = UILabel()
        label.text = "Planet"
        label.textColor = #colorLiteral(red: 0.2784313725, green: 0.7764705882, blue: 0.0431372549, alpha: 1)
        label.font = UIFont(name: "Gilroy-Light", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var planetValueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Gilroy-ExtraBold", size: 17)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ character: Character) {
        planetValueLabel.text = character.location.name
    }
    
    private func addSubviews() {
        contentView.addSubview(mainView)
        mainView.addSubview(squareView)
        squareView.addSubview(earthImageView)
        mainView.addSubview(planetValueLabel)
        mainView.addSubview(planetLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            squareView.heightAnchor.constraint(equalToConstant: 64),
            squareView.widthAnchor.constraint(equalToConstant: 64),
            squareView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 10),
            squareView.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            
            earthImageView.centerYAnchor.constraint(equalTo: squareView.centerYAnchor),
            earthImageView.centerXAnchor.constraint(equalTo: squareView.centerXAnchor),
            
            planetValueLabel.topAnchor.constraint(equalTo: squareView.topAnchor, constant: 5),
            planetValueLabel.leadingAnchor.constraint(equalTo: squareView.trailingAnchor, constant: 15),
            
            planetLabel.bottomAnchor.constraint(equalTo: squareView.bottomAnchor, constant: -7),
            planetLabel.leadingAnchor.constraint(equalTo: squareView.trailingAnchor, constant: 15)
        ])
    }
}

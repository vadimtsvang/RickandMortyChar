//
//  InfoCell.swift
//  rAndMCharacters
//
//  Created by Vadim on 21.08.2023.
//

import UIKit

class InfoCell: UICollectionViewCell {
    
    private lazy var mainView: UIView = {
        var mainView = UIView()
        mainView.backgroundColor = #colorLiteral(red: 0.1482235789, green: 0.1655988097, blue: 0.2178440988, alpha: 1)
        mainView.layer.cornerRadius = 15
        mainView.clipsToBounds = true
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    private lazy var speciesLabel: UILabel = {
        var label = UILabel()
        label.text = "Species:"
        label.textColor = #colorLiteral(red: 0.768627451, green: 0.7882352941, blue: 0.8078431373, alpha: 1)
        label.font = UIFont(name: "Gilroy-Light", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var typeLabel: UILabel = {
        var label = UILabel()
        label.text = "Type:"
        label.textColor = #colorLiteral(red: 0.768627451, green: 0.7882352941, blue: 0.8078431373, alpha: 1)
        label.font = UIFont(name: "Gilroy-Light", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var genderLabel: UILabel = {
        var label = UILabel()
        label.text = "Gender:"
        label.textColor = #colorLiteral(red: 0.768627451, green: 0.7882352941, blue: 0.8078431373, alpha: 1)
        label.font = UIFont(name: "Gilroy-Light", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var speciesValueLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Gilroy-Light", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var typeValueLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Gilroy-Light", size: 16)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var genderValueLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Gilroy-Light", size: 16)
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
        speciesValueLabel.text = character.species
        typeValueLabel.text = character.type.isEmpty ? "None" : character.type
        genderValueLabel.text = character.gender
    }
    
    private func addSubviews() {
        contentView.addSubview(mainView)
        mainView.addSubview(speciesLabel)
        mainView.addSubview(speciesValueLabel)
        mainView.addSubview(typeLabel)
        mainView.addSubview(typeValueLabel)
        mainView.addSubview(genderLabel)
        mainView.addSubview(genderValueLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            speciesLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
            speciesLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            speciesLabel.heightAnchor.constraint(equalToConstant: 20),
         
            speciesValueLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
            speciesValueLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15),
            speciesValueLabel.heightAnchor.constraint(equalToConstant: 20),
            
            typeLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 15),
            typeLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            typeLabel.heightAnchor.constraint(equalToConstant: 20),
            
            typeValueLabel.topAnchor.constraint(equalTo: speciesValueLabel.bottomAnchor, constant: 15),
            typeValueLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15),
            typeValueLabel.heightAnchor.constraint(equalToConstant: 20),
            
            genderLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 15),
            genderLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            genderLabel.heightAnchor.constraint(equalToConstant: 20),
            
            genderValueLabel.topAnchor.constraint(equalTo: typeValueLabel.bottomAnchor, constant: 15),
            genderValueLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15),
            genderValueLabel.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
}

//
//  MainTableViewCell.swift
//  KrashPoems
//
//  Created by Vadim on 15.11.2022.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    private let categoryNameLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Roboto-Bold", size: 16)
        label.toAutoLayout()
        return label
    }()
    
    private let countLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont(name: "Roboto-Medium", size: 12)
        label.textColor = .lightGray
        label.toAutoLayout()
        return label
    }()
    
    private let lineView: UIView = {
        let view = UIView()
        view.toAutoLayout()
        view.backgroundColor = .darkGray
        return view
    }()
    
    static let idMainCell = "idMainCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        
        layer.cornerRadius = 10
        backgroundColor = .clear
        tintColor = .black

        addSubviews(categoryNameLabel, countLabel, lineView)
    }
        
    private var detailsModel = DetailsModel()
    
    public func configure(model: DetailsModel) {
        categoryNameLabel.text = model.poemName
        countLabel.text = model.fullPoem
    }
}

extension MainCollectionViewCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            categoryNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            categoryNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            categoryNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            
            countLabel.topAnchor.constraint(equalTo: categoryNameLabel.bottomAnchor, constant: 3),
            countLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            countLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),

            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            lineView.topAnchor.constraint(equalTo: countLabel.bottomAnchor, constant: 5),
            lineView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 15),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

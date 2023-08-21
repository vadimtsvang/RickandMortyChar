//
//  CharacterCell.swift
//  rAndMCharacters
//
//  Created by Vadim on 17.08.2023.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    private lazy var mainView: UIView = {
        var mainView = UIView()
        mainView.backgroundColor = #colorLiteral(red: 0.1482235789, green: 0.1655988097, blue: 0.2178440988, alpha: 1)
        mainView.layer.cornerRadius = 15
        mainView.clipsToBounds = true
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    lazy var characterImageView: UIImageView = {
        var characterImage = UIImageView()
        characterImage.layer.cornerRadius = 15
        characterImage.clipsToBounds = true
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        return characterImage
    }()
    
    lazy var characterNameLabel: UILabel = {
        var characterName = UILabel()
        characterName.font = UIFont.boldSystemFont(ofSize: 16)
        characterName.numberOfLines = 2
        characterName.textColor = .white
        characterName.textAlignment = .center
        characterName.translatesAutoresizingMaskIntoConstraints = false
        return characterName
    }()
    
    private var activityIndicator: UIActivityIndicatorView?
    private var imageURL: URL? {
        didSet {
            characterImageView.image = nil
            updateImage()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setConstraints()
        
        activityIndicator = showSpinner(in: mainView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with character: Character?) {
        characterNameLabel.text = character?.name
        imageURL = URL(string: character?.image ?? "")
    }
    
    private func setupViews() {
        contentView.addSubview(mainView)
        mainView.addSubview(characterImageView)
        mainView.addSubview(characterNameLabel)
    }
    
    private func getImage(from url: URL, completion: @escaping(Result<UIImage, Error>) -> Void) {
        if let cachedImage = ImageManager.shared.object(forKey: url.lastPathComponent as NSString) {
            completion(.success(cachedImage))
            return
        }
        
        NetworkManager.shared.fetchImage(from: url) { result in
            switch result {
            case .success(let imageData):
                guard let uiImage = UIImage(data: imageData) else { return }
                ImageManager.shared.setObject(uiImage, forKey: url.lastPathComponent as NSString)
                
                completion(.success(uiImage))
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func updateImage() {
        guard let imageURL = imageURL else { return }
        
        getImage(from: imageURL) { [weak self] result in
            switch result {
                
            case .success(let image):
                if imageURL == self?.imageURL {
                    self?.characterImageView.image = image
                    self?.activityIndicator?.stopAnimating()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func showSpinner(in view: UIView) -> UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .medium)
        view.addSubview(activityIndicator)
        activityIndicator.color = .white
        activityIndicator.startAnimating()
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: characterImageView.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: characterImageView.centerYAnchor)
        ])
        
        return activityIndicator
    }
}

extension CharacterCell {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            characterImageView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 8),
            characterImageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 8),
            characterImageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -8),
            characterImageView.heightAnchor.constraint(equalToConstant: 140),
            characterImageView.widthAnchor.constraint(equalToConstant: 140),
            
            characterNameLabel.topAnchor.constraint(equalTo: characterImageView.bottomAnchor, constant: 16),
            characterNameLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor)
        ])
    }
}

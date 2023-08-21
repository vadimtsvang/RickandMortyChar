//
//  EpisodeCell.swift
//  rAndMCharacters
//
//  Created by Vadim on 21.08.2023.
//

import UIKit

class EpisodeCell: UICollectionViewCell {
    
    private lazy var mainView: UIView = {
        var mainView = UIView()
        mainView.backgroundColor = #colorLiteral(red: 0.1482235789, green: 0.1655988097, blue: 0.2178440988, alpha: 1)
        mainView.layer.cornerRadius = 15
        mainView.clipsToBounds = true
        mainView.translatesAutoresizingMaskIntoConstraints = false
        return mainView
    }()
    
    lazy var nameEpisodeLabel: UILabel = {
        var label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "Gilroy-Light", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var episodeNumberLabel: UILabel = {
        var label = UILabel()
        label.textColor = #colorLiteral(red: 0.2784313725, green: 0.7764705882, blue: 0.0431372549, alpha: 1)
        label.font = UIFont(name: "Gilroy-Light", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var dateLabel: UILabel = {
        var label = UILabel()
        label.textColor = #colorLiteral(red: 0.5764705882, green: 0.5960784314, blue: 0.6117647059, alpha: 1)
        label.font = UIFont(name: "Gilroy-Light", size: 12)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Methods
    func configure(_ episodeURL: String) {
        NetworkManager.shared.fetch(Episode.self, from: episodeURL) { [weak self] result in
            switch result {
            case .success(let episode):
                self?.nameEpisodeLabel.text = episode.name
                self?.dateLabel.text = episode.airDate
                self?.episodeNumberLabel.text = self?.formatEpisodeNumber(episode.episode)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    // MARK: - Private Methods
    private func addViews() {
        contentView.addSubview(mainView)
        mainView.addSubview(nameEpisodeLabel)
        mainView.addSubview(episodeNumberLabel)
        mainView.addSubview(dateLabel)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            
            nameEpisodeLabel.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 15),
            nameEpisodeLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            nameEpisodeLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15),
            
            episodeNumberLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -15),
            episodeNumberLabel.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            
            dateLabel.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -16),
            dateLabel.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -15)
        ])
    }
    
    func formatEpisodeNumber(_ episodeNumber: String) -> String {
        if let seasonRange = episodeNumber.range(of: "S(\\d{2})", options: .regularExpression),
           let episodeRange = episodeNumber.range(of: "E(\\d{2})", options: .regularExpression) {
            
            let seasonNumber = String(Int(episodeNumber[seasonRange].dropFirst()) ?? 0)
            let episodeNumber = String(Int(episodeNumber[episodeRange].dropFirst()) ?? 0)
            
            return "Episode: \(episodeNumber), Season: \(seasonNumber)"
        } else {
            return episodeNumber
        }
    }
}

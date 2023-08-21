//
//  DetailsViewController.swift
//  rAndMCharacters
//
//  Created by Vadim on 21.08.2023.
//

import UIKit

class DetailsViewController: UICollectionViewController {
    
    private var episode: Episode!
    var character: Character!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.01332890149, green: 0.04810451716, blue: 0.1187042817, alpha: 1)
        
        registerCollectionCells()
        collectionView.backgroundColor = .clear
        
        setupNavBar()
    }
    
    // MARK: - Private Actions
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Init
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20 , left: 60, bottom: 0, right: 60)
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupNavBar() {
        let backButton = UIBarButtonItem(
            image: UIImage(systemName: "chevron.left"),
            style: .plain,
            target: self,
            action: #selector(goBack)
        )
        
        backButton.tintColor = .white
        navigationItem.leftBarButtonItem = backButton
    }
    
    private func registerCollectionCells() {
        collectionView.register(
            MainViewCell.self,
            forCellWithReuseIdentifier: "cell"
        )

        collectionView.register(
            SectionHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SectionHeaderView.reuseIdentifier
        )

        collectionView.register(
            OriginCell.self,
            forCellWithReuseIdentifier: "originCell"
        )

        collectionView.register(
            InfoCell.self,
            forCellWithReuseIdentifier: "infoCell"
        )

        collectionView.register(
            EpisodeCell.self,
            forCellWithReuseIdentifier: "episodeCell"
        )
    }
}

// MARK: - UICollectionViewDataSource
extension DetailsViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        4
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        section == 3 ? character.episode.count : 1
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        switch indexPath.section {
        case 0:
            guard
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
                    as? MainViewCell
            else {
                return UICollectionViewCell()
            }
            
            cell.configure(character)
            
            return cell
        case 1:
            guard
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "infoCell", for: indexPath)
                    as? InfoCell
            else {
                return UICollectionViewCell()
            }
            
            cell.configure(character)
            
            return cell
        case 2:
            guard
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "originCell", for: indexPath)
                    as? OriginCell
            else { return UICollectionViewCell()
            }
            
            cell.configure(character)
            
            return cell
        default:
            guard
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "episodeCell", for: indexPath)
                    as? EpisodeCell
            else {
                return UICollectionViewCell()
            }
            
            let episode = character.episode[indexPath.row]
            
            cell.configure(episode)
            
            return cell
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            guard let headerView = collectionView.dequeueReusableSupplementaryView(
                ofKind: kind,
                withReuseIdentifier: SectionHeaderView.reuseIdentifier,
                for: indexPath) as? SectionHeaderView
            else {
                return UICollectionReusableView()
            }
            
            let sectionTitles: [Int: String] = [
                1: "Info",
                2: "Origin",
                3: "Episodes"
            ]
            
            headerView.titleLabel.text = sectionTitles[indexPath.section]
            
            return headerView
        }
        
        return UICollectionReusableView()
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension DetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return CGSize(width: 150, height: 220)
        case 1:
            return CGSize(width: UIScreen.main.bounds.width - 32, height: 120)
        case 2:
            return CGSize(width: UIScreen.main.bounds.width - 32, height: 80)
        default:
            return CGSize(width: UIScreen.main.bounds.width - 32, height: 86)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        return section == 0
        ? UIEdgeInsets(top: -60, left: 60, bottom: 20, right: 60)
        : UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.bounds.width, height: 20)
    }
}

// MARK: - Networking
extension DetailsViewController {
    private func fetchEpisode(from url: String) {
        NetworkManager.shared.fetch(Episode.self, from: url) { [weak self] result in
            switch result {
            case .success(let episode):
                self?.episode = episode
            case .failure(let error):
                print(error)
            }
        }
    }
}

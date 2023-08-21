//
//  ViewController.swift
//  rAndMCharacters
//
//  Created by Vadim on 17.08.2023.
//

import UIKit

final class MainViewController: UICollectionViewController {
    
    private var rickAndMorty: RickAndMorty?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = #colorLiteral(red: 0.01332890149, green: 0.04810451716, blue: 0.1187042817, alpha: 1)
        
        setupCollectionView()
        
        fetchCharacters(from: Links.rickAndMortyURL.rawValue)
        setupNavBar()
    }
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 28, bottom: 0, right: 28)
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupNavBar() {
        title = "Characters"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let navBarAppearance = UINavigationBarAppearance()
        
        
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "Gilroy-ExtraBold", size: 28)!]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        
        navBarAppearance.backgroundColor = #colorLiteral(red: 0.01332890149, green: 0.04810451716, blue: 0.1187042817, alpha: 1)
        
        navigationController?.navigationBar.standardAppearance = navBarAppearance
    }
    
    private func setupCollectionView() {
        collectionView.register(CharacterCell.self, forCellWithReuseIdentifier: "characterCell")
        
        collectionView.backgroundColor = .clear
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        rickAndMorty?.results.count ?? 0
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "characterCell", for: indexPath) as? CharacterCell else { return UICollectionViewCell() }
        let character = rickAndMorty?.results[indexPath.row]
        cell.configure(with: character)
        return cell
    }
}

// MARK: UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 156, height: 202)
    }
}

// MARK: - UICollectionViewDelegate
extension MainViewController {
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCharacter = rickAndMorty?.results[indexPath.row]
        
        let detailsVC = DetailsViewController()
        detailsVC.character = selectedCharacter
        
        navigationController?.pushViewController(detailsVC, animated: true)
    }
}

extension MainViewController {
    private func fetchCharacters(from url: String) {
        NetworkManager.shared.fetch(RickAndMorty.self, from: url) { [weak self] result in
            switch result {
                
            case .success(let rickAndMorty):
                self?.rickAndMorty = rickAndMorty
                self?.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

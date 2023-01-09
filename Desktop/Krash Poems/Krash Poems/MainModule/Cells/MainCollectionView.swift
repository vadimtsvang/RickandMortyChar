//
//  MainCollectionView.swift
//  KrashPoems
//
//  Created by Vadim on 15.11.2022.
//

import UIKit

protocol MainCollectionViewProtocol: AnyObject {
    func goToDetails(index: Int)
}

class MainCollectionView: UICollectionView {
    
    private var poemArray = [DetailsModel]()
    
    weak var mainDelegate: MainCollectionViewProtocol?
    
    private let collectionLayot = UICollectionViewFlowLayout()
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayot)
        
        configure()
        setDelegates()
        register(MainCollectionViewCell.self,
                 forCellWithReuseIdentifier: MainCollectionViewCell.idMainCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        collectionLayot.scrollDirection = .vertical
        backgroundColor = .none
        bounces = false
        //showsVerticalScrollIndicator = false
        toAutoLayout()
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
    
    public func setPoemArray(_ array: [DetailsModel]) {
        poemArray = array
    }
}

// MARK: - UICollectionViewDataSource

extension MainCollectionView: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        poemArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainCollectionViewCell.idMainCell, for: indexPath) as? MainCollectionViewCell else { return UICollectionViewCell() }
        let detailModel = poemArray[indexPath.row]
        cell.configure(model: detailModel)
        return cell
    }
}

//MARK: - UICollectionViewDelegate

extension MainCollectionView: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mainDelegate?.goToDetails(index: indexPath.row)
    }
}

//MARK: - UICollectionViewDelegateFlowLayout

extension MainCollectionView: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 1.1,
               height: collectionView.frame.height / 10)
    }
}


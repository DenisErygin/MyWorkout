//
//  SelectImageCollectionView.swift
//  MyWorkout
//
//  Created by Денис Ерыгин on 17.03.2023.
//

import UIKit

protocol ImageSelectProtocol: AnyObject { // 24
    func selectImage(nameImage: String)
}

class SelectImageCollectionView: UICollectionView {
    
    weak var imageNameDelegate: ImageSelectProtocol?
    
    private let collectionLayout = UICollectionViewFlowLayout()
    
    private let imageArray = ["setting", "sun", "setting", "sun", "setting", "sun"]
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: collectionLayout)
        
        configure()
        setupLayout()
        setDelegates()
        
        register(SelectImageCollectionViewCell.self,
                 forCellWithReuseIdentifier: SelectImageCollectionViewCell.idImageCell)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = .none
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setupLayout() { // 6
        collectionLayout.minimumInteritemSpacing = 3 // 6
        collectionLayout.scrollDirection = .horizontal
    }
    
    private func setDelegates() {
        dataSource = self
        delegate = self
    }
}

// MARK: - UICollectionViewDataSource

extension SelectImageCollectionView: UICollectionViewDataSource { // 8
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { // количество ячеек
        imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectImageCollectionViewCell.idImageCell, for: indexPath) as? SelectImageCollectionViewCell else { return UICollectionViewCell() } //9
        
        let nameImageArray = imageArray[indexPath.row] //21
        cell.configure(nameImage: nameImageArray) //22
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension SelectImageCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width / 5, height: collectionView.frame.height) //
    }
}

// MARK: - UICollectionViewDelegate

extension SelectImageCollectionView: UICollectionViewDelegate { // 23
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        imageNameDelegate?.selectImage(nameImage: imageArray[indexPath.row])
    }
}

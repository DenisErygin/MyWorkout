//
//  SelectImageCollectionViewCell.swift
//  MyWorkout
//
//  Created by Денис Ерыгин on 17.03.2023.
//

import UIKit

class SelectImageCollectionViewCell: UICollectionViewCell { // 7
    
    static let idImageCell = "idImageCell" // 10
    
    private let imageView: UIImageView = { // 18
       let imageView = UIImageView()
        imageView.tintColor = .specialDarkGreen
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .specialBrown
        layer.cornerRadius = 10
        addSubview(imageView)
        
        setConstrains()
    }
    
    override var isSelected: Bool {
        didSet {
            if self.isSelected {
                backgroundColor = .specialDarkGreen
                imageView.tintColor = .white
            } else {
                backgroundColor = .specialBrown
                imageView.tintColor = .specialDarkGreen
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(nameImage: String) { // 20
        imageView.image = UIImage(named: nameImage)?.withRenderingMode(.alwaysTemplate)
    }
    
    private func setConstrains() { // 19
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -5)
        ])
    }
}

//
//  YellowButton.swift
//  MyWorkout
//
//  Created by Денис Ерыгин on 13.03.2023.
//

import UIKit

class YellowButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setTitle("NEXT SET", for: .normal)
        backgroundColor = .specialDarkYellow
        titleLabel?.font = .robotoBold20()
        tintColor = .specialGray
        layer.cornerRadius = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

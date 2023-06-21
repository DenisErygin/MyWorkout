//
//  LineView.swift
//  MyWorkout
//
//  Created by Денис Ерыгин on 13.03.2023.
//

import UIKit

class LineView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        backgroundColor = #colorLiteral(red: 0.8110429645, green: 0.8110429049, blue: 0.8110428452, alpha: 1)
        translatesAutoresizingMaskIntoConstraints = false
    }
}


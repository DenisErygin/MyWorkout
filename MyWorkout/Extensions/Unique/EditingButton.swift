//
//  EditingButton.swift
//  MyWorkout
//
//  Created by Денис Ерыгин on 13.03.2023.
//

import UIKit

class EditingButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        setTitle("Editing", for: .normal)
        setTitleColor(.gray, for: .normal)
        titleLabel?.font = .robotoBold16()
        setImage(UIImage(named: "editing"), for: .normal)
        tintColor = .specialGray
        translatesAutoresizingMaskIntoConstraints = false
    }
}

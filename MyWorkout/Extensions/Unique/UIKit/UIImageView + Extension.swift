//
//  UIImageView + Extension.swift
//  MyWorkout
//
//  Created by Денис Ерыгин on 13.03.2023.
//

import UIKit

extension UIImageView {

    convenience init(imageName: String) {
        self.init()
        self.image = UIImage(named: imageName)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

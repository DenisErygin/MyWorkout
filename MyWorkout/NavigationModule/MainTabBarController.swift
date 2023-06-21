//
//  MainTabBarController.swift
//  MyWorkout
//
//  Created by Денис Ерыгин on 28.02.2023.
//

import UIKit

class MainTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
        setupItems()
    }
    
    private func setupTabBar() {
        tabBar.backgroundColor = .specialTabBar
        tabBar.tintColor = .specialDarkGreen
        tabBar.unselectedItemTintColor = .specialGray
        tabBar.layer.borderWidth = 1
        tabBar.layer.borderColor = UIColor.specialLightBrown.cgColor
    }
    
    private func setupItems() {
        let mainVC = MainViewController()
        let statisticVC = StatisticViewController()
        
        setViewControllers([mainVC, statisticVC], animated: true)
        
        guard let item = tabBar.items else { return }
        
        item[0].title = "Main"
        item[1].title = "Statistic"
        
        item[0].image = UIImage(named: "mainTabBar")
        item[1].image = UIImage(named: "statisticTabBar")
        
        UITabBarItem.appearance().setTitleTextAttributes([.font : UIFont.robotoBold12() as Any], for: .normal)
    }
}

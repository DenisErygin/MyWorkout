//
//  WeatherView.swift
//  MyWorkout
//
//  Created by Денис Ерыгин on 22.02.2023.
//

import UIKit

class WeatherView: UIView {
    
    private let weatherHeadingLabel: UILabel = {
        let label = UILabel()
        label.text = "Солнечно"
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.tintColor = .specialGray
        label.font = .robotoMedium18()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let descriptionWeatherLabel: UILabel = {
       let label = UILabel()
        label.text = "Хорошая погода, чтобы позаниматься на улице"
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.tintColor = .specialGray
        label.font = .robotoMedium14()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let imageWeatherView = UIImageView(imageName: "sun")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        backgroundColor = #colorLiteral(red: 0.9764705882, green: 0.9764705882, blue: 0.9764705882, alpha: 1)
        layer.cornerRadius = 10
        addShadowOnView()
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(weatherHeadingLabel)
        addSubview(descriptionWeatherLabel)
        addSubview(imageWeatherView)
    }
}

extension WeatherView {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            weatherHeadingLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            weatherHeadingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            weatherHeadingLabel.trailingAnchor.constraint(equalTo: imageWeatherView.leadingAnchor, constant: -10),
            
            descriptionWeatherLabel.topAnchor.constraint(equalTo: weatherHeadingLabel.bottomAnchor, constant: 3),
            descriptionWeatherLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            descriptionWeatherLabel.trailingAnchor.constraint(equalTo: imageWeatherView.leadingAnchor, constant: -10),
            
            imageWeatherView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            imageWeatherView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageWeatherView.heightAnchor.constraint(equalToConstant: 60),
            imageWeatherView.widthAnchor.constraint(equalToConstant: 60),
        ])
    }
}

//
//  DateAndRepeatView.swift
//  MyWorkout
//
//  Created by Денис Ерыгин on 28.02.2023.
//

import UIKit

class DateAndRepeatView: UIView {

    private let dateAndRepeatLabel = UILabel(text: "Date and repeat")
    
    private let backgroundView: UIView = {
       let view = UIView()
        view.backgroundColor = .specialBrown
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let dateLabel = UILabel(text: "Date",
                                    font: .robotoMedium20() ?? .systemFont(ofSize: 20),
                                    textColor: .specialGray)
    private let repeatLabel = UILabel(text: "Repeat every 7 days",
                                    font: .robotoMedium20() ?? .systemFont(ofSize: 20),
                                    textColor: .specialGray)
    
    private let datePicker: UIDatePicker = {
       let piker = UIDatePicker()
        piker.datePickerMode = .date
        piker.tintColor = .specialGreen
        piker.translatesAutoresizingMaskIntoConstraints = false
        return piker
    }()
    
    private lazy var repeatSwitch: UISwitch = {
        let testSwitch = UISwitch()
        testSwitch.onTintColor = .specialGreen
        testSwitch.isOn = true
        testSwitch.addTarget(self, action: #selector(repeatSwitchTapped), for: .valueChanged)
        testSwitch.translatesAutoresizingMaskIntoConstraints = false
        return testSwitch
    }()
    
    private var dateStackView = UIStackView()
    private var repeatStackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        addSubview(dateAndRepeatLabel)
        addSubview(backgroundView)
        
        dateStackView = UIStackView(arrangedSubviews: [dateLabel, datePicker],
                                    axis: .horizontal,
                                    spacing: 10)
        dateStackView.distribution = .equalCentering
        addSubview(dateStackView)
        
        repeatStackView = UIStackView(arrangedSubviews: [repeatLabel, repeatSwitch],
                                    axis: .horizontal,
                                    spacing: 10)
        repeatStackView.distribution = .equalCentering
        addSubview(repeatStackView)
    }
    
    @objc private func repeatSwitchTapped() {
        print("i")
    }
    
    public func getDateAndRepeat() -> (date: Date, isRepeat: Bool) {
        (datePicker.date, repeatSwitch.isOn)
    }
    
    public func resetDataAndRepeat() {
        datePicker.date = Date()
        repeatSwitch.isOn = true
    }
}

// MARK: - setConstraints

extension DateAndRepeatView {
    private func setConstraints() {
        NSLayoutConstraint.activate([
            dateAndRepeatLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            dateAndRepeatLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 7),
            dateAndRepeatLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -7),
            dateAndRepeatLabel.heightAnchor.constraint(equalToConstant: 16),
            
            backgroundView.topAnchor.constraint(equalTo: dateAndRepeatLabel.bottomAnchor, constant: 3),
            backgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            backgroundView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),
            
            dateStackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 15),
            dateStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            dateStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10),
            
            repeatStackView.topAnchor.constraint(equalTo: dateStackView.bottomAnchor, constant: 15),
            repeatStackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 10),
            repeatStackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -10)
        ])
    }
}

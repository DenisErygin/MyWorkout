//
//  SetsAndRepsView.swift
//  MyWorkout
//
//  Created by Денис Ерыгин on 13.03.2023.
//

import UIKit

protocol NextSetProtocol: AnyObject {
    func nextSetTapped()
    func editingTapped()
}

class WorkoutParametersView: UIView {
    
    private let workoutNameLabel = UILabel(text: "Biceps",
                                            font: .robotoMedium24(),
                                            textColor: .specialGray)
    
    private let setsLabel = UILabel(text: "Sets",
                                    font: .robotoMedium18(),
                                    textColor: .specialGray)
    
    private let numberSetsLabel = UILabel(text: "1/4",
                                           font: .robotoMedium24(),
                                           textColor: .specialGray)
    
    private let repsLabel = UILabel(text: "Reps",
                                    font: .robotoMedium18(),
                                    textColor: .specialGray)
    
    private let numberRepsLabel = UILabel(text: "20",
                                           font: .robotoMedium24(),
                                           textColor: .specialGray)
    
    private var setsStackView = UIStackView()
    private var repsStackView = UIStackView()
    
    weak var cellNextSetDelegate: NextSetProtocol?
    
    private var setsLineView = LineView()
    private var repsLineView = LineView()
    
    private let editingButton = EditingButton(type: .system)
    private let nextSetButton = YellowButton(type: .system)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        setContsrains()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        translatesAutoresizingMaskIntoConstraints = false
        layer.cornerRadius = 10
        backgroundColor = .specialBrown
        
        workoutNameLabel.textAlignment = .center
        addSubview(workoutNameLabel)
        
        setsStackView = UIStackView(arrangedSubviews: [setsLabel, numberSetsLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        setsStackView.distribution = .equalSpacing
        addSubview(setsStackView)
        addSubview(setsLineView)
        
        repsStackView = UIStackView(arrangedSubviews: [repsLabel, numberRepsLabel],
                                    axis: .horizontal,
                                    spacing: 10)
        repsStackView.distribution = .equalSpacing
        
        editingButton.addTarget(self, action: #selector(editingButtonTapped), for: .touchUpInside)
        nextSetButton.addTarget(self, action: #selector(nextSetsButtonTapped), for: .touchUpInside)

        addSubview(repsStackView)
        addSubview(repsLineView)
        addSubview(editingButton)
        addSubview(nextSetButton)
    }
    
    @objc private func editingButtonTapped() {
        cellNextSetDelegate?.editingTapped()
    }
    
    @objc private func nextSetsButtonTapped() {
        cellNextSetDelegate?.nextSetTapped()
    }
    
    public func refreshLabels(model: WorkoutModel, numberOfSet: Int) {
        workoutNameLabel.text = model.workoutName
        numberSetsLabel.text = "\(numberOfSet)/ \(model.workoutSets)"
        numberRepsLabel.text = "\(model.workoutReps)"
    }
}
                                            
// MARK: - setContsrains

extension WorkoutParametersView {
    private func setContsrains() {
        NSLayoutConstraint.activate([
            workoutNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            workoutNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            workoutNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            workoutNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
        
            setsStackView.topAnchor.constraint(equalTo: workoutNameLabel.bottomAnchor, constant: 15),
            setsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            setsLineView.topAnchor.constraint(equalTo: setsStackView.bottomAnchor, constant: 0),
            setsLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            setsLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            setsLineView.heightAnchor.constraint(equalToConstant: 1),
            
            repsStackView.topAnchor.constraint(equalTo: setsLineView.bottomAnchor, constant: 20),
            repsStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            repsLineView.topAnchor.constraint(equalTo: repsStackView.bottomAnchor, constant: 0),
            repsLineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            repsLineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            repsLineView.heightAnchor.constraint(equalToConstant: 1),
            
            editingButton.topAnchor.constraint(equalTo: repsLineView.bottomAnchor, constant: 10),
            editingButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            
            nextSetButton.topAnchor.constraint(equalTo: repsLineView.bottomAnchor, constant: 45),
            nextSetButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            nextSetButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            nextSetButton.heightAnchor.constraint(equalToConstant: 45)
        ])
    }
}

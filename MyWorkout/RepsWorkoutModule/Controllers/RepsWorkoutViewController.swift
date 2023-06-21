//
//  RepsWorkoutViewController.swift
//  MyWorkout
//
//  Created by Денис Ерыгин on 12.03.2023.
//

import UIKit

class RepsWorkoutViewController: UIViewController {
    
    private let startWorkoutLabel = UILabel(text: "START WORKOUT",
                                            font: .robotoMedium24(),
                                            textColor: .specialGray)
    private let detailsLabel = UILabel(text: "Details")
    
    public var sportsmanImageView = UIImageView(imageName: "sportsman") //
    
    private lazy var closeButton = CloseButton(type: .system)
    private let finishButton = GreenButton(text: "FINISH")
    
    private let workoutParametersView = WorkoutParametersView()
    private var workoutModel = WorkoutModel()
    private let customAlert = CustomAlert()
    
    private var numberOfSet = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setConstrains()
    }
    
    private func setupViews() {
        view.backgroundColor = .specialBackground
        
        view.addSubview(startWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(sportsmanImageView)
        workoutParametersView.refreshLabels(model: workoutModel, numberOfSet: numberOfSet)
        workoutParametersView.cellNextSetDelegate = self
        view.addSubview(workoutParametersView)
        view.addSubview(detailsLabel)
        view.addSubview(finishButton)
        
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        finishButton.addTarget(self, action: #selector(finishButtonTapped), for: .touchUpInside)
    }
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func finishButtonTapped() {
        if numberOfSet == workoutModel.workoutSets {
            dismiss(animated: true)
            RealmManager.shared.updateStatusWorkoutModel(model: workoutModel)
        } else {
            presentAlertWithActions(title: "Warning", message: "You haven't finished your workout") {
                self.dismiss(animated: true)
            }
        }
    }
    
    public func setWorkoutModel(_ model: WorkoutModel) {
        workoutModel = model
    }
}

// MARK: - setContsrains
extension RepsWorkoutViewController: NextSetProtocol {
    func nextSetTapped() {
        if numberOfSet < workoutModel.workoutSets {
            numberOfSet += 1
            workoutParametersView.refreshLabels(model: workoutModel, numberOfSet: numberOfSet)
        } else {
            presentSimpleAlert(title: "Error", message: "Finish your workout")
        }
    }
    
    func editingTapped() {
        customAlert.presentCustomAlert(viewController: self,
                                       repsOrTimer: "Reps") { [weak self] sets, reps in
            guard let self = self else { return }
            if sets != "" && reps != "" {
                guard let numberOfSets = Int(sets),
                      let numberOfReps = Int(reps) else { return }
                RealmManager.shared.updateSetsRepsWorkoutModel(model: self.workoutModel,
                                                               sets: numberOfSets,
                                                               reps: numberOfReps)
                self.workoutParametersView.refreshLabels(model: self.workoutModel, numberOfSet: self.numberOfSet)
            }
        }
    }
}

// MARK: - SET CONSTRAINS

extension RepsWorkoutViewController {
    private func setConstrains() {
        NSLayoutConstraint.activate([
            startWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            startWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            closeButton.centerYAnchor.constraint(equalTo: startWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            closeButton.heightAnchor.constraint(equalToConstant: 33),
            closeButton.widthAnchor.constraint(equalToConstant: 33),
            
            sportsmanImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sportsmanImageView.topAnchor.constraint(equalTo: startWorkoutLabel.bottomAnchor, constant: 25),
            sportsmanImageView.heightAnchor.constraint(equalToConstant: 250),
            
            workoutParametersView.topAnchor.constraint(equalTo: sportsmanImageView.bottomAnchor, constant: 40),
            workoutParametersView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            workoutParametersView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            workoutParametersView.heightAnchor.constraint(equalToConstant: 240),
            
            detailsLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 23),
            detailsLabel.bottomAnchor.constraint(equalTo: workoutParametersView.topAnchor, constant: -2),
            
            finishButton.topAnchor.constraint(equalTo: workoutParametersView.bottomAnchor, constant: 15),
            finishButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            finishButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            finishButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}

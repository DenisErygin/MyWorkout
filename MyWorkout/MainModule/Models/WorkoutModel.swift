//
//  WorkoutModel.swift
//  MyWorkout
//
//  Created by Денис Ерыгин on 07.03.2023.
//

import Foundation
import RealmSwift

class WorkoutModel: Object {
    @Persisted var workoutDate: Date
    @Persisted var workoutNumberOfDay: Int = 0
    @Persisted var workoutName: String = "Unknown"
    @Persisted var workoutRepeat: Bool = true
    @Persisted var workoutSets: Int = 0
    @Persisted var workoutReps: Int = 0
    @Persisted var workoutTimer: Int = 0 //в секундах
    @Persisted var workoutImage: String = ""
    @Persisted var workoutStatus: Bool = false
}

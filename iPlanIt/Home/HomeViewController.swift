//
//  HomeViewController.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 16/01/24.
//

import UIKit
import HealthKitUI

extension Date {
    static func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE, MMM d, yyyy"
        return dateFormatter.string(from: Date())
    }
}

class HomeViewController: UIViewController {

    @IBOutlet weak var activityDetails: UIStackView!
    @IBOutlet weak var completedTask: UILabel!
    @IBOutlet weak var calenderButton: UIButton!
    @IBOutlet weak var progressRingView: UIView!
    @IBOutlet weak var currentDate: UILabel!
    
    
    @IBOutlet weak var completedTaskLabel: UILabel!
    @IBOutlet weak var ongoingTaskLabel: UILabel!
    @IBOutlet weak var upcomingTaskLabel: UILabel!
    
    /// Data from Model
    let compledTasks: Double = Double(taskDataModel.getAllTasks().filter({$0.isCompleted}).count)
    let totalTasks: Double = Double(taskDataModel.getAllTasks().count)
    
    override func viewDidLoad() {
        /// Setting current date
        let today = Date.getCurrentDate()
        currentDate?.text = today
        
        /// Create ActivityRingView
        let view = HKActivityRingView( frame: CGRect(x: 0.0, y: 0.0, width: 300, height: 300) )
        let summary = HKActivitySummary();
        
        /// Creating Rring (Green)
        // summary.appleExerciseTime = HKQuantity(unit: HKUnit.hour(), doubleValue: compledTasks);
        // summary.appleExerciseTimeGoal = HKQuantity(unit: HKUnit.hour(), doubleValue: totalTasks);
        
        /// Creating Rring (Red)
        summary.activeEnergyBurnedGoal = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: totalTasks);
        summary.activeEnergyBurned = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: compledTasks);
        
        /// Set the activity summary
        view.setActivitySummary(summary, animated: true)
        
        progressRingView.addSubview(view)
        
        /// Adding padding to Activity Stack View
        activityDetails.layoutMargins = UIEdgeInsets(top: 25, left: 10, bottom: 25, right: 10)
        activityDetails.isLayoutMarginsRelativeArrangement = true
        
        /// Activity Stack View corner radius
        activityDetails.layer.cornerRadius = 10
        
        /// Respond to tap gesture
        progressRingView.isUserInteractionEnabled = true
        progressRingView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageTap)))
        /// Adding calender icon from SFSymbols
        calenderButton.setImage(UIImage(systemName: "calendar"), for: .normal)
        calenderButton.tintColor = .black
        
        // MARK: - Changing the Activity Details
        let tasks = AppTaskDataModel().getAllTasks()
        let completedTasksCount = tasks.filter({$0.isCompleted}).count
        
        completedTaskLabel?.text = "⭐️ \(completedTasksCount)/\(tasks.count) Tasks Completed"
        ongoingTaskLabel?.text = "\(tasks[0].emoji) \(tasks[0].title)"
        upcomingTaskLabel?.text = "\(tasks[1].emoji) \(tasks[1].title)"
    }
    
    /// Image Tap Handler Function
    @objc func imageTap() {
        /// or push to the navigation stack
        let destinationVC =  self.storyboard?.instantiateViewController(withIdentifier: "Task List") as! TaskListViewController
    
        navigationController?.pushViewController(destinationVC, animated: true)
    }
}

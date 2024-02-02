//
//  HomeViewController.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 16/01/24.
//

import UIKit
import HealthKitUI

// store in the file also
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
    
    var tasks: [Task] = []; var completedTasks: [Task] = []; var pendingTasks: [Task] = []
    
    override func viewDidLoad() {
        /// Setting current date
        let today = Date.getCurrentDate()
        currentDate?.text = today
        
        /// Create ActivityRingView
        // MARK: - Change this to sub method and call in viewDidLoad()
        let view = HKActivityRingView( frame: CGRect(x: 0.0, y: 0.0, width: 300, height: 300) )
        let summary = HKActivitySummary();
        
        let compledTasks: Double = Double(taskDataModel.getAllTasks().filter({$0.isCompleted}).count)
        let totalTasks: Double = Double(taskDataModel.getAllTasks().count)
        
        // Create the sepeerate file for creating the ring
        /// Creating Rring (Green)
        summary.appleExerciseTime = HKQuantity(unit: HKUnit.hour(), doubleValue: compledTasks);
        summary.appleExerciseTimeGoal = HKQuantity(unit: HKUnit.hour(), doubleValue: totalTasks);
        
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
        self.tasks = taskDataModel.getAllTasks()
        let completedTasksCount = tasks.filter({$0.isCompleted}).count
        
        // Cahnge the string and store in file
        completedTaskLabel?.text = "⭐️ \(completedTasksCount)/\(tasks.count) Tasks Completed"
        ongoingTaskLabel?.text = "\(tasks[0].emoji) \(tasks[0].title)"
        upcomingTaskLabel?.text = "\(tasks[1].emoji) \(tasks[1].title)"
    }
    
    // MARK: - Change this to sub method and call in viewDidLoad()
    override func viewWillAppear(_ animated: Bool) {
        let summary = HKActivitySummary();
        let compledTasks: Double = Double(taskDataModel.getAllTasks().filter({$0.isCompleted}).count)
        let totalTasks: Double = Double(taskDataModel.getAllTasks().count)
        
        let view = HKActivityRingView( frame: CGRect(x: 0.0, y: 0.0, width: 300, height: 300) )
        
        /// Creating Rring (Red)
        summary.activeEnergyBurnedGoal = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: totalTasks);
        summary.activeEnergyBurned = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: compledTasks);
        
        /// Set the activity summary
        view.setActivitySummary(summary, animated: true)
        
        progressRingView.addSubview(view)
        
        // MARK: - Changing the Activity Details
        tasks = taskDataModel.getAllTasks()
        let completedTasksCount = self.tasks.filter({$0.isCompleted}).count
        
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

//
//  HomeViewController.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 16/01/24.
//

import UIKit
import HealthKitUI

class HomeViewController: UIViewController {

    @IBOutlet weak var activityDetails: UIStackView!
    @IBOutlet weak var completedTask: UILabel!
    @IBOutlet weak var calenderButton: UIButton!
    @IBOutlet weak var progressRingView: UIView!
    
    /// Data from Model
    let compledTasks: Double = Double(AppTaskDataModel().getAllTasks().filter({$0.isCompleted}).count)
    let totalTasks: Double = Double(AppTaskDataModel().getAllTasks().count)
    
    override func viewDidLoad() {
        /// Create ActivityRingView
        let view = HKActivityRingView( frame: CGRect(x: 0.0, y: 0.0, width: 300, height: 300) )
        let summary = HKActivitySummary();
        
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
    }
    
    /// Image Tap Handler Function
    @objc func imageTap() {
        /// or push to the navigation stack
        let destinationVC =  self.storyboard?.instantiateViewController(withIdentifier: "Task List") as! TaskListViewController
    
        navigationController?.pushViewController(destinationVC, animated: true)
    }

}

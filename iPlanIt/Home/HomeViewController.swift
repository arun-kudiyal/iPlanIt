//
//  HomeViewController.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 16/01/24.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var activityDetails: UIStackView!
    @IBOutlet weak var completedTask: UILabel!
    @IBOutlet weak var activityRingImage: UIImageView!
    @IBOutlet weak var calenderButton: UIButton!
    @IBOutlet weak var progressRingView: UIView!
    /// Data from Model
    var tasks: [Task] = taskDataModel.getAllTasks()
    
    override func viewDidLoad() {
        /// Create an embed RingProgressView
//        let ringProgressView = RingProgressView(frame: CGRect(x: 0, y: 100, width: 100, height: 100))
//        ringProgressView.startColor = .red
//        ringProgressView.endColor = .magenta
//        ringProgressView.ringWidth = 25
//        ringProgressView.progress = 0.0
//        progressRingView.addSubview(ringProgressView)
        
        /// Adding padding to Activity Stack View
        activityDetails.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        activityDetails.isLayoutMarginsRelativeArrangement = true
        /// Respond to tap gesture
        activityRingImage.isUserInteractionEnabled = true
        activityRingImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageTap)))
        /// Adding calender icon from SFSymbols
        calenderButton.setImage(UIImage(systemName: "calendar"), for: .normal)
        calenderButton.tintColor = .black
        
        
        /// View Calculations
        var completedTasksCount = tasks.filter({$0.isCompleted}).count
        var pendingTasksCount = tasks.filter({!$0.isCompleted}).count
        print("Completed Tasks \(completedTasksCount) | Pending Taks \(pendingTasksCount)")
        var percentageCompleted: Double = (Double(completedTasksCount) / Double(tasks.count)) * 100.0
        print(percentageCompleted)
    }
    
    /// Image Tap Handler Function
    @objc func imageTap() {
        /// or push to the navigation stack
        let destinationVC =  self.storyboard?.instantiateViewController(withIdentifier: "Task List") as! TaskListViewController
    
        navigationController?.pushViewController(destinationVC, animated: true)
    }

}

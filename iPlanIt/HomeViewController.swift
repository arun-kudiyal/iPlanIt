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
    
    override func viewDidLoad() {
        /// Adding padding to Activity Stack View
        activityDetails.layoutMargins = UIEdgeInsets(top: 15, left: 15, bottom: 15, right: 15)
        activityDetails.isLayoutMarginsRelativeArrangement = true
        /// Respond to tap gesture
        activityRingImage.isUserInteractionEnabled = true
        activityRingImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageTap)))
    }
    
    /// Image Tap Handler Function
    @objc func imageTap() {
        print("Works!")
        /// or push to the navigation stack
        self.navigationController?.pushViewController(TasksTableViewController(), animated: true)
    }

}

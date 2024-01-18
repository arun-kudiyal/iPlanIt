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
    override func viewDidLoad() {
        /// Adding padding to Activity Stack View
        activityDetails.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        activityDetails.isLayoutMarginsRelativeArrangement = true
        /// Respond to tap gesture
        activityRingImage.isUserInteractionEnabled = true
        activityRingImage.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.imageTap)))
        /// Adding calender icon from SFSymbols
        calenderButton.setImage(UIImage(systemName: "calendar"), for: .normal)
        calenderButton.tintColor = .black
    }
    
    /// Image Tap Handler Function
    @objc func imageTap() {
        print("Works!")
        /// or push to the navigation stack
        self.navigationController?.pushViewController(TasksTableViewController(), animated: true)
    }

}

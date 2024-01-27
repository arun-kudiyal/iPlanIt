//
//  CalendarViewController.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 26/01/24.
//

import UIKit
import HealthKitUI

class CalendarViewController: UIViewController, UICalendarViewDelegate {
    
    @IBOutlet weak var mainView: UIView!
    
    @objc func cancelButtonTapped() {
        print("Works!")
        let destinationVC =  self.storyboard?.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendarView = UICalendarView(frame: CGRect(x: 0, y: 0, width: 400, height: 800))
        print(calendarView)
        calendarView.delegate = self
        calendarView.calendar = Calendar(identifier: .gregorian)
        calendarView.translatesAutoresizingMaskIntoConstraints = true
        calendarView.wantsDateDecorations = true
        
        self.mainView.addSubview(calendarView)
        
        /// Adding navigation bar
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        view.addSubview(navBar)

        let navItem = UINavigationItem(title: "Calendar")
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(cancelButtonTapped))
        navItem.leftBarButtonItem = cancelItem

        navBar.setItems([navItem], animated: false)
    }
    
    func calendarView(_ calendarView: UICalendarView, decorationFor dateComponents: DateComponents) -> UICalendarView.Decoration? {
        return .customView ({
            let compledTasks: Double = Double(AppTaskDataModel().getAllTasks().filter({$0.isCompleted}).count)
            let totalTasks: Double = Double(AppTaskDataModel().getAllTasks().count)
            
            let view = HKActivityRingView( frame: CGRect(x: 0.0, y: 0.0, width: 20, height: 20) )
            let summary = HKActivitySummary();
            summary.activeEnergyBurnedGoal = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: totalTasks);
            summary.activeEnergyBurned = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: compledTasks);
            
            view.setActivitySummary(summary, animated: false)
            
            return view
        })
    }
}

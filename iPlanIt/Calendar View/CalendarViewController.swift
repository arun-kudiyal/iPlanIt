//
//  CalendarViewController.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 26/01/24.
//

import UIKit
import HealthKitUI
import FSCalendar

extension HKActivityRingView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

class CalendarViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    @IBOutlet weak var mainView: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // mainView.scrollDirection = .vertical
    }
    
    /* func calendar(_ calendar: FSCalendar, imageFor date: Date) -> UIImage? {
        let compledTasks: Double = Double(AppTaskDataModel().getAllTasks().filter({$0.isCompleted}).count)
        let totalTasks: Double = Double(AppTaskDataModel().getAllTasks().count)
                    
        let view = HKActivityRingView( frame: CGRect(x: 0.0, y: 0.0, width: 20, height: 20) )
        let summary = HKActivitySummary();
        summary.activeEnergyBurnedGoal = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: totalTasks);
        summary.activeEnergyBurned = HKQuantity(unit: HKUnit.kilocalorie(), doubleValue: compledTasks);
        view.setActivitySummary(summary, animated: false)
        
        return view.asImage()
    } */ 
}

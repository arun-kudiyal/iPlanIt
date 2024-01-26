//
//  CalendarViewController.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 26/01/24.
//

import UIKit

class CalendarViewController: UIViewController, UICalendarViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendarView = UICalendarView(frame: CGRect(x: 0, y: 0, width: 400 , height: 500))
        calendarView.delegate = self
        calendarView.calendar = Calendar(identifier: .gregorian)
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.wantsDateDecorations = true
        
        self.view.addSubview(calendarView)
    }
}

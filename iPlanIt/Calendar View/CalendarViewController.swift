//
//  CalendarViewController.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 26/01/24.
//

import UIKit

class CalendarViewController: UIViewController, UICalendarViewDelegate {
    
    @IBOutlet weak var mainView: UIView!
    
    @objc func cancelButtonTapped() {
        print("Works!")
        let destinationVC =  self.storyboard?.instantiateViewController(withIdentifier: "Home") as! HomeViewController
        navigationController?.pushViewController(destinationVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calendarView = UICalendarView(frame: CGRect(x: 0, y: 0, width: 400 , height: 400))
        calendarView.delegate = self
        calendarView.calendar = Calendar(identifier: .gregorian)
        calendarView.translatesAutoresizingMaskIntoConstraints = false
        calendarView.wantsDateDecorations = true
        
        self.mainView.addSubview(calendarView)
        
        /// Adding navigation bar
        let navBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 49))
        view.addSubview(navBar)

        let navItem = UINavigationItem(title: "Calendar")
        let cancelItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: #selector(cancelButtonTapped))
        navItem.leftBarButtonItem = cancelItem

        navBar.setItems([navItem], animated: false)
    }
}

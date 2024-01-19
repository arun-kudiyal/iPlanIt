//
//  AddTaskViewController.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 18/01/24.
//

import UIKit

class AddTaskViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var suggestionsTableView: UITableView!
    @IBOutlet weak var emojiLabel: UILabel!
   
    /// Suggestions State
    var suggestions: [Task] = [
        Task(title: "Groceries", time: Date(timeIntervalSinceReferenceDate: 6), emoji: "🛒", isCompleted: false, color: "cyan"),
        Task(title: "Salon", time: Date(timeIntervalSinceReferenceDate: 6), emoji: "💇‍♀️", isCompleted: false, color: "blue"),
        Task(title: "Meeting", time: Date(timeIntervalSinceReferenceDate: 6), emoji: "💻", isCompleted: false, color: "red"),
        Task(title: "Soccer Parctice", time: Date(timeIntervalSinceReferenceDate: 6), emoji: "⚽️", isCompleted: false, color: "pink"),
        Task(title: "Meet a Friend", time: Date(timeIntervalSinceReferenceDate: 6), emoji: "☕️", isCompleted: false, color: "gray")
    ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        suggestions.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AddTaskCell", for: indexPath) as! AddTaskTableViewCell
        let suggestion = suggestions[indexPath.row]
        
        cell.update(with: suggestion)
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        suggestionsTableView.delegate = self
        suggestionsTableView.dataSource = self
        
        /// Adding cornerRadius to the emoji & label
        emojiLabel.layer.masksToBounds = true
        emojiLabel.layer.cornerRadius = 10.0
        
        /// Adding padding to Emoji Label
        emojiLabel.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

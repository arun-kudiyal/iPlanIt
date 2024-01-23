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
    @IBOutlet weak var plannedTaskLabel: UITextField!
    
    /// Suggestions State
    var suggestions: [Suggestion] = [
        Suggestion(id: 1, title: "Groceries", emoji: "🛒", color: "cyan"),
        Suggestion(id: 2, title: "Salon", emoji: "💇‍♀️", color: "blue"),
        Suggestion(id: 3, title: "Meeting", emoji: "💻", color: "red"),
        Suggestion(id: 4, title: "Soccer Parctice", emoji: "⚽️", color: "pink"),
        Suggestion(id: 5, title: "Meet a Friend", emoji: "☕️", color: "gray")
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    /// Passing Task data to segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is UINavigationController {
            
        }
        /* if let destinationVC = segue.destination as? UINavigationController {
            print(destinationVC)
        } else {
            print("Destination is - \(segue.destination)")
            // print("Does not work...")
        } */
    }
    
    /// Unwind Segue
    @IBAction func unwindToAddTask(segue: UIStoryboardSegue) {}
    
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

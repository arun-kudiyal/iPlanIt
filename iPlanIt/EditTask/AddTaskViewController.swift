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
    var suggestions: [Suggestion] = suggestionDataModel.getAllSuggestions()
    
    
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
        tableView.cellForRow(at: indexPath)?.selectionStyle = .none
        let suggestion = suggestions[indexPath.row]
        let destinationVC =  self.storyboard?.instantiateViewController(withIdentifier: "Edit Task") as! EditTaskViewController
        destinationVC.taskName = suggestion.title
        destinationVC.taskEmoji = suggestion.emoji
        destinationVC.taskColor = suggestion.color
        tableView.cellForRow(at: indexPath)?.selectionStyle = .none
        
        navigationController?.present(destinationVC, animated: true)
        navigationController?.modalPresentationStyle = .fullScreen
        navigationController?.modalTransitionStyle = .crossDissolve
    }
    
    /* func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    } */
    
    /// Passing Task data to segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    /// Unwind Segue
    @IBAction func unwindToAddTask(segue: UIStoryboardSegue) {}
    
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        suggestionsTableView?.delegate = self
        suggestionsTableView?.dataSource = self
        
        /// Adding cornerRadius to the emoji & label
        emojiLabel?.layer.masksToBounds = true
        emojiLabel?.layer.cornerRadius = 10.0
        
        /// Adding padding to Emoji Label
        emojiLabel?.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

//
//  TasksTableViewController.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 12/01/24.
//

import UIKit

class TasksTableViewController: UITableViewController {
    /// Demo Tasks
    var tasks = [
        Task(title: "Task - 1", time: Date(timeIntervalSinceReferenceDate: 1), emoji: "🏋️", isCompleted: true, color: .yellow),
        Task(title: "Task - 2", time: Date(timeIntervalSinceReferenceDate: 3), emoji: "🍔", isCompleted: true, color: .blue),
        Task(title: "Task - 3", time: Date(timeIntervalSinceReferenceDate: 5), emoji: "🛍️", isCompleted: false, color: .green)
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskCell", for: indexPath) as! TaskTableViewCell
        let task = tasks[indexPath.row]
        
        if(task.isCompleted == true) { cell.accessoryType = .none }
        
        // var content = cell.defaultContentConfiguration()
        // content.text = task.title
        // content.text = task.time.ISO8601Format()
        // content.secondaryText = task.isCompleted ? "✅" : "❌"
        // cell.contentConfiguration = content
        
        cell.update(with: task)
        cell.showsReorderControl = true

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//
//  TaskListViewController.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 19/01/24.
//

import UIKit

class TaskListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var taskSegmentControl: UISegmentedControl!
    @IBOutlet weak var taskTableView: UITableView!
    
    /// Demo Tasks
    var tasks = taskDataModel.getAllTasks()
    
    var completedTasks: [Task] = []
    var pendingTaks: [Task] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.completedTasks = tasks.filter({$0.isCompleted})
        self.pendingTaks = tasks.filter({!$0.isCompleted})
        
        taskSegmentControl.selectedSegmentIndex = 0
        
        taskTableView.delegate = self
        taskTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        taskTableView.reloadData()
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch taskSegmentControl.selectedSegmentIndex {
        case 0: return self.tasks.count
        case 1: return self.completedTasks.count
        case 2: return self.pendingTaks.count
        default: return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch taskSegmentControl.selectedSegmentIndex {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "AllTaskCell", for: indexPath) as! AllTaskTableViewCell
            let task = tasks[indexPath.row]
            
            if(task.isCompleted == true) { cell.accessoryType = .none }
            else { cell.accessoryType = .disclosureIndicator }
            
            cell.update(with: task)
            cell.showsReorderControl = true

            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "CompletedTaskCell", for: indexPath) as! CompletedTaskTableViewCell
            
            let task = completedTasks[indexPath.row]
            cell.accessoryType = .none
            
            cell.update(with: task)
            cell.showsReorderControl = true

            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "PendingTaskCell", for: indexPath) as! PendingTaskTableViewCell
            
            let task = pendingTaks[indexPath.row]
            
            cell.update(with: task)
            cell.showsReorderControl = true

            return cell
            
        default: return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.cellForRow(at: indexPath)?.selectionStyle = .none
        let selectedTask = tasks[indexPath.row]
        if(!selectedTask.isCompleted) {
            let destinationVC =  self.storyboard?.instantiateViewController(withIdentifier: "Edit Task") as! EditTaskViewController
            destinationVC.taskName = tasks[indexPath.row].title
            destinationVC.taskEmoji = tasks[indexPath.row].emoji
            destinationVC.taskColor = tasks[indexPath.row].color
            tableView.cellForRow(at: indexPath)?.selectionStyle = .none
        
            navigationController?.present(destinationVC, animated: true)
            navigationController?.modalPresentationStyle = .fullScreen
            navigationController?.modalTransitionStyle = .crossDissolve

            // navigationController?.pushViewController(destinationVC, animated: true)
        } else {
            tableView.cellForRow(at: indexPath)?.selectionStyle = .none
        }
    }
    
    @IBAction func segmentedControlSwitched(_ sender: UISegmentedControl) {
        taskTableView.reloadData()
    }
    
    /// Unwind Segue
    @IBAction func unwindToAllTask(segue: UIStoryboardSegue) {}
}

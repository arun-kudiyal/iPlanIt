//
//  AllTaskTableViewCell.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 20/01/24.
//

import UIKit

class AllTaskTableViewCell: UITableViewCell {

    
    @IBOutlet weak var taskEmoji: UILabel!
    @IBOutlet weak var taskName: UILabel!
    @IBOutlet weak var taskTime: UILabel!
    @IBOutlet weak var taskCompleted: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)

        // Configure the view for the selected state
    }
    
    func update(with task: Task) {
        taskEmoji?.text = task.emoji
        taskTime?.text = task.time
        taskName.text = task.title
        taskCompleted?.text = task.isCompleted ? "✅" : ""
        if(task.isCompleted) {
            taskName?.textColor = .gray
        } else {
            taskName?.textColor = .black
        }
    }

}

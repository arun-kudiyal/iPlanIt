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
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with task: Task) {
        taskEmoji.text = task.emoji
        taskName.text = task.title
        taskCompleted.text = task.isCompleted ? "✅" : ""
        taskTime.text = "HH:MM AM/PM"
        /// striking the taskName using extension
        if(task.isCompleted) {
            taskName.attributedText = taskName.text?.strikeThrough()
            taskName.textColor = .gray
        } else { taskCompleted.textColor = .gray }
    }

}

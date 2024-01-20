//
//  PendingTaskTableViewCell.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 20/01/24.
//

import UIKit

class PendingTaskTableViewCell: UITableViewCell {

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
        if(!task.isCompleted) {
            taskEmoji.text = task.emoji
            taskName.text = task.title
            taskCompleted.text = task.isCompleted ? "✅" : "❌"
            taskCompleted.textColor = .gray
            taskTime.text = "HH:MM AM/PM"
        }
    }
}

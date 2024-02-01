//
//  PendingTaskTableViewCell.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 20/01/24.
//

import UIKit

class PendingTaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var taskEmojiLabel: UILabel!
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var taskTimeLabel: UILabel!
    @IBOutlet weak var taskCompleted: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        /// Adding padding to Emoji Label
        taskEmojiLabel?.layoutMargins = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        // taskEmoji.backgroundColor = UIColor(cgColor: chooseColor("green"))
    }
    
    /// Adds a named color
    /* func chooseColor(_ name: String) -> CGColor {
     switch name {
     case "cyan": return UIColor.cyan.cgColor
     case "gray": return UIColor.gray.cgColor
     case "red": return UIColor.red.cgColor
     case "blue": return UIColor.blue.cgColor
     case "brown":return UIColor.brown.cgColor
     case "green": return UIColor.green.cgColor
     case "yellow": return UIColor.yellow.cgColor
     case "pink": return UIColor.systemPink.cgColor
     default : return UIColor.cyan.cgColor
     }
     } */
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)
        
        // Configure the view for the selected state
    }
    
    func update(with task: Task) {
        if(!task.isCompleted) {
            print("object")
            taskEmojiLabel?.text = task.emoji
            taskNameLabel?.text = task.title
            taskCompleted.text = task.isCompleted ? "✅" : ""
            taskCompleted.textColor = .gray
            taskTimeLabel.text = task.time
        }
    }
}

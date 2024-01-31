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
        /// Adding padding to Emoji Label
        taskEmoji.layoutMargins = UIEdgeInsets(top: 25, left: 25, bottom: 25, right: 25)
        // taskEmoji.backgroundColor = UIColor(cgColor: chooseColor("green"))
    }
    
    /// Add a circle on the UILabel
    /* func drawCircle(_ name: String) {
        let size:CGFloat = 55.0
        taskEmoji.textColor = UIColor.white
        taskEmoji.textAlignment = .center
        taskEmoji.font = UIFont.systemFont(ofSize: 30.0)
        taskEmoji.frame = CGRect(x : 100.0,y : 100.0, width : size, height : size)
        taskEmoji.layer.cornerRadius = size / 2
        taskEmoji.layer.borderWidth = 1.0
        taskEmoji.layer.backgroundColor = UIColor.orange.cgColor
        taskEmoji.layer.borderColor = UIColor.orange.cgColor
    } */
    
    /// Adds a named color
    func chooseColor(_ name: String) -> CGColor {
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
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: false)

        // Configure the view for the selected state
    }

    func update(with task: Task) {
        if(!task.isCompleted) {
            // drawCircle("\(task.color)")
            taskEmoji.text = task.emoji
            // taskEmoji.backgroundColor = chooseColor("\(task.color)")
            taskName.text = task.title
            taskCompleted.text = task.isCompleted ? "✅" : ""
            taskCompleted.textColor = .gray
            taskTime.text = "HH:MM AM/PM"
        }
    }
}

//
//  AddTaskTableViewCell.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 18/01/24.
//

import UIKit

class AddTaskTableViewCell: UITableViewCell {
    
    @IBOutlet weak var suggestionEmojiLabel: UILabel!
    @IBOutlet weak var suggestionNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(with task: Task) {
        /// Changes the view of the AddTaskTableView
        suggestionEmojiLabel.text = task.emoji
        suggestionNameLabel.text = task.title
    }

}

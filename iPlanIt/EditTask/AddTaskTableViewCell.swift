//
//  AddTaskTableViewCell.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 18/01/24.
//

import UIKit
protocol YourCellDelegate: AnyObject {
    func didSelectCell(with data: Task)
}
class AddTaskTableViewCell: UITableViewCell {
    
    weak var delegate: YourCellDelegate?
    @IBOutlet weak var suggestionEmojiLabel: UILabel!
    @IBOutlet weak var suggestionNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        /// Adding padding & to Emoji Label
        suggestionEmojiLabel.layoutMargins = UIEdgeInsets(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // var selectedTask: Task = selected.
        
        // delegate?.didSelectCell(with: id)
    }
    
    /// Adding margin to Emoji Label
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func chooseColor(_ name: String) -> UIColor {
        switch name {
            case "cyan": return UIColor.cyan
            case "gray": return UIColor.gray
            case "red": return UIColor.red
            case "blue": return UIColor.blue
            case "brown":return UIColor.brown
            case "green": return UIColor.green
            case "yellow": return UIColor.yellow
            case "pink": return UIColor.systemPink
            default : return UIColor.black
        }
    }
    
    func update(with suggestion: Suggestion) {
        /// Changes the view of the AddTaskTableView
        suggestionEmojiLabel.text = suggestion.emoji
        suggestionNameLabel.text = suggestion.title
        
        /// Setting the background color of the emojiLabel using extensions
        suggestionEmojiLabel.backgroundColor = chooseColor("\(suggestion.color)")
        
        /// Adding cornerRadius to the emoji
        suggestionEmojiLabel.layer.masksToBounds = true
        suggestionEmojiLabel.layer.cornerRadius = 10.0
    }
}

//
//  AddTaskTableViewCell.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 18/01/24.
//

import UIKit

/// Extension to change the background color of the
extension UIColor {
    public func named(_ name: String) -> UIColor? {
        let allColors: [String: UIColor] = [
            "red": .red,
            "blue": .blue,
            "brown": .brown,
            "green": .green,
            "yellow": .yellow
        ]
        let cleanedName = name.replacingOccurrences(of: " ", with: "").lowercased()
        return allColors[cleanedName]
    }
}

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
    
    /// Adding margin to Emoji Label
    override func layoutSubviews() {
        super.layoutSubviews()
        // contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
    }
    
    func chooseColor(_ name: String) -> UIColor {
        switch name {
            case "purple": return UIColor.purple
            case "gray": return UIColor.gray
            case "red": return UIColor.red
            case "blue": return UIColor.blue
            case "brown":return UIColor.brown
            case "green": return UIColor.green
            case "yellow": return UIColor.yellow
            default : return UIColor.black
        }
    }
    
    func update(with task: Task) {
        /// Changes the view of the AddTaskTableView
        suggestionEmojiLabel.text = task.emoji
        suggestionNameLabel.text = task.title
        
        /// Setting the background color of the emojiLabel using extensions
        suggestionEmojiLabel.backgroundColor = chooseColor("\(task.color)")
        
        /// Adding cornerRadius to the emoji
        suggestionEmojiLabel.layer.masksToBounds = true
        suggestionEmojiLabel.layer.cornerRadius = 10.0
        
        /// Adding padding & to Emoji Label
        suggestionEmojiLabel.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}

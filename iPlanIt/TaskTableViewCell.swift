

import UIKit

/// Apply strike font on text
extension String {
  func strikeThrough() -> NSAttributedString {
    let attributeString = NSMutableAttributedString(string: self)
    attributeString.addAttribute(
      NSAttributedString.Key.strikethroughStyle,
      value: 1,
      range: NSRange(location: 0, length: attributeString.length))

      return attributeString
     }
}

class TaskTableViewCell: UITableViewCell {
    /// Label Outlets
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
        /// Configure the view for the selected state
    }
    
    func update(with task: Task) {
        taskEmoji.text = task.emoji
        taskName.text = task.title
        taskCompleted.text = task.isCompleted ? "✅" : "❌"
        /// striking the taskName using extension
        if(task.isCompleted) {
            taskName.attributedText = taskName.text?.strikeThrough()
            taskName.textColor = .gray
        }
        taskCompleted.textColor = .gray
        taskTime.text = "HH:MM AM/PM"
    }
    
    
}

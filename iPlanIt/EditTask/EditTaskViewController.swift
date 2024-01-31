//
//  EditTaskViewController.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 19/01/24.
//

import UIKit

class EditTaskViewController: UIViewController {
    
    @IBOutlet weak var emojiLabel: UILabel!
    @IBOutlet weak var colorWell: UIColorWell!
    @IBOutlet weak var plannedTaskLabel: UITextField!
    
    var taskList: TaskListViewController!
    
    /// Segue Data
    var taskName: String = ""
    var taskEmoji: String = ""
    var taskColor: String = ""
    
    /// Form Outlets
    @IBOutlet weak var taskDate: UIDatePicker!
    @IBOutlet weak var taskTime: UIDatePicker!
    
    @IBOutlet weak var breakStartTime: UIDatePicker!
    @IBOutlet weak var breakEndTime: UIDatePicker!
    @IBOutlet weak var meditationRequired: UISwitch!
    
    /// Helper Function
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
    
    /// ColorTapGestureRecogbizer
    @IBAction func colorImageTapped(_ sender: UITapGestureRecognizer) {
        switch sender.view?.tag {
        case 1: emojiLabel.backgroundColor = .systemBlue
        case 2: emojiLabel.backgroundColor = .systemBrown
        case 3: emojiLabel.backgroundColor = .systemGreen
        case 4: emojiLabel.backgroundColor = .systemMint
        case 5: emojiLabel.backgroundColor = .systemOrange
        case 6: emojiLabel.backgroundColor = .systemPink
        case 7: emojiLabel.backgroundColor = .systemPurple
        case 8: emojiLabel.backgroundColor = .systemRed
        case 9: emojiLabel.backgroundColor = .systemTeal
        case 10: emojiLabel.backgroundColor = .systemYellow
        default: emojiLabel.backgroundColor = .gray
        }
    }
    
    /// EmojiTapGestureRecogbizer
    @IBAction func emojiImageTapped(_ sender: UITapGestureRecognizer) {
        switch sender.view?.tag {
        case 51: emojiLabel.text = "😀"
        case 52: emojiLabel.text = "😃"
        case 53: emojiLabel.text = "😄"
        case 54: emojiLabel.text = "😁"
        case 55: emojiLabel.text = "😆"
        case 56: emojiLabel.text = "🥹"
        case 57: emojiLabel.text = "😅"
        case 58: emojiLabel.text = "😅"
        case 59: emojiLabel.text = "🤣"
        case 60: emojiLabel.text = "🥲"
        case 61: emojiLabel.text = "☺️"
        case 62: emojiLabel.text = "😊"
        case 63: emojiLabel.text = "😇"
        default: emojiLabel.text = "😃"
        }
    }
    
    /// Pick color from Color Well
    func colorWellChanged() {
        self.colorWell?.addTarget(self, action: #selector(colorWellChanged(_:)), for: .valueChanged)
    }
    @objc func colorWellChanged(_ sender: Any) {
        self.emojiLabel.backgroundColor = colorWell.selectedColor
    }
    
    override func viewDidLoad() {
        colorWellChanged()
        
        /// Setting default Value if segue is performed
        emojiLabel?.text = taskEmoji
        emojiLabel?.backgroundColor = chooseColor("\(taskColor)")
        plannedTaskLabel?.text = taskName
    }
    
    @IBAction func doneAction(_ sender: Any) {
        /* print(emojiLabel?.text)
        print(plannedTaskLabel?.text)
        print(taskDate?.date)
        print(taskTime?.timeZone)
        print(meditationRequired?.isOn) */
        
        print("Done Button Tapped!")
        self.dismiss(animated: true, completion: nil)
    }
}

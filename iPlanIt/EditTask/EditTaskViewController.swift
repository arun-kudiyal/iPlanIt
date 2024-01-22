//
//  EditTaskViewController.swift
//  iPlanIt
//
//  Created by Arun Kudiyal on 19/01/24.
//

import UIKit

class EditTaskViewController: UIViewController {
    
    @IBOutlet weak var emojiLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Adding cornerRadius to the emoji & label
        emojiLabel.layer.masksToBounds = true
        emojiLabel.layer.cornerRadius = 10.0
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
}

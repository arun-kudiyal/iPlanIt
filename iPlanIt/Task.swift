import UIKit
enum colour
{
    case red
    case blue
    case purple
    case gray
    case yellow
    case green
}
struct Task {
    var title: String
    var time: Date
    var emoji: String
    var isCompleted: Bool
    var color: colour
    init(title: String, time: Date, emoji: String, isCompleted: Bool, color: colour) {
        self.title = title
        self.time = time
        self.emoji = emoji
        self.isCompleted = isCompleted
        self.color = color
    }
}

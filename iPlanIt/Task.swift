import UIKit

struct Task {
    var title: String
    var time: Date
    var emoji: String
    var isCompleted: Bool
    init(title: String, time: Date, emoji: String, isCompleted: Bool) {
        self.title = title
        self.time = time
        self.emoji = emoji
        self.isCompleted = isCompleted
    }
}

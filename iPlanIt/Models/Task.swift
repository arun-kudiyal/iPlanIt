import UIKit
struct Task {
    var id: Int
    var title: String
    var time: Date
    var emoji: String
    var isCompleted: Bool
    var color: String
    init(id: Int, title: String, time: Date, emoji: String, isCompleted: Bool, color: String) {
        self.id = id
        self.title = title
        self.time = time
        self.emoji = emoji
        self.isCompleted = isCompleted
        self.color = color
    }
}

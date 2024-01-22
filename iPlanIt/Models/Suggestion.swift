import UIKit
struct Suggestion {
    var id: Int
    var title: String
    var emoji: String
    var color: String
    init(id: Int, title: String, emoji: String, color: String) {
        self.id = id
        self.title = title
        self.emoji = emoji
        self.color = color
    }
}

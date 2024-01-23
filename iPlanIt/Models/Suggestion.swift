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
class AppSuggestionDataModel {
    private var suggestions: [Suggestion] = []
    
    init() {
        suggestions.append(Suggestion(id: 1, title: "Groceries", emoji: "🛒", color: "cyan"))
        suggestions.append(Suggestion(id: 2, title: "Salon", emoji: "💇‍♀️", color: "blue"))
        suggestions.append(Suggestion(id: 2, title: "Salon", emoji: "💇‍♀️", color: "blue"))
        suggestions.append(Suggestion(id: 3, title: "Meeting", emoji: "💻", color: "red"))
        suggestions.append(Suggestion(id: 4, title: "Soccer Parctice", emoji: "⚽️", color: "pink"))
        suggestions.append(Suggestion(id: 5, title: "Meet a Friend", emoji: "☕️", color: "gray"))
    }
    
    func getAllSuggestions() -> [Suggestion] { return self.suggestions }
    
    func addSuggestion(suggestion: Suggestion) { self.suggestions.append(suggestion) }
}

var suggestionDataModel = AppSuggestionDataModel()

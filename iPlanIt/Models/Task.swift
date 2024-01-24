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

class AppTaskDataModel {
    private var tasks: [Task] = []
    /// Sample Task Data
    init() {
        tasks.append(Task(id:1, title: "Salon", time: Date(timeIntervalSinceReferenceDate: 1), emoji: "💇‍♀️", isCompleted: true, color: "yellow"))
        tasks.append(Task(id:2, title: "Groceries", time: Date(timeIntervalSinceReferenceDate: 3), emoji: "🛒", isCompleted: false, color: "blue"))
        tasks.append(Task(id:3, title: "Coffee Meeting", time: Date(timeIntervalSinceReferenceDate: 5), emoji: "☕️", isCompleted: false, color: "green"))
        tasks.append(Task(id: 4, title: "Gym", time: Date(timeIntervalSinceReferenceDate: 1), emoji: "🏋️", isCompleted: true, color: "yellow"))
        tasks.append(Task(id: 5, title: "Lunch", time: Date(timeIntervalSinceReferenceDate: 3), emoji: "🍔", isCompleted: false, color: "blue"))
        tasks.append(Task(id: 6, title: "Watch Movie", time: Date(timeIntervalSinceReferenceDate: 3), emoji: "🎬", isCompleted: true, color: "blue"))
        tasks.append(Task(id: 7, title: "Soccer Practice", time: Date(timeIntervalSinceReferenceDate: 5), emoji: "⚽️", isCompleted: false, color: "green"))
        tasks.append(Task(id: 8, title: "Lectures", time: Date(timeIntervalSinceReferenceDate: 5), emoji: "💻", isCompleted: false, color: "green"))
        tasks.append(Task(id: 9, title: "Check For Emails", time: Date(timeIntervalSinceReferenceDate: 3), emoji: "📧", isCompleted: true, color: "blue"))
        tasks.append(Task(id: 10, title: "Take Meds", time: Date(timeIntervalSinceReferenceDate: 3), emoji: "💊", isCompleted: false, color: "blue"))
        tasks.append(Task(id: 11, title: "Quick Run", time: Date(timeIntervalSinceReferenceDate: 3), emoji: "🏃", isCompleted: false, color: "blue"))
    }
    
    func getAllTasks() -> [Task] { return self.tasks }
    
    func addTask(task: Task) { self.tasks.append(task) }
    
    func getTaskById(id: Int) -> Task { self.tasks.filter({$0.id == id})[0] }
}

var taskDataModel = AppTaskDataModel()

import Foundation

struct Note: Identifiable {
    var id = UUID()
    var subject: String
    var title: String
    var content: String  // New field for note content
    var date: Date
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: date)
    }
}

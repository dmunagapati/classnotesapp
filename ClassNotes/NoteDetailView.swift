import SwiftUI

struct NoteDetailView: View {
    var note: Note

    var body: some View {
        ZStack {
            Color(UIColor(red: 0.90, green: 0.87, blue: 0.80, alpha: 1.0))
                .edgesIgnoringSafeArea(.all)
            
            VStack(alignment: .leading, spacing: 20) {
                Text(note.title)
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor(red: 0.34, green: 0.49, blue: 0.34, alpha: 1.0)))
                
                Text("**Subject:** \(note.subject)")
                    .font(.headline)
                    .foregroundColor(Color(UIColor(red: 0.41, green: 0.32, blue: 0.23, alpha: 1.0)))
                
                Text("Date Created: \(note.formattedDate)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Divider()
                
                Text(note.content)  // Display the note content
                    .font(.body)
                    .foregroundColor(Color(UIColor(red: 0.41, green: 0.32, blue: 0.23, alpha: 1.0)))
                    .padding(.top, 10)
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("Note Details", displayMode: .inline)
    }
}

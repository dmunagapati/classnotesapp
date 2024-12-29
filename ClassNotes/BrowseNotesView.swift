import SwiftUI

struct BrowseNotesView: View {
    @Binding var notes: [Note]  // Binding to reflect real-time updates

    var body: some View {
        ZStack {
            Color(UIColor(red: 0.90, green: 0.87, blue: 0.80, alpha: 1.0))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("Browse Notes")
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor(red: 0.34, green: 0.49, blue: 0.34, alpha: 1.0)))
                    .padding(.bottom, 8)
                
                if notes.isEmpty {
                    Text("No notes available.")
                        .foregroundColor(.gray)
                } else {
                    List(notes, id: \.id) { note in
                        NavigationLink(destination: NoteDetailView(note: note)) {
                            VStack(alignment: .leading) {
                                Text(note.title)
                                    .font(.headline)
                                Text(note.subject)
                                    .foregroundColor(.secondary)
                                Text(note.formattedDate)
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("Browse Notes", displayMode: .inline)
    }
}

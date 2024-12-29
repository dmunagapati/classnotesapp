import SwiftUI

struct NoteListView: View {
    var subject: String
    var notes = ["Lecture 1 - 12/10/2024", "Lecture 2 - 12/15/2024"]

    var body: some View {
        ZStack {
            Color(UIColor(red: 0.90, green: 0.87, blue: 0.80, alpha: 1.0))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text(subject)
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor(red: 0.34, green: 0.49, blue: 0.34, alpha: 1.0)))
                    .padding(.bottom, 8)
                
                List(notes, id: \.self) { note in
                    Text(note)
                        .foregroundColor(Color(UIColor(red: 0.41, green: 0.32, blue: 0.23, alpha: 1.0)))
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle(subject, displayMode: .inline)
    }
}

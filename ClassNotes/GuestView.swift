import SwiftUI

struct GuestView: View {
    @Binding var notes: [Note]  // Pass notes as a binding to manage them across views
    
    var body: some View {
        ZStack {
            Color(UIColor(red: 0.90, green: 0.87, blue: 0.80, alpha: 1.0))
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text("Welcome, Guest!")
                    .font(.largeTitle)
                    .foregroundColor(Color(UIColor(red: 0.34, green: 0.49, blue: 0.34, alpha: 1.0)))
                    .padding(.bottom, 8)
                
                Text("Explore and create notes freely.")
                    .font(.headline)
                    .foregroundColor(Color(UIColor(red: 0.41, green: 0.32, blue: 0.23, alpha: 1.0)))
                    .padding(.bottom, 32)
                
                NavigationLink(destination: UploadNoteView(notes: $notes)) {  // Pass notes to UploadNoteView
                    Text("Upload a Note")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: 200)
                        .background(Color(UIColor(red: 0.30, green: 0.50, blue: 0.30, alpha: 1.0)))
                        .cornerRadius(12)
                }
                .padding(.bottom, 16)
                
                NavigationLink(destination: BrowseNotesView(notes: $notes)) {  // Pass notes to BrowseNotesView
                    Text("Browse Notes")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: 200)
                        .background(Color(UIColor(red: 0.30, green: 0.40, blue: 0.32, alpha: 1.0)))
                        .cornerRadius(12)
                }
                
                Spacer()
            }
            .padding()
        }
        .navigationBarTitle("Guest Mode", displayMode: .inline)
    }
}

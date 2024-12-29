import SwiftUI

struct UploadNoteView: View {
    @State private var subject = ""
    @State private var title = ""
    @State private var noteContent = ""
    @State private var isNoteSaved = false
    
    @Binding var notes: [Note]

    var body: some View {
        ZStack {
            // Background color for the entire screen
            Color(UIColor(red: 0.90, green: 0.87, blue: 0.80, alpha: 1.0))
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // New Note Header
                    Text("New Note")
                        .font(.largeTitle)
                        .foregroundColor(Color(UIColor(red: 0.34, green: 0.49, blue: 0.34, alpha: 1.0)))
                    
                    // Subject Section
                    Text("Subject:")
                        .font(.headline)
                    
                    TextField("Enter subject", text: $subject)
                        .padding()
                        .background(Color(UIColor(red: 0.95, green: 0.93, blue: 0.88, alpha: 1.0)))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(UIColor(red: 0.75, green: 0.65, blue: 0.55, alpha: 1.0)), lineWidth: 1)
                        )
                    
                    // Title Section
                    Text("Title:")
                        .font(.headline)
                    
                    TextField("Enter title", text: $title)
                        .padding()
                        .background(Color(UIColor(red: 0.95, green: 0.93, blue: 0.88, alpha: 1.0)))
                        .cornerRadius(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color(UIColor(red: 0.75, green: 0.65, blue: 0.55, alpha: 1.0)), lineWidth: 1)
                        )
                    
                    // Note Content Section
                    Text("Note Content:")
                        .font(.headline)
                    
                    ZStack(alignment: .topLeading) {
                        // Background Layer to Match TextField
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color(UIColor(red: 0.95, green: 0.93, blue: 0.88, alpha: 1.0)))  // Same as TextField background
                            .frame(height: 200)  // Ensure full height coverage
                        
                        // TextEditor with Transparent Background
                        TextEditor(text: $noteContent)
                            .padding(8)
                            .opacity(0.9)  // Slight transparency to avoid harsh white
                            .scrollContentBackground(.hidden)
                            .background(Color.clear)  // Force transparency
                        
                        // Placeholder Text
                        if noteContent.isEmpty {
                            Text("Start typing...")
                                .foregroundColor(.gray)
                                .scrollContentBackground(.hidden)
                                .padding(.top, 16)
                                .padding(.leading, 12)
                        }
                    }
                    .frame(height: 200)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color(UIColor(red: 0.75, green: 0.65, blue: 0.55, alpha: 1.0)), lineWidth: 1)
                    )


                    
                    // Upload and Scan Buttons
                    HStack(spacing: 20) {
                        Button(action: uploadFile) {
                            Text("Upload PDF")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(UIColor(red: 0.30, green: 0.50, blue: 0.30, alpha: 1.0)))
                                .cornerRadius(12)
                        }
                        
                        Button(action: scanDocument) {
                            Text("Scan Document")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color(UIColor(red: 0.30, green: 0.50, blue: 0.30, alpha: 1.0)))
                                .cornerRadius(12)
                        }
                    }
                    
                    // Save Button (Centered)
                    HStack {
                        Spacer()
                        Button(action: saveNote) {
                            Text("Save Note")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: 200)
                                .background(Color(UIColor(red: 0.25, green: 0.40, blue: 0.25, alpha: 1.0)))
                                .cornerRadius(12)
                        }
                        Spacer()
                    }
                    .padding(.top, 16)
                    
                    // Confirmation Message
                    if isNoteSaved {
                        Text("Note saved successfully!")
                            .foregroundColor(Color(UIColor(red: 0.34, green: 0.49, blue: 0.34, alpha: 1.0)))
                            .font(.headline)
                            .padding(.top, 8)
                    }
                }
                .padding()
            }
        }
        .navigationBarTitle("Upload Note", displayMode: .inline)
    }
    
    // Save Note Action
    private func saveNote() {
        let newNote = Note(subject: subject, title: title, content: noteContent, date: Date())
        notes.append(newNote)
        
        subject = ""
        title = ""
        noteContent = ""
        isNoteSaved = true
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isNoteSaved = false
        }
    }
    
    // Placeholder Actions for Upload and Scan
    private func uploadFile() {
        print("Upload PDF tapped")
    }
    
    private func scanDocument() {
        print("Scan Document tapped")
    }
}

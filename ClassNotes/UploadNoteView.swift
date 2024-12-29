import SwiftUI

struct UploadNoteView: View {
    @State private var subject = ""
    @State private var title = ""
    @State private var noteContent = ""
    @State private var isNoteSaved = false
    
    @Binding var notes: [Note]

    var body: some View {
        ZStack {
            Color(UIColor(red: 0.90, green: 0.87, blue: 0.80, alpha: 1.0))  // Background
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("New Note")
                        .font(.largeTitle)
                        .foregroundColor(Color(UIColor(red: 0.34, green: 0.49, blue: 0.34, alpha: 1.0)))
                    
                    Text("Subject:")
                        .font(.headline)
                    
                    // Styled Subject Text Field
                    TextField("Enter subject", text: $subject)
                        .padding()
                        .background(Color(UIColor(red: 0.95, green: 0.93, blue: 0.88, alpha: 1.0)))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(UIColor(red: 0.75, green: 0.65, blue: 0.55, alpha: 1.0)), lineWidth: 1))
                    
                    Text("Title:")
                        .font(.headline)
                    
                    // Styled Title Text Field
                    TextField("Enter title", text: $title)
                        .padding()
                        .background(Color(UIColor(red: 0.95, green: 0.93, blue: 0.88, alpha: 1.0)))
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(UIColor(red: 0.75, green: 0.65, blue: 0.55, alpha: 1.0)), lineWidth: 1))
                    
                    Text("Note Content:")
                        .font(.headline)
                    
                    // Styled Note Content TextEditor
                    ZStack(alignment: .topLeading) {
                        TextEditor(text: $noteContent)
                            .padding(8)
                            .background(Color(UIColor(red: 0.95, green: 0.93, blue: 0.88, alpha: 1.0)))  // Matching cream color
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(UIColor(red: 0.75, green: 0.65, blue: 0.55, alpha: 1.0)), lineWidth: 1))
                        
                        // Placeholder text for TextEditor
                        if noteContent.isEmpty {
                            Text("Start typing...")
                                .foregroundColor(.gray)
                                .padding(.top, 16)
                                .padding(.leading, 12)
                        }
                    }
                    .frame(height: 200)
                    
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
    
    private func uploadFile() {
        print("Upload PDF tapped")
    }
    
    private func scanDocument() {
        print("Scan Document tapped")
    }
}

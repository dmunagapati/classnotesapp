import SwiftUI

struct HomeView: View {
    @State private var notes: [Note] = []  // Notes stored at the top level to persist between views
    var body: some View {
        NavigationView {
            ZStack {
                // Background spans the entire screen
                Color(UIColor(red: 0.90, green: 0.87, blue: 0.80, alpha: 1.0))
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    Spacer()
                    
                    Text("Class Notes")
                        .font(.largeTitle)
                        .foregroundColor(Color(UIColor(red: 0.34, green: 0.49, blue: 0.34, alpha: 1.0)))
                        .padding(.bottom, 8)
                    
                    Text("read. write. unlock.")
                        .font(.headline)
                        .foregroundColor(Color(UIColor(red: 0.41, green: 0.32, blue: 0.23, alpha: 1.0)))
                        .padding(.bottom, 32)
                    
                    NavigationLink(destination: LoginView()) {
                        Text("Log In")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: 200)
                            .background(Color(UIColor(red: 0.30, green: 0.50, blue: 0.30, alpha: 1.0)))
                            .cornerRadius(12)
                    }
                    .padding(.bottom, 16)
                    
                    NavigationLink(destination: GuestView(notes: $notes)) {
                        Text("Continue as Guest")
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
            .navigationBarHidden(true)
        }
    }
}

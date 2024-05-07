import SwiftUI

struct RegistrationView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isRegistered: Bool = false
    @EnvironmentObject var authModel: AuthenticationModel
    
    var body: some View {
        NavigationStack{
            VStack {
                TextField("Choose a username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                SecureField("Choose a password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Button("Register") {
                    authModel.register(username: username, password: password)
                    isRegistered = true
                    print("Registration successful")
                }
                .padding()
            }
            .navigationTitle("Register")
            .navigationDestination(isPresented: $isRegistered) {
                LoginView() 
            }
        }
    }
}

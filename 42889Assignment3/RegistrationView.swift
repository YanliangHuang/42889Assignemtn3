import SwiftUI

struct RegistrationView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @StateObject var authModel = AuthenticationModel()
    
    var body: some View {
        VStack {
            TextField("Choose a username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Choose a password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button("Register") {
                authModel.register(username: username, password: password)
                print("Registration successful")
            }
            .padding()
        }
        .navigationTitle("Register")
    }
}

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
                    if(authModel.register(username: username, password: password)){
                        isRegistered = true
                        print("Registration successful")
                    }else{
                        print("Registration failed, try another username!")
                    }
                    
                }
                .padding()
            }
            .navigationTitle("Register")
            .navigationDestination(isPresented: $isRegistered) {
                //successful registration navigates to loginview
                LoginView()
            }
        }
    }
}

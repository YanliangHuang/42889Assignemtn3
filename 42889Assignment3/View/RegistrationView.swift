import SwiftUI

// Define a SwiftUI view for user registration
struct RegistrationView: View {
    // State variables to store username, password, and registration status
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isRegistered: Bool = false
    
    // Inject an AuthenticationModel instance from the environment
    @EnvironmentObject var authModel: AuthenticationModel
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack { // Use NavigationStack instead of NavigationView
            VStack {
                // Title for the registration view
                Text("Register Account")
                    .font(.title)
                    .bold()
                
                // Text field for entering username
                TextField("Input User Name", text: $username)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(.systemGray6))
                    )
                    .padding(.horizontal)
                
                // Secure text field for entering password
                SecureField("Input Password", text: $password)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(.systemGray6))
                    )
                    .padding(.horizontal)
                
                // Button to initiate the registration process
                Button(action: {
                    // Call the register method of the AuthenticationModel
                    if authModel.register(username: username, password: password) {
                        // Set registration status to true
                        isRegistered = true
                        // Print a message indicating successful registration
                        print("Registration successful")
                        presentationMode.wrappedValue.dismiss()
                    } else {
                        print("Registration fail")
                    }
                }) {
                    // Styling for the registration button
                    Text("Register")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
            }
            
        }
    }
}
#Preview {
    RegistrationView()
        .environmentObject(AuthenticationModel(dataProvider: DataProvider())) // Provide a mock AuthenticationModel
}


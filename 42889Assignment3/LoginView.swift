import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn = false // Control login status
    @EnvironmentObject var authModel: AuthenticationModel
    @EnvironmentObject var dataProvider: DataProvider
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Login Account")
                    .font(.title)
                    .bold()
                
                TextField("User Name", text: $username)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(.systemGray6))
                    )
                    .padding(.horizontal)
                
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(.systemGray6))
                    )
                    .padding(.horizontal)
                
                Button(action: {
                    if authModel.authenticate(username: username, password: password) {
                        print("Login successful")
                        isLoggedIn = true // Change boolean to true for navigation
                    } else {
                        print("Login failed")
                    }
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                NavigationLink(destination: RegistrationView().environmentObject(authModel)) {
                    Text("Register")
                        .foregroundColor(.blue)
                        .padding()
                }
                .padding(.horizontal)
                
            }
            .navigationBarTitleDisplayMode(.inline)
        }
        .navigationViewStyle(StackNavigationViewStyle()) // For better adaptability
        .fullScreenCover(isPresented: $isLoggedIn) {
            HomeView(username: username).environmentObject(dataProvider) // Successful login will navigate to HomeView
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthenticationModel(dataProvider: DataProvider())) // Provide a mock AuthenticationModel
}

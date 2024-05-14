import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
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
                
                Spacer().frame(height: 10)
                
                Button(action: {
                    if authModel.authenticate(username: username, password: password) {
                        print("Login successful")
                        dataProvider.isLogin = true
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
        
    }
}

#Preview {
    LoginView()
        .environmentObject(AuthenticationModel(dataProvider: DataProvider())) // Provide a mock AuthenticationModel
}

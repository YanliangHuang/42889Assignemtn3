import SwiftUI

struct RegistrationView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isRegistered: Bool = false
    @EnvironmentObject var authModel: AuthenticationModel
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Register Account")
                    .font(.title)
                    .bold()
                
                TextField("Input User Name", text: $username)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(.systemGray6))
                    )
                    .padding(.horizontal)
                
            
                SecureField("Input User Name", text: $password)
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(Color(.systemGray6))
                    )
                    .padding(.horizontal)
                
                Button(action: {
                    authModel.register(username: username, password: password)
                    isRegistered = true
                    print("Registration successful")
                }) {
                    Text("Register")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal)
                }
                
                
            }
            .navigationDestination(isPresented: $isRegistered) {
                //successful registration navigates to loginview
                LoginView()
            }
        }
    }
}
#Preview {
    RegistrationView()
        .environmentObject(AuthenticationModel(dataProvider: DataProvider())) // Provide a mock AuthenticationModel
}

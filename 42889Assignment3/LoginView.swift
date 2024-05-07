import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn = false // control login status
    @StateObject var authModel = AuthenticationModel()
    @StateObject var dataProvider = DataProvider()
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Username", text: $username)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                SecureField("Password", text: $password)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Login") {
                    if authModel.authenticate(username: username, password: password) {
                        print("Login successful")
                        isLoggedIn = true 
                    } else {
                        print("Login failed")
                    }
                }
                .padding()
                
                NavigationLink("Register", destination: RegistrationView())
                    .padding()
                .navigationDestination(isPresented: $isLoggedIn) {
                    SelectCinemaView().environmentObject(dataProvider)
                }
            }
            .navigationTitle("Login")
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let authModel = AuthenticationModel()
        authModel.register(username: "testuser", password: "testpass")

        return LoginView()
            .environmentObject(authModel)
    }
}

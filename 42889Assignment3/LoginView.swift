import SwiftUI

struct LoginView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isLoggedIn = false // 控制导航状态
    @StateObject var authModel = AuthenticationModel()
    @StateObject var dataProvider = DataProvider()
    
    var body: some View {
        NavigationStack {  // 使用 NavigationStack 替代 NavigationView
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
                        isLoggedIn = true // 设置为 true，触发导航
                    } else {
                        print("Login failed")
                    }
                }
                .padding()
                
                NavigationLink("Register", destination: RegistrationView())
                    .padding()
                
                // 这个 navigationDestination 必须在 NavigationStack 中使用
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

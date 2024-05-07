import Foundation

class AuthenticationModel: ObservableObject {
    // Simple in-memory database for demonstration
    @Published var users: [User] = []

    struct User {
        var username: String
        var password: String
    }
    
    init() {
        register(username: "123", password: "123")
        register(username: "testUser", password: "test123")
    }

    func authenticate(username: String, password: String) -> Bool {
        return users.contains { $0.username == username && $0.password == password }
    }

    func register(username: String, password: String) {
        let newUser = User(username: username, password: password)
        users.append(newUser)
    }
}

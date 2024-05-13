
import Foundation

struct User {
    var id: String = ""
    var username: String
    var password: String

    var dict: [String: Any] {
        return [
            "username": username,
            "password": password,
        ]
    }

    init(username: String, password: String) {
        self.username = username
        self.password = password
    }

    init(id: String, dict: [String: Any]) {
        self.id = id
        self.username = dict["username"] as? String ?? ""
        self.password = dict["password"] as? String ?? ""
    }
}

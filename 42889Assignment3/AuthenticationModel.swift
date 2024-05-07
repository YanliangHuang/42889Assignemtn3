import Foundation

class AuthenticationModel: ObservableObject {
    var dataProvider:DataProvider
    
    init(dataProvider: DataProvider) {
        self.dataProvider = dataProvider
    }

    func register(username: String, password: String) {
        dataProvider.registerUser(username: username, password: password)
    }

    func authenticate(username: String, password: String) -> Bool {
        return dataProvider.authenticateUser(username: username, password: password)
    }
}

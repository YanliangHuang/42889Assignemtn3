import Foundation

class AuthenticationModel: ObservableObject {
    var dataProvider:DataProvider
    
    init(dataProvider: DataProvider) {
        //connect to database
        self.dataProvider = dataProvider
    }

    func register(username: String, password: String)->Bool {
     //   if(username.count>=5 && password.count>=5){
            if(dataProvider.registerUser(username: username, password: password)){
                return true
            }
      //  }
        return false
    }

    func authenticate(username: String, password: String) -> Bool {
        return dataProvider.authenticateUser(username: username, password: password)
    }
}

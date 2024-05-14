
@_exported import Firebase
import FirebaseAppCheck
import SwiftUI

@main
struct MainApp: App {
    @StateObject var dataProvider = DataProvider()
    @StateObject var authModel: AuthenticationModel

    init() {
        let providerFactory = AppCheckDebugProviderFactory()
        AppCheck.setAppCheckProviderFactory(providerFactory)
        FirebaseConfiguration.shared.setLoggerLevel(.min)
        FirebaseApp.configure()

        let dataProvider = DataProvider()
        let authModel = AuthenticationModel(dataProvider: dataProvider)

        _dataProvider = StateObject(wrappedValue: dataProvider)
        _authModel = StateObject(wrappedValue: authModel)
    }

    var body: some Scene {
        WindowGroup {
            if dataProvider.isLogin {
                HomeView().environmentObject(dataProvider)
            } else {
                LoginView().environmentObject(authModel).environmentObject(dataProvider)
            }
            
        }
    }
}

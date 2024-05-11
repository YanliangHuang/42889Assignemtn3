import Supabase
import SwiftUI

@main
struct _2889Assignment3App: App {
    @StateObject var dataProvider = DataProvider()
    @StateObject var authModel: AuthenticationModel

    let client: SupabaseClient

    init() {
        let dataProvider = DataProvider()
        let authModel = AuthenticationModel(dataProvider: dataProvider)

        _dataProvider = StateObject(wrappedValue: dataProvider)
        _authModel = StateObject(wrappedValue: authModel)

        // initialize supabase client
        self.client = SupabaseClient(
            supabaseURL: URL(string: "https://yzonusubkjiizrlpxnxv.supabase.co")!,
            supabaseKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inl6b251c3Via2ppaXpybHB4bnh2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTQ4OTgzNzEsImV4cCI6MjAzMDQ3NDM3MX0.2yqgOtQRRTylyiq2ROOs46Gf5f2kzUGh6YBsdCK_G1Y"
        )
    }

    var body: some Scene {
        WindowGroup {
            LoginView().environmentObject(authModel).environmentObject(dataProvider)
        }
    }
}

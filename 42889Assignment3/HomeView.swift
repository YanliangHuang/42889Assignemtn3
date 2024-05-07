import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authModel: AuthenticationModel
    @EnvironmentObject var dataProvider:DataProvider
    var username: String

    var body: some View {
        NavigationView {
            VStack {
                NavigationLink("Book History", destination: BookingHistoryView(username: username))
                NavigationLink("Log Out", destination:LoginView().environmentObject(dataProvider)).environmentObject(authModel)
                NavigationLink("Book a movie", destination:SelectCinemaView(username: username).environmentObject(dataProvider))
            }
            .navigationTitle("Home")
        }
    }
}

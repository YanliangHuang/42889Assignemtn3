import SwiftUI

struct HomeView: View {
    @EnvironmentObject var authModel: AuthenticationModel
    @EnvironmentObject var dataProvider:DataProvider
    var username: String

    var body: some View {
        NavigationView {
            VStack {
                //show book history of specific user
                NavigationLink("Book History", destination: BookingHistoryView(username: username))
                //log out to loginview
                NavigationLink("Log Out", destination:LoginView().environmentObject(dataProvider)).environmentObject(authModel)
                //navigate to SelectCinemaView
                NavigationLink("Book a movie", destination:SelectCinemaView(username: username).environmentObject(dataProvider))
            }
            .navigationTitle("Home")
        }
    }
}

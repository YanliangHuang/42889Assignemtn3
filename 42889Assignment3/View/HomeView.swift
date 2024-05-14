import SwiftUI

struct HomeView: View {
    // Inject AuthenticationModel and DataProvider instances from the environment
    @EnvironmentObject var authModel: AuthenticationModel
    @EnvironmentObject var dataProvider: DataProvider
    //var username: String
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) { // Add spacing between elements
                HStack(spacing: 20) {
                    // Show book history with icon
                    NavigationLink(destination: BookingHistoryView(username: dataProvider.username)) {
                        HStack {
                            Image(systemName: "book")
                            Text("Book History")
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.blue).opacity(0.9))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                    
                    // Book a movie with icon
                    NavigationLink(destination: SelectCinemaView(username: dataProvider.username).environmentObject(dataProvider)) {
                        HStack {
                            Image(systemName: "ticket")
                            Text("Book a Movie")
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.green).opacity(0.9))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    }
                
                }
                
                // Log out with icon
                Button(action: {
                    
                    dataProvider.isLogin = false
                    dataProvider.username = ""
                }) {
                    HStack {
                        Image(systemName: "person.crop.circle.badge.xmark")
                        Text("Log Out")
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(Color.red).opacity(0.9))
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }

               
                
                Spacer() // Add spacer to push content to the top
            }
            .padding() // Add padding to the VStack
            .navigationTitle("Home")
        }
    }
}

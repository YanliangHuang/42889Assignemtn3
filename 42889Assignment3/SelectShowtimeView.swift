import SwiftUI

struct SelectShowtimeView: View {
    @EnvironmentObject var dataProvider: DataProvider
    var movie: Movie
    var username:String
    var cinemaName:String
    
    var body: some View {
        //user select showtime for specific movie in this view
       
        List {
            ForEach(dataProvider.showtimes) { showtime in
                NavigationLink(destination: BookView(showtime: showtime, movie: movie, cinemaName: cinemaName, username: username).environmentObject(dataProvider)) {
                    HStack {
                        Image(systemName: "clock") // Add clock icon
                            .foregroundColor(.blue) // Customize icon color if needed
                        VStack(alignment: .leading) {
                            Text("Screen \(showtime.screenID)")
                                .foregroundColor(.primary) // Customize text color if needed
                            Text("Starts: \(formatDate(showtime.startTime))")
                                .foregroundColor(.primary) // Customize text color if needed
                            Text("Ends: \(formatDate(showtime.endTime))")
                                .foregroundColor(.primary) // Customize text color if needed
                        }
                    }
                }
            }
        }
        .navigationTitle("Select time")

        
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

import SwiftUI

struct SelectShowtimeView: View {
    @EnvironmentObject var dataProvider: DataProvider
    var movie: Movie
    var username:String
    var cinemaName:String
    
    var body: some View {
        //user select showtime for specific movie in this view
        NavigationStack {
            List {
                ForEach(dataProvider.showtimes) { showtime in
                    NavigationLink(destination: BookView(showtime: showtime, movie: movie,cinemaName:cinemaName,username:username).environmentObject(dataProvider)) {
                        VStack(alignment: .leading) {
                            Text("Screen \(showtime.screenID)")
                            Text("Starts: \(formatDate(showtime.startTime))")
                            Text("Ends: \(formatDate(showtime.endTime))")
                        }
                    }
                }
            }
            .navigationTitle("Select Showtime")
        }
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

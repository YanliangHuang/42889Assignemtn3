import SwiftUI

struct SelectShowtimeView: View {
    @EnvironmentObject var dataProvider: DataProvider
    var movie: Movie
    var body: some View {
        NavigationStack {
            List {
                ForEach(dataProvider.showtimes.filter { $0.movieID == movie.id }) { showtime in
                    NavigationLink(destination: BookView(showtime: showtime, movie: movie)) {
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



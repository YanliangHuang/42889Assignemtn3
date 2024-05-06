import SwiftUI

struct BookView: View {
    @EnvironmentObject var dataProvider: DataProvider
    var showtime: Showtime
    var movie: Movie

    var body: some View {
        VStack(spacing: 20) {
            Text("Booking for \(movie.title)")
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 10) {
                Text("Director: \(movie.director)")
                Text("Cast: \(movie.cast.joined(separator: ", "))")
                Text("Showtime Details:")
                Text("Screen: \(showtime.screenID)")
                Text("Starts at: \(formatDate(showtime.startTime))")
                Text("Ends at: \(formatDate(showtime.endTime))")
            }
            
            Button("Confirm Booking") {
                dataProvider.bookShowtime(username: "CurrentUser", cinemaName: "SelectedCinema", movieID: movie.id, startDate: showtime.startTime, endDate: showtime.endTime)
                print("Booking confirmed for movie: \(movie.title) at \(formatDate(showtime.startTime))")
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
        }
        .padding()
        .navigationTitle("Confirm Booking")
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

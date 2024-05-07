import SwiftUI

struct BookInfoView: View {
    var username:String
    var movie: Movie
    var bookingDetail: BookingDetail

    var body: some View {
        VStack {
            Text("Booking Successful for \(movie.title)")
            Text("Director: \(movie.director)")
            Text("Cast: \(movie.cast.joined(separator: ", "))")
            Text("Showtime Details:")
            Text("Seat: \(bookingDetail.seat)")
            Text("Starts at: \(bookingDetail.startDate)")
            Text("Ends at: \(bookingDetail.endDate)")

            NavigationLink("Book Another Movie", destination: SelectCinemaView(username: username))
            NavigationLink("Back to home", destination: HomeView(username: username))
        }
        .navigationTitle("Booking Info")
        .navigationBarTitleDisplayMode(.inline)
    }
}

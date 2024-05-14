import SwiftUI

struct BookInfoView: View {
    var username:String
    var movie: Movie
    var bookingDetail: BookingDetail
    @EnvironmentObject var dataProvider: DataProvider
    var body: some View {
        //show the booking information after confirmed.
        VStack {
            Text("Booking Successful for \(movie.title)")
            Text("Director: \(movie.director)")
            Text("Cast: \(movie.cast.joined(separator: ", "))")
            Text("Showtime Details:")
            Text("Seat: \(bookingDetail.seat)")
            Text("Starts at: \(bookingDetail.startDate)")
            Text("Ends at: \(bookingDetail.endDate)")

            NavigationLink("Book Another Movie", destination: SelectCinemaView())
            NavigationLink("Back to home", destination: HomeView())
        }
        .navigationTitle("Booking Info")
        .navigationBarTitleDisplayMode(.inline)
    }
}

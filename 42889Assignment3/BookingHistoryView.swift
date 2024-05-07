import SwiftUI

struct BookingHistoryView: View {
    @EnvironmentObject var dataProvider: DataProvider
    var username: String

    var body: some View {
        //show book history of specific user in this page
        List {
            ForEach(dataProvider.bookings.filter { $0.username == username }) { booking in
                VStack(alignment: .leading) {
                    Text("Movie ID: \(booking.movieID)")
                    Text("Cinema: \(booking.cinemaName)")
                    Text("Seat: \(booking.seat)")
                    Text("Starts: \(booking.startDate)")
                    Text("Ends: \(booking.endDate)")
                }
            }
        }
        .navigationTitle("Booking History")
    }
}

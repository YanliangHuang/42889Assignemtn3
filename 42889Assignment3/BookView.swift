import SwiftUI

struct BookView: View {
    @EnvironmentObject var dataProvider: DataProvider
    var showtime: Showtime
    var movie: Movie
    var cinemaName: String
    var username: String

    @State private var seat: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var bookingConfirmed = false
    @State private var bookingDetail: BookingDetail?
    

    var body: some View {
        Form {
            Section(header: Text("Movie Details")) {
                Text("Booking for \(movie.title)").font(.headline)
                Text("Director: \(movie.director)")
                Text("Cast: \(movie.cast.joined(separator: ", "))")
                Text("Showtime Details:")
                Text("Screen: \(showtime.screenID)")
                Text("Starts at: \(formatDate(showtime.startTime))")
                Text("Ends at: \(formatDate(showtime.endTime))")
            }

            Section(header: Text("Booking Information")) {
                TextField("Seat Number", text: $seat)
                TextField("Email Address", text: $email)
                TextField("Phone Number", text: $phoneNumber)
            }

            Button("Confirm Booking") {
                let booking = BookingDetail(username: username, cinemaName: cinemaName, movieID: movie.id, startDate: showtime.startTime, endDate: showtime.endTime, seat: seat, email: email, phoneNumber: phoneNumber)
                if(!dataProvider.checkIfBookingDuplicate(bookingDetail: booking)){
                    dataProvider.bookShowtime(booking: booking)
                    bookingDetail = booking
                    bookingConfirmed = true
                    print("Booking confirmed for \(movie.title)")
                }else{
                    print("This seat has been taken!")
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            .navigationDestination(isPresented: $bookingConfirmed) {
                if let booking = bookingDetail {
                    BookInfoView(username: username, movie: movie, bookingDetail: booking)
                }
            }
        }
        .navigationTitle("Confirm Booking")
        .navigationBarTitleDisplayMode(.inline)
    }

    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

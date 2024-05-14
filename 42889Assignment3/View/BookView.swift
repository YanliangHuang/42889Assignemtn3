import SwiftUI

struct BookView: View {
    @EnvironmentObject var dataProvider: DataProvider
    var showtime: Showtime
    var movie: Movie
    var cinemaName: String
    
    @State private var seat: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var bookingConfirmed = false
    @State private var bookingDetail: BookingDetail?
    @State private var showAlert = false // Add this line
    
    @Environment(\.presentationMode) var presentationMode // Add this line
    
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
                let booking = BookingDetail(username: dataProvider.username, cinemaName: cinemaName, movieID: movie.id, startDate: showtime.startTime, endDate: showtime.endTime, seat: seat, email: email, phoneNumber: phoneNumber)
                if(!dataProvider.checkIfBookingDuplicate(bookingDetail: booking)){
                    dataProvider.bookShowtime(booking: booking)
                    bookingDetail = booking
                    bookingConfirmed = true
                    showAlert = true // Show the alert after successful booking
                    print("Booking confirmed for \(movie.title)")
                    
                } else {
                    print("This seat has been taken!")
                }
            }
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(8)
            
        }
//        .onAppear(perform: {
//            dataProvider.showSelectCinemaView = false
//        })
        .navigationTitle("Confirm Booking")
        .navigationBarTitleDisplayMode(.inline)
        .alert(isPresented: $showAlert) { // Add this line
            Alert(title: Text("Booking Confirmed"), message: Text("Your booking for \(movie.title) has been confirmed."), dismissButton: .default(Text("OK"), action: {
                dataProvider.showSelectCinemaView = false
            }))
        }
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

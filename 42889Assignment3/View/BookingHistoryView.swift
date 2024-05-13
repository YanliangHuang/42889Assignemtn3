import SwiftUI

struct BookingHistoryView: View {
    @EnvironmentObject var dataProvider: DataProvider
    var username: String
    
    var body: some View {
        List {
            ForEach(dataProvider.bookings.filter { $0.username == username }) { booking in
                VStack(alignment: .leading, spacing: 8) {
                    Text("Movie ID: \(booking.movieID)")
                        .font(.headline)
                        .foregroundColor(.blue)
                    Text("Cinema: \(booking.cinemaName)")
                        .font(.subheadline)
                    Text("Seat: \(booking.seat)")
                        .font(.subheadline)
                    Text("Starts: \(formatDate(booking.startDate))")
                        .font(.subheadline)
                    Text("Ends: \(formatDate(booking.endDate))")
                        .font(.subheadline)
                }
                .padding(.vertical, 8)
            }
        }
        .navigationTitle("Booking History")
    }
    
    private func formatDate(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: date)
    }
}

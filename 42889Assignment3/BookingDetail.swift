import Foundation

struct BookingDetail: Identifiable {
    let id = UUID()
    let username: String
    let cinemaName: String
    let movieID: UUID
    let startDate: Date
    let endDate: Date
}

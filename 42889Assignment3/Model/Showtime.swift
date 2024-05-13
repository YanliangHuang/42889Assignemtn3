
import Foundation

struct Showtime: Identifiable, Hashable {
    let id = UUID()
    let movieID: UUID
    let screenID: Int
    let startTime: Date
    let endTime: Date
    let seat: String
}

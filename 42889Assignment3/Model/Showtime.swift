
import Foundation
import Firebase
import FirebaseDatabaseSwift

struct Showtime: Identifiable {
    var id: String
    let movieID: String
    let screenID: Int
    let startTime: Date
    let endTime: Date
    let seat: String

    init(id: String, dict: [String: Any]) {
        self.id = id
        self.movieID = dict["movieID"] as? String ?? ""
        self.screenID = dict["screenID"] as? Int ?? 0
        if let startTime = (dict["startTime"] as? Timestamp)?.seconds {
            self.startTime = Date(timeIntervalSince1970: TimeInterval(startTime))
        } else {
            self.startTime = Date()
        }

        if let endTime = (dict["endTime"] as? Timestamp)?.seconds {
            self.endTime = Date(timeIntervalSince1970: TimeInterval(endTime))
        } else {
            self.endTime = Date()
        }
        self.seat = dict["seat"] as? String ?? ""
    }
}

import Foundation

struct BookingDetail: Identifiable {
    var id: String
    let username: String
    let cinemaName: String
    let movieID: String
    let startDate: Date
    let endDate: Date
    let seat: String
    let email: String
    let phoneNumber: String

    init(username: String, cinemaName: String, movieID: String, startDate: Date, endDate: Date, seat: String, email: String, phoneNumber: String) {
        self.id = ""
        self.username = username
        self.cinemaName = cinemaName
        self.movieID = movieID
        self.startDate = startDate
        self.endDate = endDate
        self.seat = seat
        self.email = email
        self.phoneNumber = phoneNumber
    }

    var dict: [String: Any] {
        return [
            "username": username,
            "cinemaName": cinemaName,
            "movieID": movieID,
            "startDate": startDate,
            "endDate": endDate,
            "seat": seat,
            "email": email,
            "phoneNumber": phoneNumber,
        ]
    }

    init(id: String, dict: [String: Any]) {
        self.id = id
        self.username = dict["username"] as? String ?? ""
        self.cinemaName = dict["cinemaName"] as? String ?? ""
        self.movieID = dict["movieID"] as? String ?? ""

        if let endDate = (dict["endDate"] as? Timestamp)?.seconds {
            self.endDate = Date(timeIntervalSince1970: TimeInterval(endDate))
        } else {
            self.endDate = Date()
        }

        if let startDate = (dict["startDate"] as? Timestamp)?.seconds {
            self.startDate = Date(timeIntervalSince1970: TimeInterval(startDate))
        } else {
            self.startDate = Date()
        }

        self.seat = dict["seat"] as? String ?? ""
        self.email = dict["email"] as? String ?? ""
        self.phoneNumber = dict["phoneNumber"] as? String ?? ""
    }
}

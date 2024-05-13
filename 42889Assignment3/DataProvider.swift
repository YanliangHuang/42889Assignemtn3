import Firebase
import Foundation

class DataProvider: ObservableObject {
    // sample data only. should connect to database in the future.
    @Published var cinemas: [String] = []
    @Published var cinemaMovies: [String: [Movie]] = [:]
    @Published var showtimes: [Showtime] = []
    @Published var bookings: [BookingDetail] = []
    @Published var users: [User] = []

    init() {
        Task {
            await setupMovies()
            await setupUsers()
            await setupBookings()
        }
    }

    func setupMovies() async {
        guard let snapshot = try? await Firestore.firestore().collection("movie").getDocuments() else {
            return
        }
        var movies: [Movie] = []
        for document in snapshot.documents {
            let movie = Movie(id: document.documentID, dict: document.data())
            movies.append(movie)
        }

        guard let snapshot = try? await Firestore.firestore().collection("cinema").getDocuments() else {
            return
        }
        for document in snapshot.documents {
            cinemas.append(document.data()["name"] as? String ?? "")
        }

        cinemas.sort()

        for item in cinemas {
            cinemaMovies[item] = movies.filter { $0.cinemaName == item }
        }
    }

    func setupUsers() async {
        guard let snapshot = try? await Firestore.firestore().collection("user").getDocuments() else {
            return
        }
        for document in snapshot.documents {
            let user = User(id: document.documentID, dict: document.data())
            users.append(user)
        }
    }

    func registerUser(username: String, password: String)->Bool {
        var newUser = User(username: username, password: password)
        if !checkIfUsernameDuplicate(user: newUser) {
            let result = Firestore.firestore().collection("user").addDocument(data: newUser.dict)
            newUser.id = result.documentID
            users.append(newUser)
            return true
        } else {
            return false
        }
    }

    func authenticateUser(username: String, password: String)->Bool {
        // check if user exists
        return users.contains { $0.username == username && $0.password == password }
    }

    func fetchShowtimes(for movie: Movie) async->[Showtime] {
        // retrieve all the showtime of a movie
        var outList: [Showtime] = []

        guard let snapshot = try? await Firestore.firestore().collection("showtime").getDocuments() else {
            return []
        }
        for document in snapshot.documents {
            let showTime = Showtime(id: document.documentID, dict: document.data())
            if showTime.movieID == movie.id {
                outList.append(showTime)
            }
        }
        outList.sort(by: { $0.screenID < $1.screenID })
        return outList
    }

    func datesAreEqualUpToMinute(_ date1: Date, _ date2: Date)->Bool {
        let calendar = Calendar.current
        let components1 = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date1)
        let components2 = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date2)
        return components1 == components2
    }

    func checkIfUsernameDuplicate(user: User)->Bool {
        return users.contains { $0.username == user.username }
    }

    func checkIfBookingDuplicate(bookingDetail: BookingDetail)->Bool {
        for book in bookings {
            if book.seat == bookingDetail.seat && book.cinemaName == bookingDetail.cinemaName && datesAreEqualUpToMinute(book.startDate, bookingDetail.startDate) &&
                datesAreEqualUpToMinute(book.endDate, bookingDetail.endDate)
            {
                return true
            }
        }
        return false
    }

    
    
    func setupBookings() async {
        guard let snapshot = try? await Firestore.firestore().collection("bookingdetail").getDocuments() else {
            return
        }
        for document in snapshot.documents {
            let user = BookingDetail(id: document.documentID, dict: document.data())
            bookings.append(user)
        }
    }

    func bookShowtime(booking: BookingDetail) {
        var booking = booking
        let result = Firestore.firestore().collection("bookingdetail").addDocument(data: booking.dict)
        booking.id = result.documentID
        bookings.append(booking)
    }
}

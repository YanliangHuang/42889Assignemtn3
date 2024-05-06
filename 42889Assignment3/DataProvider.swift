import Foundation

class DataProvider: ObservableObject {
    @Published var cinemas = ["Cinema 1", "Cinema 2", "Cinema 3"]
    @Published var cinemaMovies: [String: [Movie]] = [:]
    @Published var showtimes: [Showtime] = []
    @Published var bookings: [BookingDetail] = []

    init() {
        setupMovies()
        
    }

    func setupMovies() {
        let inception = Movie(title: "Inception", director: "Christopher Nolan", cast: ["Leonardo DiCaprio", "Joseph Gordon-Levitt"], imageUrl: "https://example.com/inception.jpg")
        let darkKnight = Movie(title: "The Dark Knight", director: "Christopher Nolan", cast: ["Christian Bale", "Heath Ledger"], imageUrl: "https://example.com/darkknight.jpg")
        let interstellar = Movie(title: "Interstellar", director: "Christopher Nolan", cast: ["Matthew McConaughey", "Anne Hathaway"], imageUrl: "https://example.com/interstellar.jpg")
        let dunkirk = Movie(title: "Dunkirk", director: "Christopher Nolan", cast: ["Fionn Whitehead", "Tom Hardy"], imageUrl: "https://example.com/dunkirk.jpg")
        
        cinemaMovies["Cinema 1"] = [inception, darkKnight]
        cinemaMovies["Cinema 2"] = [interstellar]
        cinemaMovies["Cinema 3"] = [dunkirk]
    }

    func fetchShowtimes(for movie: Movie) {
        let now = Date()
        showtimes = [
            Showtime(movieID: movie.id, screenID: 1, startTime: now, endTime: now.addingTimeInterval(7200)),
            Showtime(movieID: movie.id, screenID: 2, startTime: now.addingTimeInterval(3600 * 3), endTime: now.addingTimeInterval(3600 * 5))
        ]
    }

    func bookShowtime(username: String, cinemaName: String, movieID: UUID, startDate: Date, endDate: Date) {
        let newBooking = BookingDetail(username: username, cinemaName: cinemaName, movieID: movieID, startDate: startDate, endDate: endDate)
        bookings.append(newBooking)
    }
}

import Foundation

class DataProvider: ObservableObject {
    //sample data only. should connect to database in the future.
    @Published var cinemas = ["Cinema 1", "Cinema 2", "Cinema 3"]
    @Published var cinemaMovies: [String: [Movie]] = [:]
    @Published var showtimes: [Showtime] = []
    @Published var bookings: [BookingDetail] = []
    @Published var users:[User] = []

    init() {
        setupMovies()
        setupUsers()
        
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
    
    func setupUsers(){
        users.append(User(username: "123", password: "123"))
        users.append(User(username: "testUser", password: "test123"))
    }
    
    func registerUser(username: String, password: String)->Bool {
        //should be changed to register users to the database in the future
        //registration users to database
        let newUser = User(username: username, password: password)
        if !checkIfUsernameDuplicate(user: newUser){
            users.append(newUser)
            return true
        }else{
            return false
        }
        
    }

    func authenticateUser(username: String, password: String) -> Bool {
        //check if user exists
        return users.contains { $0.username == username && $0.password == password }
    }

    func fetchShowtimes(for movie: Movie)->[Showtime] {
        //retrieve all the showtime of a movie
        var outList: [Showtime] = []
        let now = Date()
        outList = [
            Showtime(movieID: movie.id, screenID: 1, startTime: now, endTime: now.addingTimeInterval(7200), seat: "12"),
            Showtime(movieID: movie.id, screenID: 2, startTime: now.addingTimeInterval(3600 * 3), endTime: now.addingTimeInterval(3600 * 5), seat: "13")
        ]
        return outList
    }

    
    func checkIfBookingDuplicate(bookingDetail:BookingDetail)->Bool{
        for book in bookings {
            if (book.seat == bookingDetail.seat && book.cinemaName == bookingDetail.cinemaName && datesAreEqualUpToMinute(book.startDate, bookingDetail.startDate) &&
                datesAreEqualUpToMinute(book.endDate, bookingDetail.endDate)){
                return true
            }
        }
        return false
    }
    
    func datesAreEqualUpToMinute(_ date1: Date, _ date2: Date) -> Bool {
        let calendar = Calendar.current
        let components1 = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date1)
        let components2 = calendar.dateComponents([.year, .month, .day, .hour, .minute], from: date2)
        return components1 == components2
    }
    
    func checkIfUsernameDuplicate(user:User)->Bool{
        return users.contains { $0.username == user.username }
    }
    
    func bookShowtime(booking: BookingDetail) {
        //append a booking detail to data
        bookings.append(booking)
    }
    
    func loadUserFromDatabase(){
        
    }
    
    func loadMoviesFromDatabase(){
        
    }
    
    func loadBookingsFromDatabase(){
        
        
    }
    
    func loadShowtimesFromDatabase(){
        
    }
    
}

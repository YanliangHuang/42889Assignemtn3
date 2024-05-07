import SwiftUI

struct SelectMovieView: View {
    @State private var selectedMovie: Movie?
    @EnvironmentObject var dataProvider: DataProvider
    var cinemaName: String
    var username: String
    var movies: [Movie]

    var body: some View {
        NavigationStack {
            List(movies) { movie in
                NavigationLink(destination: SelectShowtimeView(movie: movie,username: username,cinemaName: cinemaName).environmentObject(dataProvider)
                    .onAppear{
                        dataProvider.showtimes = dataProvider.fetchShowtimes(for: movie)
                    }) {
                    VStack(alignment: .leading) {
                        Text(movie.title).font(.headline)
                        Text("Directed by \(movie.director)").font(.subheadline)
                    }
                }
            }
        }
    }
}




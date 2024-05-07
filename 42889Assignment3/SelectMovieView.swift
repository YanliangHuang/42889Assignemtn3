import SwiftUI

struct SelectMovieView: View {
    @State private var selectedMovie: Movie?
    @EnvironmentObject var dataProvider: DataProvider
    var movies: [Movie]

    var body: some View {
        NavigationStack {
            List(movies) { movie in
                NavigationLink(destination: SelectShowtimeView(movie: movie).environmentObject(dataProvider)
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


struct SelectMovieView_Previews: PreviewProvider {
    static var previews: some View {
        SelectMovieView(movies: [
            Movie(title: "Inception", director: "Christopher Nolan", cast: ["Leonardo DiCaprio", "Joseph Gordon-Levitt"], imageUrl: "url_to_image"),
            Movie(title: "Interstellar", director: "Christopher Nolan", cast: ["Matthew McConaughey", "Anne Hathaway"], imageUrl: "url_to_image")
        ])
    }
}

import SwiftUI

struct SelectCinemaView: View {
    @EnvironmentObject var dataProvider: DataProvider
    @State var username: String

    var body: some View {
        NavigationStack {
            Text("Hi \(username)")
            List(dataProvider.cinemas, id: \.self) { cinema in
                NavigationLink(destination: SelectMovieView(cinemaName: cinema, username: username, movies: dataProvider.cinemaMovies[cinema, default: []]).environmentObject(dataProvider)) {
                    Text(cinema)
                }
            }
            .navigationTitle("Select Cinema")
        }
    }
}



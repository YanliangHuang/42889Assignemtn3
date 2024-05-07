import SwiftUI

struct SelectCinemaView: View {
    @EnvironmentObject var dataProvider: DataProvider

    var body: some View {
        NavigationStack {
            List(dataProvider.cinemas, id: \.self) { cinema in
                NavigationLink(destination: SelectMovieView(movies: dataProvider.cinemaMovies[cinema, default: []]).environmentObject(dataProvider)) {
                    Text(cinema)
                }
            }
            .navigationTitle("Select Cinema")
        }
    }
}

struct SelectCinemaView_Previews: PreviewProvider {
    static var previews: some View {
        SelectCinemaView()
    }
}

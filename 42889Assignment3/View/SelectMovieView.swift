import SwiftUI

struct SelectMovieView: View {
    @State private var selectedMovie: Movie?
    @EnvironmentObject var dataProvider: DataProvider
    var cinemaName: String
    var username: String
    var movies: [Movie]

    var body: some View {
        // User selects a movie in this view
        List(movies) { movie in
            NavigationLink(destination: SelectShowtimeView(movie: movie, username: username, cinemaName: cinemaName).environmentObject(dataProvider)
                .onAppear {
                    dataProvider.showtimes = dataProvider.fetchShowtimes(for: movie)
                }) {
                HStack(spacing: 15) { // Horizontal stack with spacing between elements
                    Image(movie.imageUrl)
                        .resizable() // Makes the image resizable
                        .aspectRatio(contentMode: .fill) // Preserves the aspect ratio while filling the frame
                        .frame(width: 100, height: 150) // Sets the frame size for the image
                        .cornerRadius(10) // Rounds the corners of the image
                    
                    VStack(alignment: .leading, spacing: 5) { // Vertical stack for movie information
                        Text(movie.title)
                            .font(.headline) // Sets the font size for the movie title
                            .lineLimit(1) // Limits the number of lines for the title
                            .foregroundColor(.primary) // Sets the text color to the primary color
                        
                        Text("Directed by \(movie.director)")
                            .font(.subheadline) // Sets the font size for director information
                            .foregroundColor(.secondary) // Sets the text color to the secondary color
                            .lineLimit(nil) // Removes the limit on the number of lines for director information

                    }
                }
                .padding(10) // Adds padding around the content
            }
            .buttonStyle(PlainButtonStyle()) // Applies plain button style to the navigation link
        }
        .navigationTitle("Select Movie")
        
      
    }
    
}






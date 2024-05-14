import SwiftUI

struct SelectCinemaView: View {
    @EnvironmentObject var dataProvider: DataProvider // Accesses the data provider from the environment
   
    let columns = [ // Array containing two flexible columns
        GridItem(.flexible()),
        GridItem(.flexible())
    ]

    var body: some View {
      
            VStack { // Vertical stack
                Text("Hello, \(dataProvider.username)!") // Text welcoming the user
                    .font(.title) // Sets the font size
                    .padding() // Adds padding
                
                Spacer() // Automatically adjusts size to fill the space
                
                LazyVGrid(columns: columns, spacing: 20) { // Lazy-loaded vertical grid view
                    ForEach(dataProvider.cinemas.indices, id: \.self) { index in // Iterates over cinema data
                        let cinema = dataProvider.cinemas[index] // Gets the name of the current cinema
                        let colorIndex = index % 3 // Loops through three colors using the modulo operator
                        let colors: [Color] = [.blue, .green, .orange] // Array of colors
                        let color = colors[colorIndex] // Gets the current color based on color index
                        NavigationLink(destination: SelectMovieView(cinemaName: cinema, movies: dataProvider.cinemaMovies[cinema, default: []])) { // Navigation link to select movie view
                            HStack { // Horizontal stack
                                HStack {
                                    Image(systemName: "film")
                                    Text(cinema)
                                } // Text displaying the cinema name
                                    .frame(maxWidth: .infinity) // Sets maximum width for the text frame
                                    .padding() // Adds padding
                                    .background(color) // Sets background color
                                    .clipShape(RoundedRectangle(cornerRadius: 10)) // Clips the background to a rounded rectangle
                                    .foregroundColor(.white) // Sets foreground color to white
                                    .padding()
                            }
                        
                            
                            
                            
                            
                            
                            
                        }
                    }
                }
          Spacer()
                Spacer()
            .navigationTitle("Select Cinema") // Sets the navigation bar title
            .padding() // Adds padding
        }
    }
}

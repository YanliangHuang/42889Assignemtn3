import Foundation


struct Movie: Identifiable {
    var id: String
    let title: String
    let director: String
    let cast: [String]
    let imageUrl: String
    let cinemaName: String

    init(id: String, dict: [String: Any]) {
        self.id = id
        self.title = dict["title"] as? String ?? ""
        self.director = dict["director"] as? String ?? ""
        self.cast = dict["cast"] as? [String] ?? []
        self.imageUrl = dict["imageUrl"] as? String ?? ""
        self.cinemaName = dict["cinemaName"] as? String ?? ""
    }
}

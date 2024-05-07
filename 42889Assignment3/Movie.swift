//
//  Movie.swift
//  42889Assignment3
//
//  Created by Graham Huang on 6/5/2024.
//

import Foundation


struct Movie: Identifiable, Hashable {
    let id: UUID
    let title: String
    let director: String
    let cast: [String]
    let imageUrl: String

    init(title: String, director: String, cast: [String], imageUrl: String) {
        self.id = UUID()  
        self.title = title
        self.director = director
        self.cast = cast
        self.imageUrl = imageUrl
    }
}


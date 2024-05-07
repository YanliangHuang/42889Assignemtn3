//
//  Showtime.swift
//  42889Assignment3
//
//  Created by Graham Huang on 6/5/2024.
//

import Foundation

struct Showtime: Identifiable, Hashable {
    let id = UUID()
    let movieID: UUID
    let screenID: Int
    let startTime: Date
    let endTime: Date
}

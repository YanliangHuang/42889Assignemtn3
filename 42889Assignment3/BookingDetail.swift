//
//  BookingDetail.swift
//  42889Assignment3
//
//  Created by Graham Huang on 6/5/2024.
//

import Foundation

struct BookingDetail: Identifiable {
    let id = UUID()
    let username: String
    let cinemaName: String
    let movieID: UUID
    let startDate: Date
    let endDate: Date
}

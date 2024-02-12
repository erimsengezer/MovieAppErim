//
//  Movies.swift
//  MovieApp
//
//  Created by erimsengezer on 13.02.2024.
//

import Foundation

struct Movies: Decodable {
    let results: [Movie]
}

struct Movie: Decodable {
    let id: Int
    let original_name: String
    let poster_path: String
}

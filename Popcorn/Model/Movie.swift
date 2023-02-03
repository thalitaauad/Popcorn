//
//  Movie.swift
//  Popcorn
//  Created by Thalita Prado Auad on 20/01/23.
//

import Foundation

struct Movie: Codable {
    let imdbID, title, year, poster, genre, director: String!
    let type: TypeEnum

    //colocar variáveis minúsculas
    enum CodingKeys: String, CodingKey {
        case imdbID
        case title = "Title"
        case year = "Year"
        case type = "Type"
        case poster = "Poster"
        case genre = "Genre"
        case director = "Director"
    }
}

// enum para o type, pq ele pode ser "movie" ou "game" na omdb api
enum TypeEnum: String, Codable {
    case movie = "movie"
}

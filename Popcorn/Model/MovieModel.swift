//
//  MovieModel.swift
//  popcorn
//
//  Created by Thalita Prado Auad on 20/01/23.
//

//JSON de retorno API tem uma chave "Search" (array de objetos) e os obj sao os filmes

import Foundation

struct Search: Codable {
    let movies: [Movie]
    let response: String

//pra nomear as variáveis sem letra maiúscula
    enum CodingKeys: String, CodingKey {
        case movies = "Search"
        case response = "Response"
    }
}
//"Search" atribui valor dentro de movies e "Response" atribui em response

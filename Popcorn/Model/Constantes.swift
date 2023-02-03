
//file com as constantes

import UIKit

let endpoint = "https://www.omdbapi.com/?apikey"

class CellID {
    static let MOVIE_CELL = "MovieCell"
    static let NO_MOVIE_CELL = "NoMovieCell"
}

class Size {
    static let MOVIE_CELL_H: CGFloat = 210
}

class Segue {
    static let goToDetails = "GoToDetails"
}

class Alert {
    static let TITLE = "OMDb API"
    static let MESSAGE = "Dados da OMDb API"
    static let CANCEL_ACTION = "Cancelar"
    static let LICENSE_ACTION = "Licença da API"
}

//
//  DetailsViewController.swift
//  Popcorn
//
//  Created by Thalita Prado Auad on 03/02/23.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var generoLabel: UILabel!
    @IBOutlet weak var diretorLabel: UILabel!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    
    func configure(movie: Movie) {
        nameLabel.text = movie.title
        yearLabel.text = movie.year
        generoLabel.text = movie.genre
        diretorLabel.text = movie.director
        posterImageView.load(url: movie.poster ?? "")
        
    }
}

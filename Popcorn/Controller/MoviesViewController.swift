//
//  ViewController.swift
//  Popcorn
//
//  Created by Thalita Prado Auad on 03/02/23.
//

import UIKit
import Alamofire

class MoviesViewController: UIViewController {
    
    var movies = [Movie]()
    
    @IBOutlet weak var tableView: UITableView!
  
    @IBOutlet weak var nameTextField: UITextField!
   
    
    var selectedMovie: Movie?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTableView()
        setTextField()
    }
    
    func searchMovies(named name: String) {
        // requisição da API
        
        let queryStr = formatString(name)
        let fullURL = "https://www.omdbapi.com/?apikey=73553972&s=\(queryStr)&type=movie"
        
        let request = AF.request(fullURL)
        
        request.responseDecodable(of: Search.self) { response in
            switch response.result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.movies = data.movies
                    self.tableView.reloadData()
                }
                
            case .failure(let error):
                print("erro:")
                print(error)
                break
            }
        }
        AF.request(fullURL).validate().responseData { response in
        }
        
        
        
    }
    
    //func que formata titulo dos filmes que tem espaço, %20 padrao para separar palavras do filme
    func formatString(_ string: String) -> String {
        return string.components(separatedBy: " ").joined(separator: "%20")
    }
    
    
  
    @IBAction func searchButtonTouched(_ sender: UIButton) {
        dismissKeyboard()
        guard let text = nameTextField.text,
             text.trimmingCharacters(in: .whitespacesAndNewlines) != "" else { return }
        let name = text.trimmingCharacters(in: .whitespacesAndNewlines)

        
        searchMovies(named: name)
        
    }

    func setTextField() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapGesture.cancelsTouchesInView = false
        self.view.addGestureRecognizer(tapGesture)
        self.nameTextField.delegate = self
    }

    func setTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.tableFooterView = UIView(frame: .zero)
    }

    @objc func dismissKeyboard() {
        nameTextField.resignFirstResponder()
    }



    @IBAction func infoButtonTouched(_ sender: Any) {

        
        let alertController = UIAlertController(title: Alert.TITLE, message: Alert.MESSAGE, preferredStyle: .alert)
        let cancel = UIAlertAction(title: Alert.CANCEL_ACTION, style: .cancel, handler: nil)
        
        let openLicense = UIAlertAction(title: Alert.LICENSE_ACTION, style: .default) { _ in
            if let url = URL(string: "https://www.omdbapi.com/legal.htm") {
                UIApplication.shared.open(url)
            }
        }
        
        alertController.addAction(cancel)
        alertController.addAction(openLicense)
        
        navigationController?.present(alertController, animated: true, completion: nil)
    }
}
///
extension MoviesViewController: UITableViewDelegate {
    //chama outra view
   
    func tableView( _ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let movie = movies[indexPath.row]

        selectedMovie = movie
        
        performSegue(withIdentifier: "GoToDetails", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToDetails" {
            let movieDetailVC = segue.destination as! DetailsViewController
            movieDetailVC.configure(movie: selectedMovie!)
        }
    }
}

extension MoviesViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count > 0 ? movies.count : 1
    }
    //verifica se está vazio
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if movies.isEmpty {
            return tableView.dequeueReusableCell(withIdentifier: CellID.NO_MOVIE_CELL) as! NoMovieTableViewCell
        }
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: CellID.MOVIE_CELL) as? MovieTableViewCell {
            let movie = movies[indexPath.row]
            cell.nameLabel.text = movie.title
            cell.yearLabel.text = movie.year
            cell.posterImageView.load(url: movie.poster  ?? "")
            
            return cell
        }
        
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height * 0.7
    }
}


extension MoviesViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchButtonTouched(UIButton())
        return false
    }
    
}



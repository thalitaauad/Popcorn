
import Foundation
import UIKit

class NoMovieTableViewCell: UITableViewCell {
    
    @IBOutlet weak var warningLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.isUserInteractionEnabled = false
        warningLabel.text = "^ Digite o nome de um filme acima ^"
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}

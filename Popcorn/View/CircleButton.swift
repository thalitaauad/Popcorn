
//  CircleButton.swift

import UIKit

@IBDesignable class CircleButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.frame.width / 2
    }

}

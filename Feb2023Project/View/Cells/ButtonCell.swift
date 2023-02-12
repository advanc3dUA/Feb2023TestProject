//
//  ButtonCell.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 11.02.2023.
//

import UIKit

class ButtonCell: UICollectionViewCell {
    
    @IBOutlet var button: ActionButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        button = ActionButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        button = ActionButton()
    }
}


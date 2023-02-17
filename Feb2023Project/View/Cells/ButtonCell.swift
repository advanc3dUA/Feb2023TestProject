//
//  ButtonCell.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 11.02.2023.
//

import UIKit

class ButtonCell: UICollectionViewCell {
    
    @IBOutlet var button: ActionButton!
    
    class var identifier: String {
        String(describing: self)
    }
    
    class var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        button = ActionButton()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        button = ActionButton()
    }
}


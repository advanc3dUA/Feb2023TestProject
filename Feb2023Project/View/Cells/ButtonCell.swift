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
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        button = ActionButton()
        contentView.addSubview(button)
    }
    
    @IBAction func buttonPressed(_ sender: ActionButton) {
        sender.isSelected = !sender.isSelected
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        button.setTitle(nil, for: .normal)
    }
}


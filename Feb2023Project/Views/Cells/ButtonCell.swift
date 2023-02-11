//
//  ButtonCell.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 11.02.2023.
//

import UIKit

class ButtonCell: UICollectionViewCell {
    
    @IBOutlet var button: ActionButton!
//    let button = ActionButton()
    
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
//        button.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//            button.topAnchor.constraint(equalTo: contentView.topAnchor),
//            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
//            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
//        ])
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        button.setTitle(nil, for: .normal)
    }
}


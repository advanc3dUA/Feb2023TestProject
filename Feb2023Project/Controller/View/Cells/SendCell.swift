//
//  SendCell.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 12.02.2023.
//

import UIKit

class SendCell: UITableViewCell {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var sendButton: SendButton!
    var delegate: SendCellModelDelegate?
    
    class var identifier: String {
        String(describing: self)
    }
    
    class var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    func setup() {
        questionLabel.text = delegate?.question
        sendButton.setTitle(delegate?.buttonTitle, for: .normal)
    }
}

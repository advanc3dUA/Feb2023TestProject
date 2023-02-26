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
        let width = delegate?.buttonWidth ?? 200
        let height = delegate?.buttonHeight ?? 50
        let currentPos = sendButton.frame.origin
        sendButton.frame = CGRect(origin: currentPos, size: CGSize(width: width, height: height))
        
        questionLabel.text = delegate?.question
        sendButton.setTitle(delegate?.buttonTitle, for: .normal)
    }
}

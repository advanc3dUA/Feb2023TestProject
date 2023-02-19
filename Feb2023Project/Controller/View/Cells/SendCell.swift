//
//  SendCell.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 12.02.2023.
//

import UIKit

class SendCell: UITableViewCell {

    @IBOutlet weak var sendButton: SendButton!
    
    class var identifier: String {
        String(describing: self)
    }
    
    class var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
}

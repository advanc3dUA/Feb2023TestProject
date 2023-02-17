//
//  HeaderCell.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 11.02.2023.
//

import UIKit

class HeaderCell: UITableViewCell {

    @IBOutlet weak var headerCell: UILabel!
    
    class var identifier: String {
        String(describing: self)
    }
    
    class var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
}

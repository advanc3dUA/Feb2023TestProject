//
//  MiddleButtonsCell.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 12.02.2023.
//

import UIKit

class MiddleButtonsCell: UITableViewCell {

    @IBOutlet var middleButtons: [ActionButton]!
    var delegate: MiddleButtonsCellModelDelegate?
    var additionalIndexIfSecondRow = 0
    
    class var identifier: String {
        String(describing: self)
    }
    
    class var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        middleButtons = [ActionButton]()
    }
    
    func setupButtons() {
        for index in 0...2 {
            let fullIndex = index + additionalIndexIfSecondRow
            
            // Configuring size of the button from model
            let buttonWidth = delegate?.buttons[fullIndex].width ?? 75
            let buttonHeight = delegate?.buttons[fullIndex].height ?? 50
            middleButtons[index].frame = CGRect(x: 0, y: 0, width: buttonWidth, height: buttonHeight)
            
            // Configuring other buttons settings
            middleButtons[index].setTitle(delegate?.buttons[fullIndex].title, for: .normal)
            middleButtons[index].isSelected = delegate?.buttons[fullIndex].state ?? false
            middleButtons[index].tag = fullIndex
            middleButtons[index].addTarget(self, action: #selector(midButtonWasClicked(sender:)), for: .touchUpInside)
        }
    }
    
    @objc private func midButtonWasClicked(sender: ActionButton) {
        delegate?.buttons[sender.tag].state = !sender.isSelected
        sender.isSelected = delegate?.buttons[sender.tag].state ?? false
    }
}

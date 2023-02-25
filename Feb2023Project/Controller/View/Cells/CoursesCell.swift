//
//  CoursesCell.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 12.02.2023.
//

import UIKit

class CoursesCell: UITableViewCell {

    @IBOutlet var courseButtons: [ActionButton]!
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
        courseButtons = [ActionButton]()
    }
    
    func setupButtons() {
        for index in 0...2 {
            courseButtons[index].setTitle(delegate?.buttons[index + additionalIndexIfSecondRow].title, for: .normal)
            courseButtons[index].isSelected = delegate?.buttons[index + additionalIndexIfSecondRow].state ?? false
            courseButtons[index].tag = index + additionalIndexIfSecondRow
            courseButtons[index].addTarget(self, action: #selector(midButtonWasClicked(sender:)), for: .touchUpInside)
        }
    }
    
    @objc private func midButtonWasClicked(sender: ActionButton) {
        delegate?.buttons[sender.tag].state = !sender.isSelected
        sender.isSelected = delegate?.buttons[sender.tag].state ?? false
    }
}

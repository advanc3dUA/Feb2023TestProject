//
//  CoursesCell.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 12.02.2023.
//

import UIKit

class CoursesCell: UITableViewCell {

    @IBOutlet var courseButtons: [ActionButton]!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupButtons()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupButtons()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func setupButtons() {
        courseButtons = Array(repeating: ActionButton(), count: 3)
    }
    
    @IBAction func courseButtonPressed(_ sender: ActionButton) {
        sender.isSelected = !sender.isSelected
    }
}

//
//  ActionButton.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 11.02.2023.
//

import UIKit

class ActionButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }

    func setup() {
        self.frame = CGRect(x: 200, y: 200, width: 100, height: 50)
        self.layer.cornerRadius = 5
        self.setTitleColor(.black, for: .normal)
        self.backgroundColor = .systemGray6

        self.setTitleColor(.white, for: .selected)
        self.setTitleColor(.red, for: .highlighted)
    }

    func getButtonWidth(for currentTitle: String) -> CGFloat {
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: self.frame.height)
        let attributes = [NSAttributedString.Key.font: self.titleLabel?.font as Any]
        let estimatedFrame = NSString(string: currentTitle).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
        return estimatedFrame.width
    }
}


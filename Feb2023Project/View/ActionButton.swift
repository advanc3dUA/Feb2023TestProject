//
//  ActionButton.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 11.02.2023.
//

import UIKit

@IBDesignable
class ActionButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setBackgroundImage(image(with: .systemGray6), for: .normal)
        setBackgroundImage(image(with: .black), for: .selected)
        setTitleColor(.black, for: .normal)
        setTitleColor(.white, for: .selected)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: .body)
        layer.cornerRadius = 10
        layer.masksToBounds = true
    }

    override func prepareForInterfaceBuilder() {
        setup()
    }
    
    private func image(with color: UIColor) -> UIImage {
        let size = CGSize(width: 1, height: 1)
        let renderer = UIGraphicsImageRenderer(size: size)
        return renderer.image { context in
            context.cgContext.setFillColor(color.cgColor)
            context.cgContext.fill(CGRect(origin: .zero, size: size))
        }
    }
}

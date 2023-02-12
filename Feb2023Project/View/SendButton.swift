//
//  SendButton.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 12.02.2023.
//

import UIKit

@IBDesignable
class SendButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        setBackgroundImage(image(with: .black), for: .normal)
        setBackgroundImage(image(with: .systemRed), for: .selected)
        setTitleColor(.white, for: .normal)
        setTitleColor(.white, for: .selected)
        titleLabel?.font = UIFont.preferredFont(forTextStyle: UIFont.TextStyle.subheadline)
        layer.cornerRadius = 25
        layer.masksToBounds = true
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

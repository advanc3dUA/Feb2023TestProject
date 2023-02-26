//
//  SendCellModelDelegate.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 25.02.2023.
//

import Foundation

protocol SendCellModelDelegate {
    var question: String { get }
    var buttonTitle: String { get }
    var buttonHeight: CGFloat { get }
    var buttonWidth: CGFloat { get }
}

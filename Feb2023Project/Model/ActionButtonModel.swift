//
//  ActionButtonModel.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 12.02.2023.
//

import Foundation

struct ActionButtonModel: Equatable {
    var title = ""
    var state: Bool = false
    var width: CGFloat?
    let height: CGFloat = 50
}

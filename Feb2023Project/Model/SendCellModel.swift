//
//  SendCellModel.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 25.02.2023.
//

import Foundation

struct SendCellModel: SendCellModelDelegate {
    let question = "Хочешь к нам?"
    let buttonTitle = "Отправить заявку"
    let buttonHeight: CGFloat = 50
    var buttonWidth: CGFloat {
        let lettersCount = buttonTitle.count
        let size = CGFloat(10 * lettersCount + 40)
        return size
    }
}

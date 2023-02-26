//
//  MiddleButtonsCellModel.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 19.02.2023.
//

import Foundation

class MiddleButtonsCellModel: MiddleButtonsCellModelDelegate {
    var buttons: [ActionButtonModel] = {
        var array = [ActionButtonModel]()
        for i in 0...5 {
            let titleForButton = CourseListModel.courses[i]
            var newButton = ActionButtonModel(title: titleForButton)
            let lettersCount = titleForButton.count
            newButton.width = CGFloat(7 * lettersCount + 50)
            array.append(newButton)
        }
        return array
    }()
}

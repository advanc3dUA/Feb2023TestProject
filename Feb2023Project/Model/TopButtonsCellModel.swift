//
//  TopButtonsCellModel.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 18.02.2023.
//

import Foundation

class TopButtonsCellModel: TopButtonsCellModelDelegate {
    var buttons: [ActionButtonModel] = {
        var array = [ActionButtonModel]()
        for i in 0...9 {
            let titleForButton = CourseListModel.courses[i]
            var newButton = ActionButtonModel(title: titleForButton)
            let lettersCount = titleForButton.count
            newButton.width = CGFloat(7 * lettersCount + 50)
            array.append(newButton)
        }
        return array
    }()
}

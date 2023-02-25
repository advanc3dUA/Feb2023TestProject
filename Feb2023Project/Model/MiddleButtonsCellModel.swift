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
            let newButton = ActionButtonModel(title: CourseListModel.courses[i])
            array.append(newButton)
        }
        return array
    }()
}

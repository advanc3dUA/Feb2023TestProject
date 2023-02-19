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
            let newButton = ActionButtonModel(title: CourseListModel.courses[i])
            array.append(newButton)
        }
        return array
    }()
}

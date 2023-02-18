//
//  ButtonsCellModel.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 18.02.2023.
//

import Foundation

struct ButtonsCellModel {
    var topButtons: [ActionButtonModel] = {
        var array = [ActionButtonModel]()
        for i in 0...9 {
            let newButton = ActionButtonModel(title: CourseListModel.courses[i])
            array.append(newButton)
        }
        return array
    }()
    
    var middleButtons: [ActionButtonModel] = {
        var array = [ActionButtonModel]()
        for i in 0...5 {
            let newButton = ActionButtonModel(title: CourseListModel.courses[i])
            array.append(newButton)
        }
        return array
    }()
}

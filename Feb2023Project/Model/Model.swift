//
//  Model.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 11.02.2023.
//

import Foundation

struct Model {
    private static let courses = [
                        "IOS",
                        "Android",
                        "Design",
                        "QA",
                        "Flutter",
                        "PM",
                        "Seven",
                        "Eight",
                        "Nine",
                        "Ten"
                        ]
    static let description2 = "Получай стипендию, выстраивай удобный график, работай на современном железе"
    
    static var middleActionButtons: [ActionButtonModel] = {
        var array: [ActionButtonModel] = []
        for index in 0...5 {
            let newButton = ActionButtonModel(title: courses[index])
            array.append(newButton)
        }
        return array
    }()
    
    static var topActionButtons: [ActionButtonModel] = {
        var array: [ActionButtonModel] = []
        for index in 0...9 {
            let newButton = ActionButtonModel(title: courses[index])
            array.append(newButton)
        }
        return array
    }()
}

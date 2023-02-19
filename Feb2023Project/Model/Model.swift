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
    
    static var middleActionButtons: [ActionButtonModel] = {
        var array: [ActionButtonModel] = []
        for index in 0...5 {
            let newButton = ActionButtonModel(title: courses[index])
            array.append(newButton)
        }
        return array
    }()
}

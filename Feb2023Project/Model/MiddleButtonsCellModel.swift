//
//  MiddleButtonsCellModel.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 19.02.2023.
//

import Foundation

class MiddleButtonsCellModel: MiddleButtonsCellModelDelegate {
    var buttons: [ActionButtonModel] = CourseListModel.courses.prefix(6).map { title in
        var button = ActionButtonModel(title: title)
        button.width = CGFloat(7 * title.count + 50)
        return button
    }
}

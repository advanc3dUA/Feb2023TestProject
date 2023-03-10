//
//  TopButtonsCellModel.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 18.02.2023.
//

import Foundation

class TopButtonsCellModel: TopButtonsCellModelDelegate {
    var buttons: [ActionButtonModel] = CourseListModel.courses.prefix(10).map { title in
        var button = ActionButtonModel(title: title)
        button.width = CGFloat(7 * title.count + 50)
        return button
    }
}

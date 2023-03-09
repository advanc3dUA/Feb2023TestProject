//
//  TopButtonsCellModel.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 18.02.2023.
//

import Foundation

class TopButtonsCellModel: TopButtonsCellModelDelegate {
    var buttons: [ActionButtonModel] = {
//        var array = [ActionButtonModel]()
//        for i in 0...9 {
//            let titleForButton = CourseListModel.courses[i]
//            var newButton = ActionButtonModel(title: titleForButton)
//            let lettersCount = titleForButton.count
//            newButton.width = CGFloat(7 * lettersCount + 50)
//            array.append(newButton)
//        }
//
//        return array
//    }()
//
        var array = Array(repeating: ActionButtonModel(), count: 10)
        array.forEach { actionButtonModel in
            if let index = array.firstIndex(of: actionButtonModel) {
                
                let title = CourseListModel.courses[index]
                array[index].title = title
                
                let width = CGFloat(7 * title.count + 50)
                array[index].width = width
            }
        }

        return array
    }()
}

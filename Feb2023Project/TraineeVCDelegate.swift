//
//  TraineeVCDelegate.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 11.02.2023.
//

import UIKit

protocol TraineeVCDelegate: AnyObject {
    func detentChanged(detent: UISheetPresentationController.Detent)
}

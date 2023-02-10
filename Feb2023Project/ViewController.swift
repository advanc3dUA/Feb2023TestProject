//
//  ViewController.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 09.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var traineeVCSmallDetentHeight: CGFloat?
    var traineeVCLargeDetentHeight: CGFloat?

    override func viewDidLoad() {
        super.viewDidLoad()
        calcTraineeVCDetentSizes()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showTraineeVCInACustomizedSheet()
    }

    private func showTraineeVCInACustomizedSheet() {
        let traineeVC = TraineeViewController()
        if let sheet = traineeVC.sheetPresentationController {
            
            // Adds two custom Detents - small and large
            let smallId = UISheetPresentationController.Detent.Identifier("small")
            let smallDetent = UISheetPresentationController.Detent.custom(identifier: smallId) {[unowned self] context in
                return traineeVCSmallDetentHeight
            }
            let bigId = UISheetPresentationController.Detent.Identifier("large")
            let bigDetent = UISheetPresentationController.Detent.custom(identifier: bigId) {[unowned self] context in
                return traineeVCLargeDetentHeight
            }
            sheet.detents = [smallDetent, .medium(), bigDetent]
            
            //Sheet setup
            sheet.largestUndimmedDetentIdentifier = .large
            sheet.prefersScrollingExpandsWhenScrolledToEdge = true
            sheet.prefersEdgeAttachedInCompactHeight = true
            sheet.widthFollowsPreferredContentSizeWhenEdgeAttached = true
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 27
        }
        // Disables hiding TraineeVC
        traineeVC.isModalInPresentation = true
        present(traineeVC, animated: true, completion: nil)
    }
    
    private func calcTraineeVCDetentSizes() {
        traineeVCSmallDetentHeight = self.view.bounds.height * 0.23
        traineeVCLargeDetentHeight = self.view.bounds.height * 0.88
    }
}


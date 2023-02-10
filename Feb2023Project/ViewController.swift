//
//  ViewController.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 09.02.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showTraineeVCInACustomizedSheet()
    }

    func showTraineeVCInACustomizedSheet() {
        let traineeVC = TraineeViewController()
        if let sheet = traineeVC.sheetPresentationController {
            // Adds two custom Detents - small and large
            let smallId = UISheetPresentationController.Detent.Identifier("small")
            let smallDetent = UISheetPresentationController.Detent.custom(identifier: smallId) { context in
                return 240
            }
            let bigId = UISheetPresentationController.Detent.Identifier("large")
            let bigDetent = UISheetPresentationController.Detent.custom(identifier: bigId) { context in
                return 700
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
//        traineeVC.modalPresentationCapturesStatusBarAppearance = false
//        traineeVC.modalPresentationStyle = .overFullScreen
        present(traineeVC, animated: true, completion: nil)
    }
    


}


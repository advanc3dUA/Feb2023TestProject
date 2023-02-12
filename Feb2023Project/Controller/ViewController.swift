//
//  ViewController.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 09.02.2023.
//

import UIKit

class ViewController: UIViewController {
    
    var traineeVC: TraineeViewController?

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showTraineeVCInACustomizedSheet()
    }

    private func showTraineeVCInACustomizedSheet() {
        traineeVC = TraineeViewController(smallDetentSize: calcTraineeVCDetentSizeSmall(),
                                          mediumDetentSize: calcTraineeVCDetentSizeMedium(),
                                          largeDetentSize: calcTraineeVCDetentSizeLarge())
        traineeVC?.delegate = self
        traineeVC?.presentationController?.delegate = self
        present(traineeVC!, animated: true, completion: nil)
    }
    
    private func calcTraineeVCDetentSizeSmall() -> CGFloat {
        self.view.bounds.height * 0.33
    }
    
    private func calcTraineeVCDetentSizeMedium() -> CGFloat {
        self.view.bounds.height * 0.55
    }
    
    private func calcTraineeVCDetentSizeLarge() -> CGFloat {
        self.view.bounds.height * 0.87
    }
}

//MARK: - TraineeVCDelegate

extension ViewController: TraineeVCDelegate {
    func detentChanged(detent: UISheetPresentationController.Detent.Identifier) {
        switch detent.rawValue {
        case K.Detent.large: changeTraineeVCNumberOfRows(to: 8)
        case K.Detent.medium: changeTraineeVCNumberOfRows(to: 7)
        case K.Detent.small: changeTraineeVCNumberOfRows(to: 4)
        default: return
        }
    }
    
    private func changeTraineeVCNumberOfRows(to number: Int) {
        traineeVC?.numberOfRows = number
    }
}

//MARK: - UISheetPresentationControllerDelegate

extension ViewController: UISheetPresentationControllerDelegate {
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        if let currentDetent = sheetPresentationController.selectedDetentIdentifier {
            detentChanged(detent: currentDetent)            
        }
    }
}



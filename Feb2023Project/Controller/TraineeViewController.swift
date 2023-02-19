//
//  TraineeViewController.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 09.02.2023.
//

import UIKit

class TraineeViewController: UITableViewController {
    
    weak var delegate: TraineeVCDelegate?
    
    var numberOfRows: Int {
        didSet {
            tableView.reloadData()
        }
    }
    
    let headerCellModel = HeaderCellModel()
    let descriptionCellModel = DescriptionCellModel()
    let topButtonsCellModel = TopButtonsCellModel()
    let middleButtonsCellModel = MiddleButtonsCellModel()
    
    init(smallDetentSize: CGFloat, mediumDetentSize: CGFloat, largeDetentSize: CGFloat) {
        self.numberOfRows = 4
        super.init(style: .plain)
        
        // Adds custom detents
        let smallId = UISheetPresentationController.Detent.Identifier("small")
        let smallDetent = UISheetPresentationController.Detent.custom(identifier: smallId) {context in
            return smallDetentSize
        }
        
        let mediumId = UISheetPresentationController.Detent.Identifier("medium")
        let mediumDetent = UISheetPresentationController.Detent.custom(identifier: mediumId) {context in
            return mediumDetentSize
        }
        
        let bigId = UISheetPresentationController.Detent.Identifier("large")
        let bigDetent = UISheetPresentationController.Detent.custom(identifier: bigId) {context in
            return largeDetentSize
        }
        sheetPresentationController?.detents = [smallDetent, mediumDetent, bigDetent]

        //Sheet setup
        sheetPresentationController?.largestUndimmedDetentIdentifier = .large
        sheetPresentationController?.prefersScrollingExpandsWhenScrolledToEdge = true
        sheetPresentationController?.prefersEdgeAttachedInCompactHeight = true
        sheetPresentationController?.widthFollowsPreferredContentSizeWhenEdgeAttached = true
        sheetPresentationController?.prefersGrabberVisible = false
        sheetPresentationController?.preferredCornerRadius = 27

        // Disables hiding TraineeVC
        isModalInPresentation = true
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        
        tableView.register(HeaderCell.nib, forCellReuseIdentifier: HeaderCell.identifier)
        tableView.register(DescriptionCell.nib, forCellReuseIdentifier: DescriptionCell.identifier)
        tableView.register(ButtonsArrayCell.nib, forCellReuseIdentifier: ButtonsArrayCell.identifier)
        tableView.register(CoursesCell.nib, forCellReuseIdentifier: CoursesCell.identifier)
        tableView.register(SendCell.nib, forCellReuseIdentifier: SendCell.identifier)
    }
    
    private func detentChanged(_ detent: UISheetPresentationController.Detent.Identifier) {
        delegate?.detentChanged(detent: detent)
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRows
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch numberOfRows {
        case 4:
            switch indexPath.row {
                case 0:
                let headerCell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
                    configureHeaderCell(headerCell, with: headerCellModel)
                    return headerCell
                
                case 1:
                    let descriptionCell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.identifier, for: indexPath) as! DescriptionCell
                    configureDescriptionCell(descriptionCell, with: descriptionCellModel, type: .duties)
                    return descriptionCell
                case 2: let buttonsArrayCell = tableView.dequeueReusableCell(withIdentifier: ButtonsArrayCell.identifier, for: indexPath) as! ButtonsArrayCell
                    configureButtonsArrayCell(buttonsArrayCell, with: topButtonsCellModel)
                    return buttonsArrayCell
                default:
                    let sendCell = tableView.dequeueReusableCell(withIdentifier: SendCell.identifier, for: indexPath) as! SendCell
                    sendCell.sendButton.addTarget(self, action: #selector(presentSentAlertController), for: .touchUpInside)
                    return sendCell
            }
        case 7:
            switch indexPath.row {
            case 0:
                let headerCell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
                configureHeaderCell(headerCell, with: headerCellModel)
                return headerCell
            case 1:
                let descriptionCell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.identifier, for: indexPath) as! DescriptionCell
                configureDescriptionCell(descriptionCell, with: descriptionCellModel, type: .duties)
                return descriptionCell
            case 2: let buttonsArrayCell = tableView.dequeueReusableCell(withIdentifier: ButtonsArrayCell.identifier, for: indexPath) as! ButtonsArrayCell
                configureButtonsArrayCell(buttonsArrayCell, with: topButtonsCellModel)
                return buttonsArrayCell
            case 3:
                let descriptionCell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.identifier, for: indexPath) as! DescriptionCell
                configureDescriptionCell(descriptionCell, with: descriptionCellModel, type: .benefits)
                return descriptionCell
            case 4:
                let coursesCell = tableView.dequeueReusableCell(withIdentifier: CoursesCell.identifier, for: indexPath) as! CoursesCell
                print("creation of courseCell over")
//                for index in 0...2 {
//                    coursesCell.courseButtons[index].setTitle(Model.middleActionButtons[index].title, for: .normal)
//                    coursesCell.courseButtons[index].isSelected = Model.middleActionButtons[index].state
//                    coursesCell.courseButtons[index].tag = index
//                    coursesCell.courseButtons[index].addTarget(self, action: #selector(midButtonWasClicked(sender:)), for: .touchUpInside)
//                }
                print("executing configCourseCell method...")
                configureCourseCell(coursesCell, with: middleButtonsCellModel)
                print("ready to return courseCell")
                return coursesCell
            case 5:
                let coursesCell = tableView.dequeueReusableCell(withIdentifier: CoursesCell.identifier, for: indexPath) as! CoursesCell
                for index in 0...2 {
                    coursesCell.courseButtons[index].setTitle(Model.middleActionButtons[index + 3].title, for: .normal)
                    coursesCell.courseButtons[index].isSelected = Model.middleActionButtons[index + 3].state
                    coursesCell.courseButtons[index].tag = index + 3
                    coursesCell.courseButtons[index].addTarget(self, action: #selector(midButtonWasClicked(sender:)), for: .touchUpInside)
                }
                return coursesCell
            default:
                let sendCell = tableView.dequeueReusableCell(withIdentifier: SendCell.identifier, for: indexPath)
                return sendCell
            }
        case 8:
            switch indexPath.row {
            case 0:
                let headerCell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.identifier, for: indexPath) as! HeaderCell
                configureHeaderCell(headerCell, with: headerCellModel)
                return headerCell
            case 1:
                let descriptionCell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.identifier, for: indexPath) as! DescriptionCell
                configureDescriptionCell(descriptionCell, with: descriptionCellModel, type: .duties)
                return descriptionCell
            case 2: let buttonsArrayCell = tableView.dequeueReusableCell(withIdentifier: ButtonsArrayCell.identifier, for: indexPath) as! ButtonsArrayCell
                configureButtonsArrayCell(buttonsArrayCell, with: topButtonsCellModel)
                return buttonsArrayCell
            case 3:
                let descriptionCell = tableView.dequeueReusableCell(withIdentifier: DescriptionCell.identifier, for: indexPath) as! DescriptionCell
                configureDescriptionCell(descriptionCell, with: descriptionCellModel, type: .benefits)
                return descriptionCell
            case 4:
                let coursesCell = tableView.dequeueReusableCell(withIdentifier: CoursesCell.identifier, for: indexPath) as! CoursesCell
//                for index in 0...2 {
//                    coursesCell.courseButtons[index].setTitle(Model.middleActionButtons[index].title, for: .normal)
//                    coursesCell.courseButtons[index].isSelected = Model.middleActionButtons[index].state
//                    coursesCell.courseButtons[index].tag = index
//                    coursesCell.courseButtons[index].addTarget(self, action: #selector(midButtonWasClicked(sender:)), for: .touchUpInside)
//                }
                configureCourseCell(coursesCell, with: middleButtonsCellModel)
                return coursesCell
            case 5:
                let coursesCell = tableView.dequeueReusableCell(withIdentifier: CoursesCell.identifier, for: indexPath) as! CoursesCell
                for index in 0...2 {
                    coursesCell.courseButtons[index].setTitle(Model.middleActionButtons[index + 3].title, for: .normal)
                    coursesCell.courseButtons[index].isSelected = Model.middleActionButtons[index + 3].state
                    coursesCell.courseButtons[index].tag = index + 3
                    coursesCell.courseButtons[index].addTarget(self, action: #selector(midButtonWasClicked(sender:)), for: .touchUpInside)
                }
                return coursesCell
            case 6:
                let emptyCell = UITableViewCell()
                emptyCell.backgroundColor = .clear
                return emptyCell
            default:
                let sendCell = tableView.dequeueReusableCell(withIdentifier: SendCell.identifier, for: indexPath)
                return sendCell
            }
        default: fatalError("Unregistered number of rows (in numberOfRowsInSection")
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch numberOfRows {
        case 4:
            switch indexPath.row {
                case 0, 2: return 65
                case 3: return 75
                default: return 50
            }
        case 7:
            switch indexPath.row {
                case 0, 2, 4, 5: return 65
                case 6: return 75
                default: return 50
            }
        case 8:
            switch indexPath.row {
                case 0, 2, 4, 5: return 65
                case 6: return 250
                case 7: return 75
                default: return 50
            }
        default: fatalError("Unregistered number of rows (in heightForRowAt")
        }
    }
    
    @objc private func presentSentAlertController() {
        let alert = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", preferredStyle: .alert)
        let closeButton = UIAlertAction(title: "Закрыть", style: .cancel)
        alert.addAction(closeButton)
        present(alert, animated: true)
    }
    
    @objc private func midButtonWasClicked(sender: ActionButton) {
        Model.middleActionButtons[sender.tag].state = !sender.isSelected
        sender.isSelected = Model.middleActionButtons[sender.tag].state
    }
    
    private func configureHeaderCell(_ headerCell: HeaderCell, with headerCellModel: HeaderCellModel) {
        headerCell.headerCell.text = headerCellModel.title
    }
    
    private func configureDescriptionCell(_ descriptionCell: DescriptionCell, with descriptionCellModel: DescriptionCellModel, type: DescriptionType) {
        if type == .duties {
            descriptionCell.descriptionLabel.text = descriptionCellModel.dutiesString
        }
        if type == .benefits {
            descriptionCell.descriptionLabel.text = descriptionCellModel.benefitsString
        }
    }
    
    private func configureButtonsArrayCell(_ buttonsArrayCell: ButtonsArrayCell, with topButtonsCellModel: TopButtonsCellModel) {
        buttonsArrayCell.delegate = topButtonsCellModel
    }
    
    private func configureCourseCell(_ courseCell: CoursesCell, with middleButtonsCellModel: MiddleButtonsCellModel) {
        courseCell.delegate = middleButtonsCellModel
        courseCell.setupButtons()
    }
}

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
    
    let headerCellViewModel = HeaderCellViewModel()
    let descriptionCellViewModel = DescriptionCellViewModel()
    
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
        
        tableView.register(UINib(nibName: K.Cell.header, bundle: nil), forCellReuseIdentifier: K.Cell.header)
        tableView.register(UINib(nibName: K.Cell.description, bundle: nil), forCellReuseIdentifier: K.Cell.description)
        tableView.register(UINib(nibName: K.Cell.buttonsArray, bundle: nil), forCellReuseIdentifier: K.Cell.buttonsArray)
        tableView.register(UINib(nibName: K.Cell.courses, bundle: nil), forCellReuseIdentifier: K.Cell.courses)
        tableView.register(UINib(nibName: K.Cell.send, bundle: nil), forCellReuseIdentifier: K.Cell.send)
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
        // I am not proud of this switch-case oriented programming. But there is no time for viewModels implemetnation :(
        switch numberOfRows {
        case 4:
            switch indexPath.row {
                case 0:
                    let headerCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.header, for: indexPath) as! HeaderCell
                    configureHeaderCell(headerCell, with: headerCellViewModel)
                    return headerCell
                
                case 1:
                    let descriptionCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.description, for: indexPath) as! DescriptionCell
                    configureDescriptionCell(descriptionCell, with: descriptionCellViewModel)
                    return descriptionCell
                case 2:
                    let buttonsArrayCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.buttonsArray, for: indexPath)
                    return buttonsArrayCell
                default:
                    let sendCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.send, for: indexPath) as! SendCell
                sendCell.sendButton.addTarget(self, action: #selector(presentSentAlertController), for: .touchUpInside)
                    return sendCell
            }
        case 7:
            switch indexPath.row {
            case 0:
                let headerCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.header, for: indexPath) as! HeaderCell
                configureHeaderCell(headerCell, with: headerCellViewModel)
                return headerCell
            case 1:
                let descriptionCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.description, for: indexPath) as! DescriptionCell
                configureDescriptionCell(descriptionCell, with: descriptionCellViewModel)
                return descriptionCell
            case 2:
                let buttonsArrayCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.buttonsArray, for: indexPath)
                return buttonsArrayCell
            case 3:
                let descriptionCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.description, for: indexPath) as! DescriptionCell
                descriptionCell.descriptionLabel.text = Model.description2
                return descriptionCell
            case 4:
                let coursesCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.courses, for: indexPath) as! CoursesCell
                for index in 0...2 {
                    coursesCell.courseButtons[index].setTitle(Model.middleActionButtons[index].title, for: .normal)
                    coursesCell.courseButtons[index].isSelected = Model.middleActionButtons[index].state
                    coursesCell.courseButtons[index].tag = index
                    coursesCell.courseButtons[index].addTarget(self, action: #selector(midButtonWasClicked(sender:)), for: .touchUpInside)
                }
                return coursesCell
            case 5:
                let coursesCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.courses, for: indexPath) as! CoursesCell
                for index in 0...2 {
                    coursesCell.courseButtons[index].setTitle(Model.middleActionButtons[index + 3].title, for: .normal)
                    coursesCell.courseButtons[index].isSelected = Model.middleActionButtons[index + 3].state
                    coursesCell.courseButtons[index].tag = index + 3
                    coursesCell.courseButtons[index].addTarget(self, action: #selector(midButtonWasClicked(sender:)), for: .touchUpInside)
                }
                return coursesCell
            default:
                let sendCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.send, for: indexPath)
                return sendCell
            }
        case 8:
            switch indexPath.row {
            case 0:
                let headerCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.header, for: indexPath) as! HeaderCell
                configureHeaderCell(headerCell, with: headerCellViewModel)
                return headerCell
            case 1:
                let descriptionCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.description, for: indexPath) as! DescriptionCell
                configureDescriptionCell(descriptionCell, with: descriptionCellViewModel)
                return descriptionCell
            case 2:
                let buttonsArrayCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.buttonsArray, for: indexPath)
                return buttonsArrayCell
            case 3:
                let descriptionCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.description, for: indexPath) as! DescriptionCell
                descriptionCell.descriptionLabel.text = Model.description2
                return descriptionCell
            case 4:
                let coursesCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.courses, for: indexPath) as! CoursesCell
                for index in 0...2 {
                    coursesCell.courseButtons[index].setTitle(Model.middleActionButtons[index].title, for: .normal)
                    coursesCell.courseButtons[index].isSelected = Model.middleActionButtons[index].state
                    coursesCell.courseButtons[index].tag = index
                    coursesCell.courseButtons[index].addTarget(self, action: #selector(midButtonWasClicked(sender:)), for: .touchUpInside)
                }
                return coursesCell
            case 5:
                let coursesCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.courses, for: indexPath) as! CoursesCell
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
                let sendCell = tableView.dequeueReusableCell(withIdentifier: K.Cell.send, for: indexPath)
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
    
    private func configureHeaderCell(_ headerCell: HeaderCell, with headerCellViewModel: HeaderCellViewModel) {
        headerCell.headerCell.text = headerCellViewModel.title
    }
    
    private func configureDescriptionCell(_ descriptionCell: DescriptionCell, with descriptionCellViewModel: DescriptionCellViewModel) {
        descriptionCell.descriptionLabel.text = descriptionCellViewModel.description1
    }
}

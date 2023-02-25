//
//  ButtonsArrayCell.swift
//  Feb2023Project
//
//  Created by Yuriy Gudimov on 11.02.2023.
//

import UIKit

class ButtonsArrayCell: UITableViewCell {
    
    @IBOutlet var collectionView: UICollectionView!
    var delegate: TopButtonsCellModelDelegate?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupCollectionView()
    }
    
    class var identifier: String {
        String(describing: self)
    }
    
    class var nib: UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupCollectionView()
        
    }
    
    private func setupCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize(width: 100, height: 25)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.register(UINib(nibName: K.CLCell.button, bundle: nil), forCellWithReuseIdentifier: K.CLCell.button)
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}

extension ButtonsArrayCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.buttons.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.CLCell.button, for: indexPath) as! ButtonCell
        guard let buttons = delegate?.buttons else { return cell }
        
        cell.button.setTitle(buttons[indexPath.row].title, for: .normal)
        cell.button.isSelected = buttons[indexPath.row].state
        cell.button.tag = indexPath.row
        cell.button.addTarget(self, action: #selector(topButtonWasClicked(sender:)), for: .touchUpInside)
        return cell
    }
    
    @objc func topButtonWasClicked(sender: ActionButton) {
        delegate?.buttons[sender.tag].state = !sender.isSelected
        if let currentState = delegate?.buttons[sender.tag].state {
            sender.isSelected = currentState
        }
    }
}

extension ButtonsArrayCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        guard let letters = delegate?.buttons[indexPath.row].title?.count else { return CGSize(width: 75, height: 50) }
        let cellWidth = CGFloat(7 * letters + 50)
        return CGSize(width: cellWidth, height: 50)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}


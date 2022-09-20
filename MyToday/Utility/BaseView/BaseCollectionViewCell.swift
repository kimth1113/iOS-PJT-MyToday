//
//  BaseCollectionViewCell.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/20.
//

import UIKit

class BaseCollectionViewCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("Error was caused at BaseCollectionViewCell.")
    }
    
    func configureUI() { }
    
    func setConstraint() { }
}

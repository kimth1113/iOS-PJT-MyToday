//
//  BaseTableViewCell.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/20.
//

import UIKit

class BaseTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureUI()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("Error was caused at BaseTableViewCell.")
    }
    
    func configureUI() { }
    func setConstraint() { }
}

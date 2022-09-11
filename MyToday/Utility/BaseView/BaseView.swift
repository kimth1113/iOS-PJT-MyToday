//
//  BaseView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/07.
//

import UIKit

class BaseView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("Error was caused in UI.")
    }
    
    func configureUI() { }
    func setConstraint() { }
}

//
//  BaseScrollView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/14.
//

import UIKit

class BaseScrollView: UIScrollView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureUI()
        setConstraint()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError("Error was caused at BaseView.")
    }
    
    func configureUI() { }
    func setConstraint() { }
}

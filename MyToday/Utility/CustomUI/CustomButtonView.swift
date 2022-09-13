//
//  DismissButton.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/13.
//

import UIKit
import SnapKit

class CustomButtonView: BaseView {
    
    let customImageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    let customButton: UIButton = {
        let view = UIButton()
        return view
    }()
    
    override func configureUI() {
        addSubview(customImageView)
        addSubview(customButton)
    }
    
    override func setConstraint() {
        customImageView.snp.makeConstraints { make in
            make.top.leading.equalTo(4)
            make.bottom.trailing.equalTo(-4)
        }
        
        customButton.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
}

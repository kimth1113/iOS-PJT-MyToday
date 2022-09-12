//
//  UpdateView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/12.
//

import UIKit
import SnapKit

class UpdateView: BaseView {
    
    let dismissButton: UIButton = {
        let view = UIButton()
        view.backgroundColor = .blue
        return view
    }()
    
    override func configureUI() {
        backgroundColor = .purple
        
        addSubview(dismissButton)
    }
    
    override func setConstraint() {
        dismissButton.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
    }
}

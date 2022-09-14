//
//  WriteDiaryView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/14.
//

import UIKit
import SnapKit

class WriteDiaryView: BaseView {
    
    let textView: UITextView = {
        let view = UITextView()
        view.textColor = .white
        view.font = Constants.BaseFont.boxTitle
        view.backgroundColor = .clear
        
        return view
    }()
    
    override func configureUI() {
        addSubview(textView)
    }
    
    override func setConstraint() {
        textView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.top.leading.equalTo(self).offset(12)
            make.bottom.trailing.equalTo(self).offset(-12)
        }
    }
}

//
//  WriteDiaryView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/14.
//

import UIKit
import SnapKit

class WriteDiaryView: BaseView {
    
    let textLabelView: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = Constants.BaseFont.boxTitle
        view.backgroundColor = .clear
        view.numberOfLines = 0
        return view
    }()
    
    let textLabelButton: UIButton = {

        let view = UIButton()
        return view
    }()
    
    override func configureUI() {
        addSubview(textLabelView)
        addSubview(textLabelButton)
    }
    
    override func setConstraint() {
        
        textLabelView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self).inset(12)
            make.bottom.lessThanOrEqualTo(self).inset(12)
        }
        
        textLabelButton.snp.makeConstraints { make in
            make.edges.equalTo(textLabelView)
        }
    }
}

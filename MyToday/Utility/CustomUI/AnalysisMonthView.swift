//
//  AnalysisMonthView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/25.
//

import UIKit
import SnapKit

class AnalysisMonthView: BaseView {
    
    let monthLabel: UILabel = {
        let view = UILabel()
        view.text = "12"
        view.font = Constants.BaseFont.Analysis.diaryCount
        view.textAlignment = .center
        return view
    }()
    
    let diaryCountLabel: UILabel = {
        let view = UILabel()
        view.textAlignment = .center
        view.font = Constants.BaseFont.Analysis.title
        view.text = "일기 작성 횟수"
        view.backgroundColor = UIColor(red: 255/255, green: 107/255, blue: 129/255, alpha: 0.5)
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
        return view
    }()
    
    override func configureUI() {
        [monthLabel, diaryCountLabel].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        diaryCountLabel.snp.makeConstraints { make in
            make.top.equalTo(self).inset(8)
            make.leading.trailing.equalTo(self).inset(8)
            make.height.equalTo(28)
        }
        
        monthLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(self).inset(8)
            make.centerY.equalTo(self).multipliedBy(1.15)
        }
        
    }
}

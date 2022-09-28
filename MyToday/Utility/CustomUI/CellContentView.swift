//
//  File.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/21.
//

import UIKit
import SnapKit

class CellContentView: BaseView {
    
    let diaryContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2)
        view.layer.cornerRadius = 8
        return view
    }()
    
    let diaryContentlabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = Constants.BaseFont.DiaryList.content
        view.numberOfLines = 0
        return view
    }()
    
    override func configureUI() {
        [diaryContentView, diaryContentlabel].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        diaryContentView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(8)
        }
        
        diaryContentlabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(diaryContentView).inset(8)
            make.bottom.lessThanOrEqualTo(diaryContentView).offset(-8)
        }
    }
}

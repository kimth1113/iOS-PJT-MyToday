//
//  CellFullView.swift
//  MyToday
//
//  Created by 김태현 on 2022/10/01.
//

import UIKit
import SnapKit

class CellFullView: BaseView {
    
    let noImageLabel: UILabel = {
        let view = UILabel()
        view.text = "noimage".localized
        view.font = Constants.BaseFont.DiaryList.content
        view.textColor = .white
        return view
    }()
    
    let noContentLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.BaseFont.DiaryList.content
        view.textColor = .white
        return view
    }()
    
    let diaryImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    let sidebar: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.opacity = 0.5
        view.layer.cornerRadius = 1
        return view
    }()
    
    let diaryContentView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.2)
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
        [noImageLabel, noContentLabel, diaryImageView, sidebar, diaryContentView, diaryContentlabel].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        noImageLabel.snp.makeConstraints { make in
            make.centerX.equalTo(diaryImageView)
            make.centerY.equalTo(diaryImageView)
        }
        
        noContentLabel.snp.makeConstraints { make in
            make.centerX.equalTo(diaryContentView)
            make.centerY.equalTo(diaryContentView)
        }
        
        diaryImageView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.leading.equalTo(self).inset(8)
            make.trailing.equalTo(sidebar.snp.leading).offset(-8)
            make.bottom.equalTo(self).offset(-8)
        }
        
        sidebar.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.height.equalTo(diaryImageView)
            make.centerX.equalTo(self)
            make.centerY.equalTo(diaryImageView)
        }
        
        diaryContentView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.trailing.equalTo(self).inset(8)
            make.leading.equalTo(sidebar.snp.trailing).offset(8)
            make.bottom.equalTo(self).offset(-8)
        }
        
        diaryContentlabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(diaryContentView).inset(8)
            make.bottom.lessThanOrEqualTo(diaryContentView).offset(-8)
        }
    }
}

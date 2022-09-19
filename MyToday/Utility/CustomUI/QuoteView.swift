//
//  QuoteView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/12.
//

import UIKit
import SnapKit

class QuoteView: BaseView {
    
    let quoteTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "오늘의 명언"
        view.font = Constants.BaseFont.boxTitle
        view.textColor = Constants.BaseColor.black
        return view
    }()
    
    let quoteLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.text = "\"기록되지 않은 것은 기억되지 않는다. 고로 기록하라.기록되지 않은 것은 기억되지 않는다.\""
        view.textAlignment = .center
        view.font = Constants.BaseFont.boxContent
        view.textColor = Constants.BaseColor.black
        return view
    }()
    
    let quoteAuthorLabel: UILabel = {
        let view = UILabel()
        view.text = "작자미상"
        view.font = Constants.BaseFont.boxExtra
        view.textColor = Constants.BaseColor.black
        return view
    }()
    
    override func configureUI() {
        [quoteTitleLabel, quoteLabel, quoteAuthorLabel].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        quoteTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(12)
            make.centerX.equalTo(self)
        }
        
        quoteLabel.snp.makeConstraints { make in
            make.top.equalTo(quoteTitleLabel.snp.bottom).offset(16)
            make.centerX.equalTo(self)
            make.leading.equalTo(self).offset(12)
            make.trailing.equalTo(self).offset(-12)
        }
        
        quoteAuthorLabel.snp.makeConstraints { make in
            make.top.equalTo(quoteLabel.snp.bottom).offset(12)
            make.bottom.equalTo(self).offset(-12)
            make.trailing.equalTo(self).offset(-20)
        }
    }
}

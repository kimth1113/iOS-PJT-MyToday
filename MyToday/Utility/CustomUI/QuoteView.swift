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
        view.textColor = UIColor(rgb: 0x2d3436)
//        view.layer.opacity = 0.8
        return view
    }()
    
    let quoteLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.text = "\"기록되지 않은 것은 기억되지 않는다. 고로 기록하라.기록되지 않은 것은 기억되지 않는다.\""
        view.font = Constants.BaseFont.boxContent
        view.textColor = UIColor(rgb: 0x2d3436)
//        view.layer.opacity = 0.8
            
        let attrString = NSMutableAttributedString(string: view.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 4
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        view.attributedText = attrString
        view.textAlignment = .center
        
        return view
    }()
    
    let quoteAuthorLabel: UILabel = {
        let view = UILabel()
        view.text = "작자미상"
        view.font = Constants.BaseFont.boxExtra
        view.textColor = UIColor(rgb: 0x2d3436)
//        view.layer.opacity = 0.8
        return view
    }()
    
    override func configureUI() {
        [quoteTitleLabel, quoteLabel, quoteAuthorLabel].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        quoteTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(8)
            make.centerX.equalTo(self)
        }
        
        quoteLabel.snp.makeConstraints { make in
            make.top.equalTo(quoteTitleLabel.snp.bottom).offset(8)
            make.centerX.equalTo(self)
            make.leading.equalTo(self).offset(12)
            make.trailing.equalTo(self).offset(-12)
        }
        
        quoteAuthorLabel.snp.makeConstraints { make in
            make.top.equalTo(quoteLabel.snp.bottom).offset(4)
            make.bottom.equalTo(self).offset(-8)
            make.trailing.equalTo(self).offset(-20)
        }
    }
}

//
//  ReadView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/18.
//

import UIKit
import SnapKit

class ReadView: BaseView {
    
    let logoLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = Constants.BaseFont.Read.header
        view.text = "나는오늘!"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    let dateLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = Constants.BaseFont.Read.date
        view.text = "DATE : 2022. 09. 18. (일요일)"
        view.numberOfLines = 2
        view.textAlignment = .center
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let emotionLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = Constants.BaseFont.Read.label
        view.text = "오늘의 감정"
        view.numberOfLines = 2
        view.textAlignment = .center
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let emoticonView: CustomButtonView = {
        let view = CustomButtonView()
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let imageLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = Constants.BaseFont.Read.label
        view.text = "오늘의 사진"
        view.numberOfLines = 2
        view.textAlignment = .center
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let imageView: CustomButtonView = {
        let view = CustomButtonView()
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()

    let contentLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = Constants.BaseFont.Read.label
        view.text = "오늘의 일기"
        view.numberOfLines = 2
        view.textAlignment = .center
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let contentBackgroundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let contentView: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.font = Constants.BaseFont.Read.content
        return view
    }()
    
    override func configureUI() {
        backgroundColor = UIColor(rgb: 0xfaf4e4)
        
        [logoLabel, dateLabel, emotionLabel, emoticonView, imageLabel, imageView, contentLabel, contentBackgroundView, contentView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        self.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(60)
        }
                
        logoLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(40)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).offset(20)
            make.centerX.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.8)
            make.height.equalTo(36)
        }
            
        emotionLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.leading.equalTo(dateLabel.snp.leading)
            make.width.equalTo(imageLabel)
            make.trailing.equalTo(imageLabel.snp.leading).offset(-20)
            make.height.equalTo(24)
        }
        
        imageLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.trailing.equalTo(dateLabel.snp.trailing)
            make.width.equalTo(emotionLabel)
            make.height.equalTo(24)
        }
        
        emoticonView.snp.makeConstraints { make in
            make.top.equalTo(emotionLabel.snp.bottom).offset(12)
            make.leading.equalTo(emotionLabel.snp.leading)
            make.width.equalTo(imageView)
            make.trailing.equalTo(imageView.snp.leading).offset(-20)
            make.height.equalTo(emoticonView.snp.width)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(imageLabel.snp.bottom).offset(12)
            make.trailing.equalTo(imageLabel.snp.trailing)
            make.width.equalTo(emoticonView)
            make.height.equalTo(imageView.snp.width)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.centerX.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.8)
            make.height.equalTo(28)
        }
        
        contentBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(12)
            make.leading.trailing.equalTo(dateLabel)
            make.bottom.equalTo(contentView.snp.bottom).offset(12)
            make.height.greaterThanOrEqualTo(40)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(contentBackgroundView).inset(12)
//            make.height.greaterThanOrEqualTo(20)
        }
    }
}


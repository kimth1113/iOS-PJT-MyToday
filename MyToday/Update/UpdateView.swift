//
//  UpdateView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/12.
//

import UIKit
import SnapKit

class UpdateView: BaseView {
    
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = Constants.BaseImage.background
//        view.backgroundColor = .black
//        view.layer.opacity = 1
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let dateLabel: UILabel = {
        let view = UILabel()
        view.font = Constants.BaseFont.boxTitle
        view.textColor = Constants.BaseColor.white
        view.textAlignment = .center
        view.text = "2022 09 13 TUES"
        return view
    }()
    
    let dismissView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .systemPink
        view.customImageView.image = UIImage(named: "smile")
        return view
    }()
    
    let saveView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .green
        return view
    }()
    
    // 감정 이모티콘 (선택)박스
    let selectEmoticonView: EmotionListView = {
        let view = EmotionListView()
        view.backgroundColor = UIColor(named: "calendar-background")
        view.layer.cornerRadius = 8
        return view
    }()
    
    let contentTextView: UITextView = {
        let view = UITextView()
        view.backgroundColor = UIColor(named: "calendar-background")
        view.layer.cornerRadius = 8
        view.font = Constants.BaseFont.boxTitle
        view.textColor = .white
        view.isScrollEnabled = false
        return view
    }()
    
    override func configureUI() {
        backgroundColor = .black
        
        [backgroundImage, dateLabel, dismissView, saveView, selectEmoticonView, contentTextView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(12)
            make.centerX.equalTo(self)
            make.width.equalTo(200)
        }
        
        dismissView.snp.makeConstraints { make in
            make.centerY.equalTo(dateLabel)
            make.leading.equalTo(safeAreaLayoutGuide).offset(20)
            make.height.equalTo(dateLabel)
            make.width.equalTo(dismissView.snp.height)
        }
        
        saveView.snp.makeConstraints { make in
            make.centerY.equalTo(dateLabel)
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-20)
            make.height.equalTo(dateLabel)
            make.width.equalTo(saveView.snp.height)
        }
        
        selectEmoticonView.snp.makeConstraints { make in
            make.top.equalTo(saveView.snp.bottom).offset(40)
            make.centerX.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.8)
            make.height.equalTo(selectEmoticonView.snp.width)
        }
        
        contentTextView.snp.makeConstraints { make in
            make.top.equalTo(selectEmoticonView.snp.bottom).offset(40)
            make.centerX.equalTo(self)
            make.width.equalTo(selectEmoticonView)
            make.height.greaterThanOrEqualTo(50)
        }
    }
}

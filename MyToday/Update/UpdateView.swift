//
//  UpdateContentView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/14.
//

import UIKit
import SnapKit

class UpdateView: BaseView {
    
    // 배경: 노트 배경
    let noteBackgroundView: UIImageView = {
        let view = UIImageView()
//        view.image = UIImage(named: "valentin-salja-CLvkkjb-i3g-unsplash (1)")
//        view.contentMode = .scaleAspectFill
        view.backgroundColor = .systemYellow
        return view
    }()

    // 컨텐츠: "어떤 하루였나요?"
    let selectEmotionLabel: UILabel = {
        let view = UILabel()
        view.text = "\"어떤 하루였나요?\""
        view.font = .boldSystemFont(ofSize: 20)
        view.numberOfLines = 1
        view.textAlignment = .left
        view.textColor = .black
        view.backgroundColor = .white
        return view
    }()
    
    // 컨텐츠: 감정 이모티콘 박스
    let selectEmoticonView: EmotionListView = {
        let view = EmotionListView()
        view.backgroundColor = UIColor(named: "calendar-background")
        view.layer.cornerRadius = 8
        return view
    }()
    
    // 컨텐츠: "사진 한장 가져오기"
    let selectImageLabel: UILabel = {
        let view = UILabel()
        view.text = "\"사진 한장 가져오기\""
        view.font = .boldSystemFont(ofSize: 20)
        view.numberOfLines = 1
        view.textAlignment = .left
        view.textColor = .black
        view.backgroundColor = .white
        return view
    }()
    
    // 컨텐츠: 앨범 버튼뷰
    let selectImageView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = UIColor(named: "calendar-background")
        view.layer.cornerRadius = 8
        view.customButton.setImage(UIImage(systemName: "plus"), for: .normal)
        view.customButton.tintColor = .white
        return view
    }()
    
    // 컨텐츠: "나는 오늘"
    let writeDiaryLabel: UILabel = {
        let view = UILabel()
        view.text = "\"나는 오늘\""
        view.font = .boldSystemFont(ofSize: 20)
        view.numberOfLines = 1
        view.textAlignment = .left
        view.textColor = .black
        view.backgroundColor = .white
        return view
    }()
    
    let writeDiaryView: WriteDiaryView = {
        let view = WriteDiaryView()
        view.backgroundColor = UIColor(named: "calendar-background")
        view.layer.cornerRadius = 8
        return view
    }()
    
    override func configureUI() {
        [noteBackgroundView, selectEmotionLabel, selectEmoticonView, selectImageLabel, selectImageView, writeDiaryLabel, writeDiaryView].forEach {
            addSubview($0)
        }
        
    }
    
    override func setConstraint() {
        
        self.snp.makeConstraints { make in
            make.bottom.equalTo(writeDiaryView.snp.bottom).offset(60)
        }
        
        noteBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(self)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(writeDiaryView.snp.bottom).offset(100)
        }
        
        selectEmotionLabel.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)
        selectEmotionLabel.snp.makeConstraints { make in
            make.top.equalTo(noteBackgroundView.snp.top).offset(20)
            make.leading.equalTo(selectEmoticonView)
        }
        
        selectEmoticonView.snp.makeConstraints { make in
            make.top.equalTo(selectEmotionLabel.snp.bottom).offset(12)
            make.centerX.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.65)
            make.height.equalTo(selectEmoticonView.snp.width)
        }
        
        selectImageLabel.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)
        selectImageLabel.snp.makeConstraints { make in
            make.top.equalTo(selectEmoticonView.snp.bottom).offset(20)
            make.leading.equalTo(selectImageView)
        }
        
        selectImageView.snp.makeConstraints { make in
            make.top.equalTo(selectImageLabel.snp.bottom).offset(12)
            make.centerX.equalTo(self)
            make.width.equalTo(selectEmoticonView)
            make.height.equalTo(60)
        }
        
        writeDiaryLabel.setContentHuggingPriority(.init(rawValue: 251), for: .vertical)
        writeDiaryLabel.snp.makeConstraints { make in
            make.top.equalTo(selectImageView.snp.bottom).offset(20)
            make.leading.equalTo(selectImageView)
        }
        
        writeDiaryView.setContentHuggingPriority(.init(rawValue: 250), for: .vertical)
        writeDiaryView.snp.makeConstraints { make in
            make.top.equalTo(writeDiaryLabel.snp.bottom).offset(12)
            make.centerX.equalTo(self)
            make.width.equalTo(selectImageView)
            
        }
    }
}



//UI

//
//























//Setting


//

//writeDiaryLabel.snp.makeConstraints { make in
//    make.top.equalTo(selectImageView.snp.bottom).offset(20)
//    make.leading.equalTo(selectImageView)
//}
//
//writeDiaryView.snp.makeConstraints { make in
//    make.top.equalTo(writeDiaryLabel.snp.bottom).offset(12)
//    make.centerX.equalTo(self)
//    make.width.equalTo(selectImageView)
//    make.height.greaterThanOrEqualTo(120)
//}
//
//emptyView.snp.makeConstraints { make in
//    make.top.equalTo(writeDiaryView.snp.bottom).offset(12)
//    make.height.equalTo(300)
//    make.width.equalTo(self).multipliedBy(0.8)
//}

//
//  UpdateContentView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/14.
//

import UIKit
import SnapKit

class UpdateView: BaseView {
    
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "patrick-tomasso-Oaqk7qqNh_c-unsplash")
        view.contentMode = .scaleAspectFill
        view.layer.opacity = 0.2
        return view
    }()
    
    // 타이틀: 날짜 라벨
    let titleLabel: UILabel = {
        let view = UILabel()
        view.text = "9월 14일 수요일"
        view.font = .boldSystemFont(ofSize: 28)
        view.numberOfLines = 0
        view.textAlignment = .center
        view.textColor = .white
        view.backgroundColor = .black
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
        view.layer.opacity = 0.8
        return view
    }()
    
    // 취소 버튼
    let dismissView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .systemPink
        view.customImageView.image = UIImage(systemName: "xmark")
        view.layer.cornerRadius = 8
        return view
    }()
    
    // 저장 버튼
    let saveView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .green
        view.customButton.setTitle("저장", for: .normal)
        view.layer.cornerRadius = 8
        return view
    }()
    
    // 배경: 노트 배경
    let noteBackgroundView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "valentin-salja-CLvkkjb-i3g-unsplash")
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .darkGray
        return view
    }()
    
    // 배경: 노트 스프링1
    let leftLineView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "spring")
        view.contentMode = .scaleToFill
        view.tintColor = .black
        return view
    }()
    
    // 배경: 노트 스프링2
    let centerLineView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "spring")
        view.contentMode = .scaleToFill
        view.tintColor = .black
        return view
    }()
    
    // 배경: 노트 스프링3
    let rightLineView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "spring")
        view.contentMode = .scaleToFill
        view.tintColor = .black
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
        return view
    }()
    
    let writeDiaryView: WriteDiaryView = {
        let view = WriteDiaryView()
        view.backgroundColor = UIColor(named: "calendar-background")
        view.layer.cornerRadius = 8
        return view
    }()
    
    let emptyView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    override func configureUI() {
        [backgroundImage, titleLabel, dismissView, saveView, noteBackgroundView, leftLineView, centerLineView, rightLineView, selectEmotionLabel, selectEmoticonView, selectImageLabel, selectImageView, writeDiaryLabel, writeDiaryView, emptyView].forEach {
            addSubview($0)
        }
        
    }
    
    override func setConstraint() {
        
        self.snp.makeConstraints { make in
            make.bottom.equalTo(writeDiaryView.snp.bottom).offset(200)
        }
                
        backgroundImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.bottom.equalTo(noteBackgroundView.snp.top)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(safeAreaLayoutGuide).offset(12)
            make.width.equalTo(self).multipliedBy(0.6)
            make.height.equalTo(40)
        }
        
        dismissView.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.leading.equalTo(self).offset(20)
            make.height.equalTo(32)
            make.width.equalTo(dismissView.snp.height)
        }
        
        saveView.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel)
            make.trailing.equalTo(self).offset(-20)
            make.height.equalTo(32)
            make.width.equalTo(saveView.snp.height)
        }
        
        noteBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(40)
            make.leading.trailing.equalTo(self)
            make.bottom.equalTo(writeDiaryView.snp.bottom).offset(200)
        }
        
        centerLineView.snp.makeConstraints { make in
            make.centerY.equalTo(noteBackgroundView.snp.top)
            make.centerX.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.4)
            make.height.equalTo(88)
        }
        
        leftLineView.snp.makeConstraints { make in
            make.centerY.equalTo(noteBackgroundView.snp.top)
            make.leading.equalTo(self).offset(-28)
            make.width.equalTo(self).multipliedBy(0.4)
            make.height.equalTo(88)
        }
        
        rightLineView.snp.makeConstraints { make in
            make.centerY.equalTo(noteBackgroundView.snp.top)
            make.trailing.equalTo(self).offset(28)
            make.width.equalTo(self).multipliedBy(0.4)
            make.height.equalTo(88)
        }
        
        selectEmotionLabel.snp.makeConstraints { make in
            make.top.equalTo(noteBackgroundView.snp.top).offset(60)
            make.leading.equalTo(selectEmoticonView)
        }
        
        selectEmoticonView.snp.makeConstraints { make in
            make.top.equalTo(selectEmotionLabel.snp.bottom).offset(12)
            make.centerX.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.65)
            make.height.equalTo(selectEmoticonView.snp.width)
        }
        
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
        
        writeDiaryLabel.snp.makeConstraints { make in
            make.top.equalTo(selectImageView.snp.bottom).offset(20)
            make.leading.equalTo(selectImageView)
        }
        
        writeDiaryView.snp.makeConstraints { make in
            make.top.equalTo(writeDiaryLabel.snp.bottom).offset(12)
            make.centerX.equalTo(self)
            make.width.equalTo(selectImageView)
            make.height.greaterThanOrEqualTo(120)
        }
//
//        emptyView.snp.makeConstraints { make in
//            make.top.equalTo(writeDiaryView.snp.bottom)
//            make.height.equalTo(80)
//            make.width.equalTo(self).multipliedBy(0.8)
//        }

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

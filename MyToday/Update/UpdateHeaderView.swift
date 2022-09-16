//
//  UpdateHeaderView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/15.
//

import UIKit
import SnapKit

class UpdateHeaderView: BaseView {
    
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "patrick-tomasso-Oaqk7qqNh_c-unsplash")
        view.contentMode = .scaleAspectFill
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
        view.backgroundColor = .systemYellow
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
    
    override func configureUI() {
        [backgroundImage, titleLabel, dismissView, saveView, noteBackgroundView, leftLineView, centerLineView, rightLineView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
//        self.snp.makeConstraints { make in
//            make.height.equalTo(500)
//        }
        
        backgroundImage.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(self)
            make.bottom.equalTo(titleLabel.snp.bottom).offset(40)
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
            make.height.equalTo(40)
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
    }
}

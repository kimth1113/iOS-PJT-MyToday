//
//  CalendarView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/07.
//

import UIKit
import SnapKit
import FSCalendar

class CalendarView: BaseView {
    
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = Constants.BaseImage.background
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let comeBackButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "arrow.2.squarepath"), for: .normal)
        view.tintColor = .black
        return view
    }()
    
    let calendar: FSCalendar = {
        let view = FSCalendar()

//        view.layer.cornerRadius = 20
        
        //언어 한국어로 변경
        view.locale = Locale(identifier: "ko_KR")
        
        //MARK: -상단 헤더 뷰 관련
        view.headerHeight = 0 // YYYY년 M월 표시부 영역 높이
        view.weekdayHeight = 0
//        view.appearance.headerMinimumDissolvedAlpha = 0.0 //헤더 좌,우측 흐릿한 글씨 삭제
//        view.appearance.headerDateFormat = "YYYY년 M월" //날짜(헤더) 표시 형식
//        view.appearance.headerTitleColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
       
        //MARK: -캘린더(날짜 부분) 관련
//        view.appearance.selectionColor = .none //선택 된 날의 동그라미 색
//        view.appearance.titleDefaultColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1) //기본 날짜 색
        view.appearance.titleSelectionColor = .none
        
        
        //MARK: -오늘 날짜(Today) 관련
//        view.appearance.titleTodayColor = .green //Today에 표시되는 특정 글자색
//        view.appearance.todayColor = .none //Today에 표시되는 선택 전 동그라미 색
//        view.appearance.todaySelectionColor = .none  //Today에 표시되는 선택 후 동그라미 색
        
        // Month 폰트 설정
//        view.appearance.headerTitleFont = .boldSystemFont(ofSize: 28)
        
        // day 폰트 설정
        view.appearance.titleFont = Constants.BaseFont.Calendar.title
        
//        view.appearance.headerTitleOffset = CGPoint(x: 0, y: -4)
        view.appearance.titleOffset = CGPoint(x: 0, y: 4)
//        view.appearance.imageOffset = CGPoint(x: 0, y: 0)
//        view.appearance.titlePlaceholderColor = .black
//        view.appearance.borderSelectionColor = .black
//        view.appearance.borderRadius = 0.1
        
        return view
    }()
    ////////////////
    let headerButton: UIButton = {
        let view = UIButton()
//        view.numberOfLines = 2
//        view.textAlignment = .center
        view.titleLabel?.font = Constants.BaseFont.Calendar.header
        view.setTitleColor(.black, for: .normal)
        view.layer.opacity = 0.6
        view.titleLabel?.lineBreakMode = .byCharWrapping
        view.titleLabel?.textAlignment = .center
        return view
    }()
    
    let leftButton: UIButton = {
        let view = UIButton()
        view.setImage(Constants.BaseImage.leftArrow, for: .normal)
        view.tintColor = .black
        view.layer.opacity = 0.4
        return view
    }()
    
    let rightButton: UIButton = {
        let view = UIButton()
        view.setImage(Constants.BaseImage.rightArrow, for: .normal)
        view.tintColor = .black
        view.layer.opacity = 0.4
        return view
    }()
    
    override func configureUI() {
        [backgroundImage, comeBackButton, calendar, headerButton, leftButton, rightButton].forEach {
            addSubview($0)
        }
    }
    
    
    
    override func setConstraint() {
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        comeBackButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.trailing.equalTo(self).offset(-20)
//            make.height.width.equalTo(40)
        }
        
        headerButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
            make.centerX.equalTo(self)
        }
        
        calendar.snp.makeConstraints { make in
            make.top.equalTo(headerButton.snp.bottom)
            make.width.equalTo(self).multipliedBy(0.9)
            make.height.equalTo(calendar.snp.width).multipliedBy(0.9)
            make.centerX.equalTo(self)
        }
        
        leftButton.snp.makeConstraints { make in
            make.width.height.equalTo(60)
            make.centerY.equalTo(headerButton)
            make.trailing.equalTo(headerButton.snp.leading).offset(-20)
        }
        
        rightButton.snp.makeConstraints { make in
            make.width.height.equalTo(60)
            make.centerY.equalTo(headerButton)
            make.leading.equalTo(headerButton.snp.trailing).offset(20)
        }
    }
}

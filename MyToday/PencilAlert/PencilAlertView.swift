//
//  PencelAlertView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/18.
//

import UIKit
import SnapKit

class PencilAlertView: BaseView {
    
    let alertBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    let cancelButtonView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .red
        view.customButton.setTitle("취소", for: .normal)
        return view
    }()
    
    let alertImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    let alertTitleLabel: UILabel = {
        let view = UILabel()
        view.text = "일자 선택"
        view.font = .boldSystemFont(ofSize: 12)
        return view
    }()
    
    let askLabel: UILabel = {
        let view = UILabel()
        view.text = "언제를 기록할 건가요?\n(미래는 기록할 수 없어요.)"
        view.numberOfLines = 2
        view.textColor = .black
        return view
    }()
    
    let underline: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    
    let todayButtonView: CustomButtonView = {
        let view = CustomButtonView()
        view.customButton.setTitle("오늘", for: .normal)
        view.backgroundColor = .red
        return view
    }()
    
    let yesterdayButtonView: CustomButtonView = {
        let view = CustomButtonView()
        view.customButton.setTitle("어제", for: .normal)
        view.backgroundColor = .orange
        return view
    }()
    
    let specialButtonView: CustomButtonView = {
        let view = CustomButtonView()
        view.customButton.setTitle("다른 날짜 작성하기", for: .normal)
        view.customButton.setTitleColor(.black, for: .normal)
        view.backgroundColor = .white
        return view
    }()
    
    let datePicker: UIDatePicker = {
        let view = UIDatePicker()
        view.datePickerMode = .date
        view.locale = Locale(identifier: "ko-KR")
        view.timeZone = .autoupdatingCurrent
        view.backgroundColor = UIColor(rgb: 0xfaf4e4)
        view.tintColor = .yellow
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        
        view.isHidden = true
        view.layer.opacity = 0
        
        let maximumDate = Calendar.current.date(byAdding: .day, value: -2, to: Date())
        view.maximumDate = maximumDate
        
//        view.isHidden = true
        
        return view
    }()
    
    let doneButtonView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .systemOrange
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.isHidden = true
        view.layer.opacity = 0
        return view
    }()
    
    override func configureUI() {
//        backgroundColor = .white
        backgroundColor = Constants.BaseColor.PencilAlert.background

        [alertBackgroundView, cancelButtonView, alertImageView, alertTitleLabel, askLabel, underline, todayButtonView, yesterdayButtonView, specialButtonView, datePicker, doneButtonView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        alertBackgroundView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.9)
        }
        
        cancelButtonView.snp.makeConstraints { make in
            make.top.trailing.equalTo(alertBackgroundView).inset(12)
            make.width.height.equalTo(20)
        }
        
        alertImageView.snp.makeConstraints { make in
            make.top.equalTo(cancelButtonView.snp.bottom).offset(12)
            make.leading.equalTo(alertBackgroundView).offset(12)
            make.height.width.equalTo(60)
        }
        
        alertTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(alertImageView)
            make.leading.equalTo(alertImageView.snp.trailing).offset(20)
            make.trailing.equalTo(alertBackgroundView).inset(20)
        }
        
        askLabel.snp.makeConstraints { make in
            make.top.equalTo(alertTitleLabel.snp.bottom).offset(4)
            make.leading.equalTo(alertImageView.snp.trailing).offset(20)
            make.trailing.equalTo(alertBackgroundView).inset(20)
            make.bottom.equalTo(alertImageView)
        }
        
        underline.snp.makeConstraints { make in
            make.leading.trailing.equalTo(alertBackgroundView).inset(12)
            make.top.equalTo(alertImageView.snp.bottom).offset(20)
            make.height.equalTo(1)
        }
        
        yesterdayButtonView.snp.makeConstraints { make in
            make.top.equalTo(underline).offset(20)
            make.bottom.equalTo(alertBackgroundView).offset(-20)
            make.height.equalTo(20)
            make.trailing.equalTo(cancelButtonView)
        }
        
        todayButtonView.snp.makeConstraints { make in
            make.centerY.equalTo(yesterdayButtonView)
            make.trailing.equalTo(yesterdayButtonView.snp.leading).offset(-20)
            make.height.equalTo(20)
        }
        
        specialButtonView.snp.makeConstraints { make in
            make.centerY.equalTo(yesterdayButtonView)
            make.leading.equalTo(alertBackgroundView).offset(20)
            make.height.equalTo(20)
        }
        
        datePicker.snp.makeConstraints { make in
            make.leading.trailing.equalTo(alertBackgroundView)
            make.height.equalTo(100)
            make.top.equalTo(alertBackgroundView.snp.bottom).offset(20)
        }
        
        doneButtonView.snp.makeConstraints { make in
            make.top.equalTo(datePicker.snp.bottom).offset(20)
            make.trailing.equalTo(datePicker)
            make.width.equalTo(60)
            make.height.equalTo(36)
        }
    }
}

extension PencilAlertView {
    func creatToolbar() -> UIToolbar { // custom Toolbar 만들기
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed)) // done 버튼 누를시 donePressed 함수 실행
        toolBar.setItems([doneButton], animated: true) // 툴바에 done버튼 추가
        return toolBar
    }
    
    @objc func donePressed() { // done 버튼 누를시 실행할 함수
        
    }
}

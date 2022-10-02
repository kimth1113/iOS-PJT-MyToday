//
//  CalendarAlertViewController.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/28.
//

import UIKit
import SnapKit

class DateAlertViewController: BaseViewController {
    
    let allYear = Array(2000...Int(FormatterRepository.yearFormatter.string(from: Date()))!)
    let allMonth = Array(1...12)
    var selectedYear: Int?
    var selectedMonth: Int?
    
    var goThisMonth: ((Date) -> Void)?
    var analysisThisMonth: ((Date) -> Void)?
    
    let backgroundView: UIView = {
        let view = UIView()
        return view
    }()
    
    let selectView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 0.9)
        view.layer.cornerRadius = 8
        return view
    }()
    
    let yearLabel: UILabel = {
        let view = UILabel()
        view.text = FormatterRepository.yearFormatter.string(from: Date())
        view.font = Constants.BaseFont.DateAlert.year
        view.textColor = .white
        return view
    }()
    
    let leftButton: UIButton = {
        let view = UIButton()
        view.setImage(Constants.BaseImage.leftArrow, for: .normal)
        view.tintColor = .white
        view.layer.opacity = 0.8
        return view
    }()
    
    let rightButton: UIButton = {
        let view = UIButton()
        view.setImage(Constants.BaseImage.rightArrow, for: .normal)
        view.tintColor = .white
        view.layer.opacity = 0.8
        return view
    }()
    
    let janButton: UIButton = {
        let view = UIButton()
        view.setTitle("1월", for: .normal)
        view.titleLabel?.font = Constants.BaseFont.DateAlert.month
        view.setTitleColor(.white, for: .normal)
        view.tag = 1
        return view
    }()
    
    let febButton: UIButton = {
        let view = UIButton()
        view.setTitle("2월", for: .normal)
        view.titleLabel?.font = Constants.BaseFont.DateAlert.month
        view.setTitleColor(.white, for: .normal)
        view.tag = 2
        return view
    }()
    
    let marButton: UIButton = {
        let view = UIButton()
        view.setTitle("3월", for: .normal)
        view.titleLabel?.font = Constants.BaseFont.DateAlert.month
        view.setTitleColor(.white, for: .normal)
        view.tag = 3
        return view
    }()
    
    let aprButton: UIButton = {
        let view = UIButton()
        view.setTitle("4월", for: .normal)
        view.titleLabel?.font = Constants.BaseFont.DateAlert.month
        view.setTitleColor(.white, for: .normal)
        view.tag = 4
        return view
    }()
    
    let mayButton: UIButton = {
        let view = UIButton()
        view.setTitle("5월", for: .normal)
        view.titleLabel?.font = Constants.BaseFont.DateAlert.month
        view.setTitleColor(.white, for: .normal)
        view.tag = 5
        return view
    }()
    
    let juneButton: UIButton = {
        let view = UIButton()
        view.setTitle("6월", for: .normal)
        view.titleLabel?.font = Constants.BaseFont.DateAlert.month
        view.setTitleColor(.white, for: .normal)
        view.tag = 6
        return view
    }()
    
    let julyButton: UIButton = {
        let view = UIButton()
        view.setTitle("7월", for: .normal)
        view.titleLabel?.font = Constants.BaseFont.DateAlert.month
        view.setTitleColor(.white, for: .normal)
        view.tag = 7
        return view
    }()
    
    let augButton: UIButton = {
        let view = UIButton()
        view.setTitle("8월", for: .normal)
        view.titleLabel?.font = Constants.BaseFont.DateAlert.month
        view.setTitleColor(.white, for: .normal)
        view.tag = 8
        return view
    }()
    
    let sepButton: UIButton = {
        let view = UIButton()
        view.setTitle("9월", for: .normal)
        view.titleLabel?.font = Constants.BaseFont.DateAlert.month
        view.setTitleColor(.white, for: .normal)
        view.tag = 9
        return view
    }()
    
    let octButton: UIButton = {
        let view = UIButton()
        view.setTitle("10월", for: .normal)
        view.titleLabel?.font = Constants.BaseFont.DateAlert.month
        view.setTitleColor(.white, for: .normal)
        view.tag = 10
        return view
    }()
    
    let novButton: UIButton = {
        let view = UIButton()
        view.setTitle("11월", for: .normal)
        view.titleLabel?.font = Constants.BaseFont.DateAlert.month
        view.setTitleColor(.white, for: .normal)
        view.tag = 11
        return view
    }()
    
    let decButton: UIButton = {
        let view = UIButton()
        view.setTitle("12월", for: .normal)
        view.titleLabel?.font = Constants.BaseFont.DateAlert.month
        view.setTitleColor(.white, for: .normal)
        view.tag = 12
        return view
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [janButton, febButton, marButton, aprButton])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 20
        return view
    }()
    
    lazy var horizontalStackView2: UIStackView = {
        let view = UIStackView(arrangedSubviews: [mayButton, juneButton, julyButton, augButton])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 20
        return view
    }()
    
    lazy var horizontalStackView3: UIStackView = {
        let view = UIStackView(arrangedSubviews: [sepButton, octButton, novButton, decButton])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 20
        return view
    }()
    
    lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [horizontalStackView, horizontalStackView2, horizontalStackView3])
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 20
        return view
    }()
    
    lazy var monthButtonList = [janButton, febButton, marButton, aprButton, mayButton, juneButton, julyButton, augButton, sepButton, octButton, novButton, decButton]
    
    override func viewDidLoad() {
        
        let tapTerm = UITapGestureRecognizer(target: self, action: #selector(tapSelectView))
        backgroundView.addGestureRecognizer(tapTerm)
        
        [backgroundView, selectView, yearLabel, leftButton, rightButton, verticalStackView].forEach {
            view.addSubview($0)
        }
        
        backgroundView.snp.makeConstraints { make in
            make.edges.equalTo(view)
        }
        
        selectView.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
            make.leading.trailing.bottom.equalTo(verticalStackView).inset(-40)
            make.top.equalTo(yearLabel).inset(-40)
        }
        
        yearLabel.snp.makeConstraints { make in
            make.centerX.equalTo(selectView)
        }
        
        leftButton.snp.makeConstraints { make in
            make.centerY.equalTo(yearLabel)
            make.trailing.equalTo(yearLabel.snp.leading).offset(-20)
        }
        
        rightButton.snp.makeConstraints { make in
            make.centerY.equalTo(yearLabel)
            make.leading.equalTo(yearLabel.snp.trailing).offset(20)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.centerX.equalTo(selectView)
            make.top.equalTo(yearLabel.snp.bottom).offset(32)
        }
        
        leftButton.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        rightButton.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        
        for i in 0 ..< monthButtonList.count {
            monthButtonList[i].addTarget(self, action: #selector(monthButtonTapped), for: .touchUpInside)
        }
    }
    
    @objc
    func tapSelectView() {
        dismiss(animated: true)
    }
    
    @objc
    func monthButtonTapped(_ sender: UIButton) {
        for i in 1...monthButtonList.count {
            if sender.tag == i {
                
                if let goThisMonth = goThisMonth {
                    goThisMonth(FormatterRepository.calendarMonthFormatter.date(from: "\(yearLabel.text!)\n\(i)")!)
                } else {
                    analysisThisMonth!(FormatterRepository.calendarMonthFormatter.date(from: "\(yearLabel.text!)\n\(i)")!)
                }
                break
            }
        }
        dismiss(animated: false)
    }
    
    @objc
    func leftButtonTapped(_ sender: UIButton) {
        yearLabel.text = String(Int(yearLabel.text!)! - 1)
    }
    
    @objc
    func rightButtonTapped(_ sender: UIButton) {
        yearLabel.text = String(Int(yearLabel.text!)! + 1)
    }
    
    override func configure() {
    }
}

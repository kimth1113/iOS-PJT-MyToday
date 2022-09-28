//
//  AnalysisView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/24.
//

import UIKit
import SnapKit

class AnalysisView: BaseView {
    
    let headerButton: UIButton = {
        let view = UIButton()
        view.setTitle("2022 09", for: .normal)
        view.titleLabel?.font = Constants.BaseFont.Calendar.header
        view.titleLabel?.textColor = Constants.BaseColor.white
        view.titleLabel?.lineBreakMode = .byCharWrapping
        view.titleLabel?.textAlignment = .center
        return view
    }()
    
    let leftButton: UIButton = {
        let view = UIButton()
        view.setImage(Constants.BaseImage.leftArrow, for: .normal)
        view.tintColor = Constants.BaseColor.white
        view.layer.opacity = 0.5
        return view
    }()
    
    let rightButton: UIButton = {
        let view = UIButton()
        view.setImage(Constants.BaseImage.rightArrow, for: .normal)
        view.tintColor = Constants.BaseColor.white
        view.layer.opacity = 0.5
        return view
    }()
    
    let analysisMonthView: AnalysisMonthView = {
        let view = AnalysisMonthView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    let analysisRandomView: AnalysisRandomView = {
        let view = AnalysisRandomView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    let analysisEmoticonView: AnalysisEmoticonView = {
        let view = AnalysisEmoticonView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    let analysisRankView: AnalysisRankView = {
        let view = AnalysisRankView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 8
        return view
    }()
    
    override func configureUI() {
        backgroundColor = .systemOrange
        
        [headerButton, leftButton, rightButton, analysisMonthView, analysisRandomView, analysisEmoticonView, analysisRankView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        headerButton.snp.makeConstraints { make in
            make.top.equalTo(self.safeAreaLayoutGuide).offset(20)
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
        
        analysisMonthView.snp.makeConstraints { make in
            make.top.equalTo(headerButton.snp.bottom).offset(20)
            make.leading.equalTo(self).offset(12)
            make.trailing.equalTo(analysisEmoticonView.snp.leading).offset(-12)
            make.width.equalTo(analysisMonthView.snp.height)
        }
        
        analysisRandomView.snp.makeConstraints { make in
            make.top.equalTo(analysisMonthView.snp.bottom).offset(12)
            make.leading.equalTo(self).offset(12)
            make.trailing.equalTo(analysisEmoticonView.snp.leading).offset(-12)
            make.width.equalTo(analysisRandomView.snp.height)
        }
        
        analysisEmoticonView.snp.makeConstraints { make in
            make.top.equalTo(headerButton.snp.bottom).offset(20)
            make.trailing.equalTo(self).inset(12)
            make.bottom.equalTo(analysisRandomView)
            make.width.equalTo(self).multipliedBy(0.55)
        }
        
        analysisRankView.snp.makeConstraints { make in
            make.top.equalTo(analysisEmoticonView.snp.bottom).offset(12)
            make.leading.trailing.equalTo(self).inset(12)
            make.height.equalTo(analysisRankView.snp.width).multipliedBy(0.5)
        }
    }
}


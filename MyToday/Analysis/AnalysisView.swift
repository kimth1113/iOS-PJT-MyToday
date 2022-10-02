//
//  AnalysisView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/24.
//

import UIKit
import SnapKit

class AnalysisView: BaseView {
    
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = Constants.BaseImage.Analysis.background
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let dateButton: UIButton = {
        let view = UIButton()
        
        view.setTitle(FormatterRepository.analysisMonthFormatter.string(from: Date()), for: .normal)
        view.titleLabel?.font = Constants.BaseFont.Analysis.header
        view.setTitleColor(.black, for: .normal)
        view.layer.opacity = 0.6
        view.titleLabel?.textAlignment = .center
        return view
    }()
    
    let leftButton: UIButton = {
        let view = UIButton()
        view.setImage(Constants.BaseImage.leftArrow, for: .normal)
        view.tintColor = .black
        view.layer.opacity = 0.5
        return view
    }()
    
    let rightButton: UIButton = {
        let view = UIButton()
        view.setImage(Constants.BaseImage.rightArrow, for: .normal)
        view.tintColor = .black
        view.layer.opacity = 0.5
        return view
    }()
    
    let analysisMonthView: AnalysisMonthView = {
        let view = AnalysisMonthView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8)
        view.layer.cornerRadius = 8
        return view
    }()
    
    let analysisRandomView: AnalysisRandomView = {
        let view = AnalysisRandomView()
        view.backgroundColor = UIColor(red: 18/255, green: 137/255, blue: 167/255, alpha: 0.2)
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        return view
    }()
    
    let analysisEmoticonView: AnalysisEmoticonView = {
        let view = AnalysisEmoticonView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        view.layer.cornerRadius = 8
        return view
    }()
    
    let analysisRankView: AnalysisRankView = {
        let view = AnalysisRankView()
        view.backgroundColor = UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5)
        view.layer.cornerRadius = 8
        return view
    }()
    
    let authorizeLabel: UILabel = {
        let view = UILabel()
        view.text = "본 분석은 한국전자통신연구원의 언어 처리 API에서 지원받았습니다."
        view.textAlignment = .center
        view.font = Constants.BaseFont.Analysis.label
        view.textColor = .black
        view.layer.opacity = 0.5
        view.adjustsFontSizeToFitWidth = true
        view.minimumScaleFactor = 0.5
        return view
    }()
    
    override func configureUI() {
        
        [backgroundImage, dateButton, leftButton, rightButton, analysisMonthView, analysisRandomView, analysisEmoticonView, analysisRankView, authorizeLabel].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        dateButton.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.centerX.equalTo(self)
        }
        
        leftButton.snp.makeConstraints { make in
            make.width.height.equalTo(60)
            make.centerY.equalTo(dateButton)
            make.trailing.equalTo(dateButton.snp.leading).offset(-20)
        }
        
        rightButton.snp.makeConstraints { make in
            make.width.height.equalTo(60)
            make.centerY.equalTo(dateButton)
            make.leading.equalTo(dateButton.snp.trailing).offset(20)
        }
        
        analysisMonthView.snp.makeConstraints { make in
            make.top.equalTo(dateButton.snp.bottom).offset(20)
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
            make.top.equalTo(dateButton.snp.bottom).offset(20)
            make.trailing.equalTo(self).inset(12)
            make.bottom.equalTo(analysisRandomView)
            make.width.equalTo(self).multipliedBy(0.55)
        }
        
        analysisRankView.snp.makeConstraints { make in
            make.top.equalTo(analysisEmoticonView.snp.bottom).offset(12)
            make.leading.trailing.equalTo(self).inset(12)
            make.height.equalTo(analysisRankView.snp.width).multipliedBy(0.5)
        }
        
        authorizeLabel.snp.makeConstraints { make in
            make.top.equalTo(analysisRankView.snp.bottom).offset(8)
            make.leading.trailing.equalTo(analysisRankView)
        }
    }
}


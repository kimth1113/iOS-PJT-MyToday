//
//  SettingView.swift
//  MyToday
//
//  Created by 김태현 on 2022/10/03.
//

import UIKit
import SnapKit

class SettingView: BaseView {
    
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = Constants.BaseImage.Analysis.background
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let header: UILabel = {
        let view = UILabel()
        view.text = "정보"
        view.font = Constants.BaseFont.Analysis.header
        view.textColor = .black
        view.layer.opacity = 0.6
        return view
    }()
    
    let appInfoView: AppInfoView = {
        let view = AppInfoView()
        view.backgroundColor = UIColor(red: 18/255, green: 137/255, blue: 167/255, alpha: 0.2)
        view.layer.cornerRadius = 8
        return view
    }()
    
    let reviewButtonView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = UIColor(red: 255/255, green: 107/255, blue: 129/255, alpha: 0.3)
        view.layer.cornerRadius = 8
        view.customButton.setTitle("리뷰쓰기", for: .normal)
        view.customButton.titleLabel?.font = Constants.BaseFont.DiaryList.header
        view.customButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8), for: .normal)
        return view
    }()
    
    let openInfoButtonView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = UIColor(red: 255/255, green: 107/255, blue: 129/255, alpha: 0.3)
        view.layer.cornerRadius = 8
        view.customButton.setTitle("오픈소스\n라이센스", for: .normal)
        view.customButton.titleLabel?.textAlignment = .center
        view.customButton.titleLabel?.lineBreakMode = .byWordWrapping
        view.customButton.titleLabel?.font = Constants.BaseFont.DiaryList.header
        view.customButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8), for: .normal)
        return view
    }()
    
    let mailButtonView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = UIColor(red: 18/255, green: 137/255, blue: 167/255, alpha: 0.2)
        view.layer.cornerRadius = 8
        view.customButton.setTitle("개발자\n메일문의", for: .normal)
        view.customButton.titleLabel?.textAlignment = .center
        view.customButton.titleLabel?.lineBreakMode = .byWordWrapping
        view.customButton.titleLabel?.font = Constants.BaseFont.DiaryList.header
        view.customButton.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.8), for: .normal)
        return view
    }()
    
    override func configureUI() {
        [backgroundImage, header, appInfoView, reviewButtonView, openInfoButtonView, mailButtonView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        header.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.centerX.equalTo(self)
        }
        
        appInfoView.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(12)
            make.leading.equalTo(self).offset(12)
            make.trailing.equalTo(reviewButtonView.snp.leading).offset(-12)
            make.width.equalTo(reviewButtonView)
            make.height.equalTo(appInfoView.snp.width)
        }
        
        reviewButtonView.snp.makeConstraints { make in
            make.top.equalTo(header.snp.bottom).offset(12)
            make.trailing.equalTo(self).offset(-12)
            make.height.equalTo(reviewButtonView.snp.width)
        }
        
        openInfoButtonView.snp.makeConstraints { make in
            make.top.equalTo(appInfoView.snp.bottom).offset(12)
            make.leading.trailing.equalTo(appInfoView)
            make.height.equalTo(openInfoButtonView.snp.width)
        }
        
        mailButtonView.snp.makeConstraints { make in
            make.top.equalTo(appInfoView.snp.bottom).offset(12)
            make.leading.trailing.equalTo(reviewButtonView)
            make.height.equalTo(openInfoButtonView.snp.width)
        }
    }
}

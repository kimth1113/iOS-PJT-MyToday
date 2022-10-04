//
//  AppInfoView.swift
//  MyToday
//
//  Created by 김태현 on 2022/10/03.
//

import UIKit
import SnapKit

class AppInfoView: BaseView {
    
    let iOSLabel: UILabel = {
        let view = UILabel()
        view.text = "for iOS"
        view.font = Constants.BaseFont.DiaryList.date
        view.textColor = .white
        view.layer.opacity = 0.5
        return view
    }()
    
    let versionLabel: UILabel = {
        let view = UILabel()
        view.text = "v1.0 [Beta]"
        view.font = Constants.BaseFont.DiaryList.header
        view.textColor = .white
        view.layer.opacity = 0.8
        return view
    }()
    
    let authorLabel: UILabel = {
        let view = UILabel()
        view.text = "Developed by TASON\nDesigned by HAJIN"
        view.numberOfLines = 2
        view.font = Constants.BaseFont.DiaryList.date
        view.textColor = .white
        view.layer.opacity = 0.65
        view.textAlignment = .center
        return view
    }()
    
    override func configureUI() {
        [iOSLabel, versionLabel, authorLabel].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        iOSLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(8)
            make.centerX.equalTo(self)
        }
        
        versionLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
        }
        
        authorLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(-8)
            make.centerX.equalTo(self)
        }
    }
}

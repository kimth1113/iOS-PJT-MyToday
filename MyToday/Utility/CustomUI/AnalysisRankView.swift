//
//  AnalysisRankView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/25.
//

import UIKit
import SnapKit

class AnalysisRankView: BaseView {
    
    let rankLabel: UILabel = {
        let view = UILabel()
        view.text = "자주 쓰는 단어"
        view.textAlignment = .center
        view.font = Constants.BaseFont.Analysis.title
        view.backgroundColor = UIColor(red: 18/255, green: 137/255, blue: 167/255, alpha: 0.5)
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
        return view
    }()
    
    let rankInfoView: RankInfoView = {
        let view = RankInfoView()
        
        return view
    }()
    
    let rankInfoView2: RankInfoView = {
        let view = RankInfoView()
        
        return view
    }()
    
    let rankInfoView3: RankInfoView = {
        let view = RankInfoView()
        
        return view
    }()
    
    let rankInfoView4: RankInfoView = {
        let view = RankInfoView()
        
        return view
    }()
    
    let rankInfoView5: RankInfoView = {
        let view = RankInfoView()
        
        return view
    }()
    
    let rankInfoView6: RankInfoView = {
        let view = RankInfoView()
        
        return view
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [rankInfoView, rankInfoView2, rankInfoView3])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    lazy var horizontalStackView2: UIStackView = {
        let view = UIStackView(arrangedSubviews: [rankInfoView4, rankInfoView5, rankInfoView6])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [horizontalStackView, horizontalStackView2])
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    
    override func configureUI() {
        [rankLabel, verticalStackView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        rankLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(8)
            make.leading.trailing.equalTo(self).inset(8)
            make.height.equalTo(28)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(rankLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(rankLabel)
            make.bottom.equalTo(self).offset(-8)
        }
    }
}

class RankInfoView: BaseView {
    
    let textLabel: UILabel = {
        let view = UILabel()
        view.text = "..."
        view.textAlignment = .center
        view.numberOfLines = 1
        view.font = Constants.BaseFont.Analysis.title
        view.adjustsFontSizeToFitWidth = true
        view.minimumScaleFactor = 0.5
        view.textColor = UIColor(red: 18/255, green: 137/255, blue: 167/255, alpha: 1)
        return view
    }()
    
    let countLabel: UILabel = {
        let view = UILabel()
        view.text = "5번"
        view.textAlignment = .right
        view.font = Constants.BaseFont.Analysis.label
        view.textColor = UIColor(red: 18/255, green: 137/255, blue: 167/255, alpha: 0.5)
        return view
    }()
    
    override func configureUI() {
        backgroundColor = UIColor(red: 18/255, green: 137/255, blue: 167/255, alpha: 0.2)
        layer.cornerRadius = 4
        
        [textLabel, countLabel].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        textLabel.snp.makeConstraints { make in
            make.top.equalTo(self).offset(4)
            make.leading.trailing.equalTo(self).inset(4)
        }
        
        countLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self).inset(4)
            make.centerX.equalTo(self)
        }
    }
}

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
        view.font = Constants.BaseFont.Calendar.title
        view.backgroundColor = .systemPink
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
    
    let rankInfoView7: RankInfoView = {
        let view = RankInfoView()
        
        return view
    }()
    
    let rankInfoView8: RankInfoView = {
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
            make.height.equalTo(20)
        }
        
        verticalStackView.snp.makeConstraints { make in
            make.top.equalTo(rankLabel.snp.bottom).offset(8)
            make.leading.trailing.equalTo(rankLabel)
            make.bottom.equalTo(self).offset(-8)
        }
    }
}

class RankInfoView: BaseView {
    
    let rankImageView: UIImageView = {
        let view = UIImageView()
        view.image = Constants.BaseImage.leftArrow
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        return view
    }()
    
    let textLabel: UILabel = {
        let view = UILabel()
        view.text = "\"손흥민손민민민\""
        view.textAlignment = .center
        view.numberOfLines = 1
        view.font = .boldSystemFont(ofSize: 12)
        return view
    }()
    
    let countLabel: UILabel = {
        let view = UILabel()
        view.text = "5번"
        view.textAlignment = .right
        view.font = .boldSystemFont(ofSize: 16)
        return view
    }()
    
    override func configureUI() {
        backgroundColor = .systemYellow
        layer.cornerRadius = 8
        
        [rankImageView, textLabel, countLabel].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        rankImageView.snp.makeConstraints { make in
            make.top.leading.equalTo(self).offset(4)
            make.height.equalTo(20)
            make.width.equalTo(rankImageView.snp.height)
        }
        
        textLabel.snp.makeConstraints { make in
            make.bottom.equalTo(self).offset(-12)
            make.leading.trailing.equalTo(self).inset(8)
        }
        
        countLabel.snp.makeConstraints { make in
            make.trailing.equalTo(self).inset(12)
            make.top.equalTo(self).offset(8)
        }
    }
}

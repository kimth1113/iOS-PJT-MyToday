//
//  AnalysisEmoticonView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/25.
//

import UIKit
import SnapKit

class AnalysisEmoticonView: BaseView {
    
    let emotionCountView: EmoticonCountView = {
        let view = EmoticonCountView()
        view.emoticonImageView.image = Constants.BaseImage.emotion2[1]
        return view
    }()
    
    let emotionCountView2: EmoticonCountView = {
        let view = EmoticonCountView()
        view.emoticonImageView.image = Constants.BaseImage.emotion2[2]
        return view
    }()
    
    let emotionCountView3: EmoticonCountView = {
        let view = EmoticonCountView()
        view.emoticonImageView.image = Constants.BaseImage.emotion2[3]
        return view
    }()
    
    let emotionCountView4: EmoticonCountView = {
        let view = EmoticonCountView()
        view.emoticonImageView.image = Constants.BaseImage.emotion2[4]
        return view
    }()
    
    let emotionCountView5: EmoticonCountView = {
        let view = EmoticonCountView()
        view.emoticonImageView.image = Constants.BaseImage.emotion2[5]
        return view
    }()
    
    let emotionCountView6: EmoticonCountView = {
        let view = EmoticonCountView()
        view.emoticonImageView.image = Constants.BaseImage.emotion2[6]
        return view
    }()
    
    let emotionCountView7: EmoticonCountView = {
        let view = EmoticonCountView()
        view.emoticonImageView.image = Constants.BaseImage.emotion2[7]
        return view
    }()
    
    let emotionCountView8: EmoticonCountView = {
        let view = EmoticonCountView()
        view.emoticonImageView.image = Constants.BaseImage.emotion2[8]
        return view
    }()
    
    let emotionCountView9: EmoticonCountView = {
        let view = EmoticonCountView()
        view.emoticonImageView.image = Constants.BaseImage.emotion2[9]
        return view
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [emotionCountView, emotionCountView2, emotionCountView3])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    lazy var horizontalStackView2: UIStackView = {
        let view = UIStackView(arrangedSubviews: [emotionCountView4, emotionCountView5, emotionCountView6])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    lazy var horizontalStackView3: UIStackView = {
        let view = UIStackView(arrangedSubviews: [emotionCountView7, emotionCountView8, emotionCountView9])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [horizontalStackView, horizontalStackView2, horizontalStackView3])
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    override func configureUI() {
        [verticalStackView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        verticalStackView.snp.makeConstraints { make in
            make.edges.equalTo(self).inset(16)
        }
    }
}

class EmoticonCountView: BaseView {
    
    let emoticonImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let countLabel: UILabel = {
        let view = UILabel()
        view.text = "없음"
        view.textColor = .white
        view.textAlignment = .center
        view.font = Constants.BaseFont.Analysis.count
        view.backgroundColor = UIColor(red: 18/255, green: 137/255, blue: 167/255, alpha: 0.5)
        view.layer.cornerRadius = 4
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor(red: 18/255, green: 137/255, blue: 167/255, alpha: 0.2).cgColor
        view.layer.masksToBounds = true
        return view
    }()
    
    override func configureUI() {
        [countLabel, emoticonImageView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
                    
        emoticonImageView.snp.makeConstraints { make in
            make.top.trailing.leading.equalTo(self)
            make.height.equalTo(self).multipliedBy(0.8)
        }
        
        countLabel.snp.makeConstraints { make in
            make.top.equalTo(emoticonImageView.snp.bottom).offset(-8)
            make.bottom.equalTo(self)
            make.trailing.leading.equalTo(self).inset(20)
        }
    }
}

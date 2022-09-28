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

        return view
    }()
    
    let emotionCountView2: EmoticonCountView = {
        let view = EmoticonCountView()

        return view
    }()
    
    let emotionCountView3: EmoticonCountView = {
        let view = EmoticonCountView()

        return view
    }()
    
    let emotionCountView4: EmoticonCountView = {
        let view = EmoticonCountView()

        return view
    }()
    
    let emotionCountView5: EmoticonCountView = {
        let view = EmoticonCountView()

        return view
    }()
    
    let emotionCountView6: EmoticonCountView = {
        let view = EmoticonCountView()

        return view
    }()
    
    let emotionCountView7: EmoticonCountView = {
        let view = EmoticonCountView()

        return view
    }()
    
    let emotionCountView8: EmoticonCountView = {
        let view = EmoticonCountView()

        return view
    }()
    
    let emotionCountView9: EmoticonCountView = {
        let view = EmoticonCountView()

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
            make.trailing.leading.equalTo(self).inset(8)
            make.top.bottom.equalTo(self).inset(8)
        }
    }
}

class EmoticonCountView: BaseView {
    
    let emoticonImageView: UIImageView = {
        let view = UIImageView()
        view.image = Constants.BaseImage.emotion[1]
        return view
    }()
    
    let countLabel: UILabel = {
        let view = UILabel()
        view.text = "3일"
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 16)
        view.backgroundColor = .systemOrange
        view.layer.cornerRadius = 4
        view.layer.masksToBounds = true
        return view
    }()
    
    override func configureUI() {
        backgroundColor = .systemYellow
        layer.cornerRadius = 8
        
        [emoticonImageView, countLabel].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
            
        countLabel.snp.makeConstraints { make in
            make.top.trailing.leading.equalTo(self).inset(4)
            make.height.equalTo(28)
        }
        
        emoticonImageView.snp.makeConstraints { make in
            make.bottom.leading.trailing.equalTo(self)
            make.top.equalTo(countLabel.snp.bottom)
        }
        
    }
}

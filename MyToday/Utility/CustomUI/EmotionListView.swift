//
//  EmotionListView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/13.
//

import UIKit
import SnapKit

class EmotionListView: BaseView {
    
    let emoticonButtonView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .systemYellow
        view.customImageView.image = Constants.BaseImage.emotion[1]
        view.layer.cornerRadius = 5
        view.customButton.tag = 1
        return view
    }()
    
    let emoticonButtonView2: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .systemYellow
        view.customImageView.image = Constants.BaseImage.emotion[2]
        view.layer.cornerRadius = 5
        view.customButton.tag = 2
        return view
    }()
    
    let emoticonButtonView3: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .systemYellow
        view.customImageView.image = Constants.BaseImage.emotion[3]
        view.layer.cornerRadius = 5
        view.customButton.tag = 3
        return view
    }()
    
    let emoticonButtonView4: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .systemYellow
        view.customImageView.image = Constants.BaseImage.emotion[4]
        view.layer.cornerRadius = 5
        view.customButton.tag = 4
        return view
    }()
    
    let emoticonButtonView5: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .systemYellow
        view.customImageView.image = Constants.BaseImage.emotion[5]
        view.layer.cornerRadius = 5
        view.customButton.tag = 5
        return view
    }()
    
    let emoticonButtonView6: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .systemYellow
        view.customImageView.image = Constants.BaseImage.emotion[6]
        view.layer.cornerRadius = 5
        view.customButton.tag = 6
        return view
    }()
    
    let emoticonButtonView7: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .systemYellow
        view.customImageView.image = Constants.BaseImage.emotion[7]
        view.layer.cornerRadius = 5
        view.customButton.tag = 7
        return view
    }()
    
    let emoticonButtonView8: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .systemYellow
        view.customImageView.image = Constants.BaseImage.emotion[8]
        view.layer.cornerRadius = 5
        view.customButton.tag = 8
        return view
    }()
    
    let emoticonButtonView9: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .systemYellow
        view.customImageView.image = Constants.BaseImage.emotion[9]
        view.layer.cornerRadius = 5
        view.customButton.tag = 9
        view.customImageView.tintColor = .black
        return view
    }()
    
    lazy var horizontalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [emoticonButtonView, emoticonButtonView2, emoticonButtonView3])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    lazy var horizontalStackView2: UIStackView = {
        let view = UIStackView(arrangedSubviews: [emoticonButtonView4, emoticonButtonView5, emoticonButtonView6])
        view.axis = .horizontal
        view.alignment = .fill
        view.distribution = .fillEqually
        view.spacing = 8
        return view
    }()
    
    lazy var horizontalStackView3: UIStackView = {
        let view = UIStackView(arrangedSubviews: [emoticonButtonView7, emoticonButtonView8, emoticonButtonView9])
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
        
        addSubview(verticalStackView)
    }
    
    override func setConstraint() {
        
        verticalStackView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.8)
            make.height.equalTo(self).multipliedBy(0.8)
        }
    }
    
}

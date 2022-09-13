//
//  EmotionListView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/13.
//

import UIKit
import SnapKit

class EmotionListView: BaseView {
    
    let buttonListView: UIView = {
        let view = UIView()
        return view
    }()
    
    let emoticonButtonView: CustomButtonView = {
        let view = CustomButtonView()
        view.customImageView.image = UIImage(named: "serious")
        view.layer.cornerRadius = 5
        view.customButton.tag = 1
        return view
    }()
    
    let emoticonButtonView2: CustomButtonView = {
        let view = CustomButtonView()
        view.customImageView.image = UIImage(named: "serious")
        view.layer.cornerRadius = 5
        view.customButton.tag = 2
        return view
    }()
    
    let emoticonButtonView3: CustomButtonView = {
        let view = CustomButtonView()
        view.customImageView.image = UIImage(named: "serious")
        view.layer.cornerRadius = 5
        view.customButton.tag = 3
        return view
    }()
    
    let emoticonButtonView4: CustomButtonView = {
        let view = CustomButtonView()
        view.customImageView.image = UIImage(named: "serious")
        view.layer.cornerRadius = 5
        view.customButton.tag = 4
        return view
    }()
    
    let emoticonButtonView5: CustomButtonView = {
        let view = CustomButtonView()
        view.customImageView.image = UIImage(named: "serious")
        view.layer.cornerRadius = 5
        view.customButton.tag = 5
        return view
    }()
    
    let emoticonButtonView6: CustomButtonView = {
        let view = CustomButtonView()
        view.customImageView.image = UIImage(named: "serious")
        view.layer.cornerRadius = 5
        view.customButton.tag = 6
        return view
    }()
    
    let emoticonButtonView7: CustomButtonView = {
        let view = CustomButtonView()
        view.customImageView.image = UIImage(named: "serious")
        view.layer.cornerRadius = 5
        view.customButton.tag = 7
        return view
    }()
    
    let emoticonButtonView8: CustomButtonView = {
        let view = CustomButtonView()
        view.customImageView.image = UIImage(named: "serious")
        view.layer.cornerRadius = 5
        view.customButton.tag = 8
        return view
    }()
    
    let emoticonButtonView9: CustomButtonView = {
        let view = CustomButtonView()
        view.customImageView.image = UIImage(named: "serious")
        view.layer.cornerRadius = 5
        view.customButton.tag = 9
        return view
    }()
    
    
    override func configureUI() {
        
        [emoticonButtonView, emoticonButtonView2, emoticonButtonView3, emoticonButtonView4, emoticonButtonView5, emoticonButtonView6, emoticonButtonView7, emoticonButtonView8, emoticonButtonView9].forEach {
            buttonListView.addSubview($0)
        }
        
        addSubview(buttonListView)
    }
    
    override func setConstraint() {
        
        buttonListView.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.9)
            make.height.equalTo(self).multipliedBy(0.9)
        }
        
        configureButtonViewSize()
        
        emoticonButtonView.snp.makeConstraints { make in
            make.top.leading.equalTo(buttonListView)
        }
        emoticonButtonView2.snp.makeConstraints { make in
            make.centerX.equalTo(buttonListView)
            make.centerY.equalTo(emoticonButtonView)
        }
        emoticonButtonView3.snp.makeConstraints { make in
            make.top.trailing.equalTo(buttonListView)
        }
        emoticonButtonView4.snp.makeConstraints { make in
            make.centerX.equalTo(emoticonButtonView)
            make.centerY.equalTo(buttonListView)
        }
        emoticonButtonView5.snp.makeConstraints { make in
            make.centerX.equalTo(buttonListView)
            make.centerY.equalTo(buttonListView)
        }
        emoticonButtonView6.snp.makeConstraints { make in
            make.centerX.equalTo(emoticonButtonView3)
            make.centerY.equalTo(buttonListView)
        }
        emoticonButtonView7.snp.makeConstraints { make in
            make.centerX.equalTo(emoticonButtonView4)
            make.bottom.leading.equalTo(buttonListView)
        }
        emoticonButtonView8.snp.makeConstraints { make in
            make.centerX.equalTo(buttonListView)
            make.centerY.equalTo(emoticonButtonView7)
        }
        emoticonButtonView9.snp.makeConstraints { make in
            make.centerX.equalTo(emoticonButtonView6)
            make.centerY.equalTo(emoticonButtonView7)
        }
    }
    
    private func configureButtonViewSize() {
        let buttonViewList = [emoticonButtonView, emoticonButtonView2, emoticonButtonView3, emoticonButtonView4, emoticonButtonView5, emoticonButtonView6, emoticonButtonView7, emoticonButtonView8, emoticonButtonView9]
        
        for btnView in buttonViewList {
            btnView.snp.makeConstraints { make in
                make.width.equalTo(buttonListView).multipliedBy(0.3)
                make.height.equalTo(buttonListView).multipliedBy(0.3)
            }
        }
    }
}

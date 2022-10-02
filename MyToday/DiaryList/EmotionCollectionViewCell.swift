//
//  EmotionCollectionViewCell.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/20.
//

import UIKit
import SnapKit

class EmotionCollectionViewCell: BaseCollectionViewCell {
    
    let emotionLabel: UILabel = {
        let view = UILabel()
        view.backgroundColor = UIColor(red: 34/255, green: 166/255, blue: 179/255, alpha: 0.5)
        view.textAlignment = .center
        view.layer.cornerRadius = 8
        view.layer.masksToBounds = true
        view.font = Constants.BaseFont.DiaryList.emotion
        return view
    }()
    
    override func configureUI() {
        addSubview(emotionLabel)
    }
    
    override func setConstraint() {
        emotionLabel.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    func setCellDate(emotionLabel: String) {
        self.emotionLabel.text = emotionLabel
    }
}


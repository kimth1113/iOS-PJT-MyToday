//
//  EmotionCollectionViewCell.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/20.
//

import UIKit
import SnapKit

class EmotionCollectionViewCell: BaseCollectionViewCell {
    
    let emoticonButtonView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .systemYellow
        view.layer.cornerRadius = 30
        view.layer.masksToBounds = true
        return view
    }()
    
    override func configureUI() {
        addSubview(emoticonButtonView)
    }
    
    override func setConstraint() {
        emoticonButtonView.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
    }
    
    func setCellDate(indexPath: IndexPath) {
        emoticonButtonView.customImageView.image = Constants.BaseImage.emotion[indexPath.row + 1]
    }
}


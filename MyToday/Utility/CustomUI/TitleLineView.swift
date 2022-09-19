//
//  TitleLineView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/14.
//

import UIKit
import SnapKit

class TitleLineView: BaseView {
    
    let leftLineView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "spring")
        view.contentMode = .scaleToFill
        view.tintColor = .black
        return view
    }()
    
    let rightLineView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        return view
    }()
    
    let titleLabel: UILabel = {
        let view = UILabel()
        view.text = "SEP\n14"
        view.font = Constants.BaseFont.Calendar.header
        view.numberOfLines = 0
        view.textAlignment = .center
        view.textColor = .black
        view.backgroundColor = .white
        view.layer.cornerRadius = 10
        view.layer.masksToBounds = true
//        view.layer.opacity = 0.5
        return view
    }()
    
    override func configureUI() {
        [leftLineView, rightLineView, titleLabel].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {

        titleLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.centerY.equalTo(self)
            make.width.equalTo(titleLabel.snp.height)
        }
        
        leftLineView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.leading.equalTo(self)
            make.trailing.equalTo(titleLabel.snp.leading).offset(-10)
            make.height.equalTo(titleLabel.snp.height).multipliedBy(0.3)
        }
        
        rightLineView.snp.makeConstraints { make in
            make.centerY.equalTo(self)
            make.trailing.equalTo(self)
            make.leading.equalTo(titleLabel.snp.trailing).offset(12)
            make.height.equalTo(titleLabel.snp.height).multipliedBy(0.3)
        }
        
    }
}

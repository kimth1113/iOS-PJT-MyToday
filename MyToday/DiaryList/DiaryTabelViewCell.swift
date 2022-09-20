//
//  DiaryTabelViewCell.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/20.
//

import UIKit
import SnapKit

class DiaryTableViewCell: BaseTableViewCell {

    let diaryImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        view.layer.opacity = 1
        view.alpha = 0.04
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let dateLabel: UILabel = {
        let view = UILabel()
        view.numberOfLines = 2
        view.textColor = .white
        return view
    }()
    
    let emoticonImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.cornerRadius = 8
        return view
    }()
    
    let topView: UIView = {
        let view = UIView()
        return view
    }()
    
    
    let diaryContentView: UIView = {
        let view = UIView()
        return view
    }()
    
    let diaryContentLabel: UILabel = {
        let view = UILabel()
        view.text = "sdlkfjsldkfjsdlkfjsldkfjsdlkfjsldkfjsdlkfjsldkfjsdlkfjsldkfjsdlkfjsldkfjsdlkfjsldkfjsdlkfjsldkfjsdlkfjsldkfjsldkfjsdlkfjsldkfjsdlkfjsldkfjsdlkfjsldkfjsdlkfjsldkfjsdlkfjsldkfj"
        view.textColor = .white
        view.numberOfLines = 0
        return view
    }()
    
    lazy var bottomView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [diaryContentView])
        view.axis = .horizontal
        view.alignment = .fill
        view.spacing = 8
        return view
    }()
    
    lazy var verticalStackView: UIStackView = {
        let view = UIStackView(arrangedSubviews: [topView, bottomView])
        view.axis = .vertical
        view.backgroundColor = .black
        view.layer.opacity = 0.7
        view.alignment = .fill
        view.layer.cornerRadius = 8
        view.spacing = 0
        view.layer.masksToBounds = true
        return view
    }()
    
    let separatorImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    override func configureUI() {
        backgroundColor = .clear
        selectionStyle = .none
        
        [dateLabel, emoticonImageView].forEach {
            topView.addSubview($0)
        }
        
        diaryContentView.addSubview(diaryContentLabel)
        
        addSubview(verticalStackView)
        verticalStackView.addSubview(diaryImageView)
    }
    
    override func setConstraint() {
        
        verticalStackView.snp.makeConstraints { make in
            make.top.bottom.equalTo(self).inset(8)
            make.leading.trailing.equalTo(self).inset(8)
        }
        
        diaryImageView.snp.makeConstraints { make in
            make.edges.equalTo(verticalStackView)
        }
        
        topView.snp.makeConstraints { make in
            make.height.equalTo(64)
        }
        
        bottomView.snp.makeConstraints { make in
            make.height.lessThanOrEqualTo(108)
            make.leading.trailing.equalTo(verticalStackView).inset(16)
            make.bottom.equalTo(verticalStackView).offset(-8)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.leading.equalTo(topView).offset(8)
            make.centerY.equalTo(topView)
        }
        
        emoticonImageView.snp.makeConstraints { make in
            make.trailing.equalTo(topView).inset(16)
            make.centerY.equalTo(topView)
            make.height.equalTo(dateLabel)
            make.width.equalTo(emoticonImageView.snp.height)
        }
        
        diaryContentLabel.snp.makeConstraints { make in
            make.top.leading.trailing.equalTo(diaryContentView).inset(8)
            make.bottom.lessThanOrEqualTo(diaryContentView).offset(-8)
        }
        
        diaryImageView.snp.makeConstraints { make in
            make.width.equalTo(100)
            
        }
        
    }
}

//
//  UpdateContentView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/14.
//

import UIKit
import SnapKit

class UpdateView: BaseView {
    
    let logoLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = Constants.BaseFont.Read.header
        view.text = "나는오늘?"
        view.numberOfLines = 2
        view.textAlignment = .center
        return view
    }()
    
    let dateLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = Constants.BaseFont.Read.date
        view.text = "DATE : 2022. 09. 18. (일요일)"
        view.numberOfLines = 2
        view.textAlignment = .center
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()

    let emotionLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = Constants.BaseFont.Read.label
        view.text = "\"어떤 하루였나요?\""
        view.numberOfLines = 2
        view.textAlignment = .center
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    
    let emoticonView: EmotionListView = {
        let view = EmotionListView()
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let imageLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = Constants.BaseFont.Read.label
        view.text = "\"사진 한장 가져오기\""
        view.numberOfLines = 2
        view.textAlignment = .center
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let imageView: CustomButtonView = {
        let view = CustomButtonView()
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.black.cgColor
        view.customButton.setImage(UIImage(systemName: "plus"), for: .normal)
        view.layer.borderWidth = 1
        view.customButton.tintColor = .white
        view.customImageView.contentMode = .scaleAspectFill
        view.customImageView.layer.masksToBounds = true
        return view
    }()

    let contentLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = Constants.BaseFont.Read.label
        view.text = "\"나는 오늘\""
        view.numberOfLines = 2
        view.textAlignment = .center
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        return view
    }()
    
    let contentView: WriteDiaryView = {
        let view = WriteDiaryView()
        view.layer.borderColor = UIColor.black.cgColor
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 4
        return view
    }()
    
    override func configureUI() {
        backgroundColor = UIColor(rgb: 0xfaf4e4)
        
        [logoLabel, dateLabel, emotionLabel, emoticonView, imageLabel, imageView, contentLabel, contentView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        self.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom).offset(60)
        }
                
        logoLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(self).offset(40)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).offset(20)
            make.centerX.equalTo(self)
            make.width.equalTo(self).multipliedBy(0.8)
            make.height.equalTo(36)
        }
            
        emotionLabel.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(dateLabel)
            make.height.equalTo(24)
        }
        
        emoticonView.snp.makeConstraints { make in
            make.top.equalTo(emotionLabel.snp.bottom).offset(12)
            make.leading.trailing.equalTo(emotionLabel)
            make.height.equalTo(emoticonView.snp.width)
        }
        
        imageLabel.snp.makeConstraints { make in
            make.top.equalTo(emoticonView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(dateLabel)
            make.height.equalTo(24)
        }
        
        imageView.snp.makeConstraints { make in
            make.top.equalTo(imageLabel.snp.bottom).offset(12)
            make.leading.trailing.equalTo(imageLabel)
            make.height.equalTo(imageView.snp.width)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(20)
            make.leading.trailing.equalTo(dateLabel)
            make.height.equalTo(28)
        }
        
        contentView.snp.makeConstraints { make in
            make.top.equalTo(contentLabel.snp.bottom).offset(12)
            make.leading.trailing.equalTo(dateLabel)
            make.height.greaterThanOrEqualTo(40)
        }
    }
}























//Setting


//

//writeDiaryLabel.snp.makeConstraints { make in
//    make.top.equalTo(selectImageView.snp.bottom).offset(20)
//    make.leading.equalTo(selectImageView)
//}
//
//writeDiaryView.snp.makeConstraints { make in
//    make.top.equalTo(writeDiaryLabel.snp.bottom).offset(12)
//    make.centerX.equalTo(self)
//    make.width.equalTo(selectImageView)
//    make.height.greaterThanOrEqualTo(120)
//}
//
//emptyView.snp.makeConstraints { make in
//    make.top.equalTo(writeDiaryView.snp.bottom).offset(12)
//    make.height.equalTo(300)
//    make.width.equalTo(self).multipliedBy(0.8)
//}

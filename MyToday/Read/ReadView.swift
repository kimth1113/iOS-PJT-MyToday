//
//  ReadView.swift
//  MyToday
//
//  Created by 김태현 on 2022/09/18.
//

import UIKit
import SnapKit

class ReadView: BaseView {
    
    let backgroundImage: UIImageView = {
        let view = UIImageView()
        view.image = Constants.BaseImage.scrollBackground
        view.contentMode = .scaleAspectFill
        return view
    }()
    
    let backButtonView: CustomButtonView = {
        let view = CustomButtonView()
        view.customImageView.image = UIImage(systemName: "arrow.backward")
        view.tintColor = .black
        return view
    }()
    
    let saveButtonView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .black
        return view
    }()
    
    let logoLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = Constants.BaseFont.Read.header
        view.text = "나의 소중했던.."
        view.numberOfLines = 2
        view.textAlignment = .center
        view.layer.opacity = 0.7
        return view
    }()
    
    let dateLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = Constants.BaseFont.Read.date
        view.numberOfLines = 2
        view.textAlignment = .center
        view.layer.opacity = 0.7
        return view
    }()
    
    let underline: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.layer.opacity = 0.7
        view.layer.cornerRadius = 2
        return view
    }()
    
    let emoticonView: CustomButtonView = {
        let view = CustomButtonView()
        view.backgroundColor = .white
        view.layer.opacity = 0.3
        view.layer.cornerRadius = 4
        return view
    }()
    
    let emoticonChangeButton: UIButton = {
        let view = UIButton()
        view.setTitle("감정 등록", for: .normal)
        view.setTitleColor(.white, for: .normal)
        view.backgroundColor = UIColor(rgb: 0x0984e3)
//        view.layer.borderWidth = 4
        view.layer.cornerRadius = 4
        view.layer.opacity = 0.7
        view.layer.masksToBounds = true
        return view
    }()
    
    let imageView: CustomButtonView = {
        let view = CustomButtonView()
        view.layer.cornerRadius = 4
        view.layer.borderColor = UIColor.black.cgColor
//        view.layer.borderWidth = 1
        view.backgroundColor = .black
        return view
    }()
    
    
    let contentBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.opacity = 0.5
        return view
    }()
    
    let contentView: UITextView = {
        let view = UITextView()
        view.font = Constants.BaseFont.Read.content
        view.backgroundColor = .clear
        return view
    }()
    
    override func configureUI() {
        [backgroundImage, backButtonView, saveButtonView, logoLabel, dateLabel, underline, emoticonView, emoticonChangeButton, imageView, contentBackgroundView, contentView].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraint() {
        
        backgroundImage.snp.makeConstraints { make in
            make.edges.equalTo(self)
        }
        
        backButtonView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(12)
            make.leading.equalTo(safeAreaLayoutGuide).offset(20)
            make.width.height.equalTo(32)
        }
        
        saveButtonView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(12)
            make.trailing.equalTo(safeAreaLayoutGuide).inset(20)
            make.width.height.equalTo(32)
        }
        
        logoLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(safeAreaLayoutGuide).offset(44)
        }
        
        dateLabel.snp.makeConstraints { make in
            make.top.equalTo(logoLabel.snp.bottom).offset(8)
            make.centerX.equalTo(self)
        }
        
        underline.snp.makeConstraints { make in
            make.top.equalTo(dateLabel.snp.bottom).offset(20)
            make.leading.trailing.equalTo(self).inset(20)
            make.height.equalTo(4)
        }
            
        emoticonChangeButton.snp.makeConstraints { make in
            make.bottom.equalTo(imageView)
            make.leading.equalTo(self).offset(20)
            make.width.equalTo(108)
            make.top.equalTo(emoticonView.snp.bottom).offset(4)
        }
        
        emoticonView.snp.makeConstraints { make in
            make.top.equalTo(imageView)
            make.leading.equalTo(self).offset(20)
            make.width.equalTo(108)
            make.height.equalTo(emoticonView.snp.width).multipliedBy(0.75)
        }
            
        imageView.snp.makeConstraints { make in
            make.top.equalTo(underline.snp.bottom).offset(12)
            make.trailing.equalTo(self).inset(20)
            make.height.equalTo(108)
            make.width.equalTo(imageView.snp.height)
        }
        
        contentBackgroundView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(12)
            make.leading.equalTo(emoticonView)
            make.trailing.equalTo(imageView)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(20)
        }

        contentView.snp.makeConstraints { make in
            make.top.bottom.leading.trailing.equalTo(contentBackgroundView).inset(4)
        }
    }
}

